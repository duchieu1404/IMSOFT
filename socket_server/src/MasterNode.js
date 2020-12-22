/**
 * Created by luckyman on 12/14/17.
 */
'use strict';

var config = require('./config/config.js');
var Constant = require('./config/constant.js');
var _ = require('lodash');
var crypt = require('./shared_class/crypt.js');

var async = require('async');
var HVKUtils = require('./shared_class/HVKUtils');


var _ConfigDA = require('./database/ConfigDA');
var _BroadcastDA = require('./database/BroadcastDA');

var MasterNode = function(game_server){
    this.game_server = game_server;
    this.socket_io = game_server.socket_io;

    this.socket_namespace_master = this.socket_io.of("/master_node");

    this.list_schedules = {
        scan_system_config:null,
        scan_auto_broadcast_message:null,
        scan_auto_event:null,
    };

    this.ConfigDA = new _ConfigDA(this.game_server);
    this.BroadcastDA = new _BroadcastDA(this.game_server);
    this.server_nodes = {};
    this.init_listener();
}


MasterNode.prototype.init_listener = function(){
    var self = this;

    this.socket_namespace_master.on('connection',function(client) {
        self.on_connect(client);
        console.log("Connected Master", client.id);
        HVKUtils.add_listener(client,Constant.SIO_EVENT_NAME.COMMON.disconnect,self.on_node_disconnect.bind(self));
        HVKUtils.add_listener(client,Constant.SIO_EVENT_NAME.COMMON.error,self.on_node_error.bind(self));
        HVKUtils.add_listener(client,"slave_node_connect",self.on_slave_node_connect.bind(self));

    });
}

MasterNode.prototype.on_connect = function(client){

}

MasterNode.prototype.on_node_disconnect = function(client,message){
    this.ConfigDA.system_slave_disconnect({
        node_id:client.node_id
        ,socket_id:client.id
    },function(err,data){
        console.log("on_node_disconnect",err,data);
    });

    this.server_nodes["n"+ client.node_id] = null;
}

MasterNode.prototype.on_node_error = function(client,message){
    console.log("MasterNode on_node_error", client.id,message);
}

MasterNode.prototype.on_slave_node_connect = function(client,message){
    var msgData = HVKUtils.parseInputToJSON(message);
    console.log("msgData on_slave_node_connect",msgData);
    client.node_id = msgData.node_id||-2;

    this.server_nodes["n"+ client.node_id] = client;
    this.ConfigDA.system_slave_connect({
        node_id:client.node_id
        ,socket_id:client.id
    },function(err,data){
        console.log("on_slave_node_connect",err,data);
    });
}


MasterNode.prototype.resetScheduleScanSystemConfig = function(){
    var self = this;
    if(this.list_schedules.scan_system_config!=null){
        clearInterval(this.list_schedules.scan_system_config);
    }
    this.list_schedules.scan_system_config = setInterval(function interval_scan_system_config(){
        self.ConfigDA.config_get_system_config({},function dbcallback_config_get_system_config(err,data){
            if(err || !data || data.length==0){
                return;
            }
            var is_updated = false;

           for( var confId in data ){
               var configX = data[confId];
               if(!configX || configX.cvalue == config.system_config[configX.ckey]) continue;

                   if(configX.type =='int'){
                       config.system_config[configX.ckey] =eval(configX.cvalue);
                   }else
                   {
                       config.system_config[configX.ckey] =configX.cvalue;
                   }

                   is_updated = true;
                   if(configX.ckey == "time_to_scan_system_config")
                   {
                       self.resetScheduleScanSystemConfig();
                   }

                   if(configX.ckey == "config_reload_config_version")
                   {
                       self.config_reload_config_version();
                   }


                    console.log("update config: ",configX.ckey,configX.cvalue );
           }

            if(is_updated)
            {
                self.socket_namespace_master.emit(Constant.SIO_EVENT_NAME.MASTER_SYNC.sync_system_config,
                    {
                        system_config:config.system_config
                    });
            }

        });
    },config.system_config.time_to_scan_system_config || 10000);

}

MasterNode.prototype.config_reload_config_version = function(){
    var self = this;
    this.ConfigDA.config_get_config_version({},function dbcallback_config_get_config_version(err,data){
        if(err || !data){
            return;
        }
        console.log("data",data);
        var is_update = false;
        for( var confId in data ) {
            var configX = data[confId];
            console.log("configX ", configX);
            console.log("config.config_version[configX.config_key]", config.config_version[configX.config_key], !configX || configX.config_version == config.config_version[configX.config_key]);
            if (!configX || configX.config_version == config.config_version[configX.config_key]) continue;
            config.config_version[configX.config_key] =configX.config_version;
            is_update = true;
            console.log("update_config_version ", configX.config_key, configX.config_version);

            if(configX.config_key == "i18n")
            {
                self.config_reload_config_i18n();
            }
        }
        if(is_update){
            self.socket_namespace_master.emit(Constant.SIO_EVENT_NAME.MASTER_SYNC.sync_config_version,
                {
                    config_version:config.config_version
                });
        }
    });
}


MasterNode.prototype.system_reload_auto_broadcast = function(){
    var self = this;
    if(this.list_schedules.scan_auto_event!=null){
        clearInterval(this.list_schedules.scan_auto_event);
    }
    this.list_schedules.scan_auto_event = setInterval(function interval_scan_system_config(){
        self.ConfigDA.system_auto_broadcast_event({},function(err,data){

            if(err||!data || data.length ==0){
                return;
            }
            for (var i = 0, len = data.length; i < len; i++) {

                self.do_master_broadcast_event(data[i]);
            }
        });
    },config.system_config.time_to_scan_scan_auto_event);
}

MasterNode.prototype.do_master_broadcast_event = function(eventObj) {
    try{
        var self = this;
        eventObj.data = HVKUtils.parseInputToJSON(eventObj.data);
        console.log("do_master_broadcast_event ",eventObj);
        if(eventObj.event_name == "force_logout_result"){
            return HVKUtils.broadcastRoomName(self.socket_io,eventObj.socket_room,eventObj.event_name,eventObj);
        }
        else
        {
            return HVKUtils.broadcastRoomName(self.socket_io,eventObj.socket_room,eventObj.event_name,eventObj);
        }
    }catch(ex){
        console.log("ERR Master: do_master_broadcast_event",ex);
    }
}


MasterNode.prototype.system_reload_auto_broadcast_message = function(){
    var self = this;
    if(this.list_schedules.scan_auto_broadcast_message!=null){
        clearInterval(this.list_schedules.scan_auto_broadcast_message);
    }
    this.list_schedules.scan_auto_broadcast_message = setInterval(function interval_scan_system_config(){
        self.BroadcastDA.broadcast_message_get_all({},function(err,data){
            console.log("broadcast_message_get_all ",err,data);
            if(err||!data || !data.content || data.content == null){
                return;
            }
            console.log("br ",data);
            return HVKUtils.broadcastRoomName(self.socket_io,"*","broadcast_message_result",{status:0,msg:"OK",data:data});
        });
    },config.system_config.time_to_scan_auto_broadcast);
}


module.exports = MasterNode;