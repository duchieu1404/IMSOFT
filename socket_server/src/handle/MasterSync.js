
"use strict";

var config = require('./../config/config.js');
var crypt = require('./../shared_class/crypt.js');

var async = require('async');
var HVKUtils = require('./../shared_class/HVKUtils');
var Constant = require('./../config/constant.js');

var SocketClient = require('socket.io-client');


var MasterSync = function(){
    this.game_server = null;
    this.socket_io = null;
    this.socketMasterClient =null;
}

MasterSync.prototype.init_handle = function(game_server)
{
    this.game_server = game_server;
    this.socket_io = game_server.socket_io;

    this.init_listener();

    console.log("MasterSync.prototype.init_handle");
}

MasterSync.prototype.init_listener = function(){
    var self = this;
    if(this.socketMasterClient  && this.socketMasterClient.connected){
        try{
            this.socketMasterClient.disconnect(true);
        }catch(ex){

        }
    }

    this.socketMasterClient = SocketClient(config.system_config.master_node_url);
    this.socketMasterClient.on('connect', function() {
        console.log("socketMasterClient connected ",config.system_config.master_node_url );
        self.socketMasterClient.emit("slave_node_connect",{node_id:self.game_server.opts.node_id});
    });

    this.socketMasterClient.on('disconnect', function() {
        console.log("socketMasterClient disconnect ",config.system_config.master_node_url);
    });

    this.socketMasterClient.on('close', function() {
        console.log("socketMasterClient close ",config.system_config.master_node_url);
        setTimeout(function() {
            self.init_listener();
        }, 5000);
    });

    console.log("MasterSync.prototype.init_listener");

    HVKUtils.add_listener(this.socketMasterClient,Constant.SIO_EVENT_NAME.MASTER_SYNC.sync_system_config,self.on_sync_system_config.bind(self));
    HVKUtils.add_listener(this.socketMasterClient,Constant.SIO_EVENT_NAME.MASTER_SYNC.sync_config_version,self.on_sync_config_version.bind(self));


}

MasterSync.prototype.on_sync_system_config = function(client,message){
    var data = HVKUtils.parseInputToJSON(message);
    var old_master_node = config.system_config.master_node_url;
    config.system_config = data.system_config || config.system_config;

    if(old_master_node!= config.system_config.master_node_url){
        this.init_listener();
    }
}

MasterSync.prototype.on_sync_config_version = function(client,message){
    var data = HVKUtils.parseInputToJSON(message);
    config.config_version = data.config_version || config.config_version;
}

module.exports = MasterSync;
