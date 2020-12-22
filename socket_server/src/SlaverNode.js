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

var SlaverNode = function(game_server){
    this.game_server = game_server;
    this.socket_io = game_server.socket_io;

    this.ConfigDA = new _ConfigDA(this.game_server);
}

SlaverNode.prototype.reloadAllConfig = function () {
    this.reloadSystemConfig();
}

SlaverNode.prototype.reloadSystemConfig = function(){
    var self = this;
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
                       config.system_config[configX.ckey] =eval(configX.cvalue);
                   }

                   is_updated = true;

                   if(configX.ckey == "config_reload_config_version")
                   {
                       self.config_reload_config_version();
                   }

                   if(configX.ckey == "config_reload_config_i18n")
                   {
                       self.config_reload_config_i18n();
                   }


                   if(configX.ckey == "config_reload_config_lucky_spin")
                   {
                       self.config_lucky_spin_get_setting();
                   }



           }

        });
}


SlaverNode.prototype.config_reload_config_version = function(){
    var self = this;
    this.ConfigDA.config_get_config_version({},function dbcallback_config_get_config_version(err,data){
        if(err || !data){
            return;
        }
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

    });
}

SlaverNode.prototype.config_reload_config_i18n = function(){
    console.log("SlaverNode config_reload_config_i18n");
    var self = this;
    this.ConfigDA.config_get_config_i18n({},function dbcallback_config_get_config_i18n(err,data) {
        if (err || !data) {
            return;
        }
        config.i18ns = data;
    });
}




module.exports = SlaverNode;