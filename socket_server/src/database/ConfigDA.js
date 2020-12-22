/**
 * Created by luckyman on 8/29/17.
 */
"use strict";

var _DBModel = require("./../shared_class/db_models/DBModel.js");

var ConfigDA = function(game_server){
    this.game_server = game_server;
    this.dbModel = new _DBModel(game_server.dbclient);
}

module.exports = ConfigDA;

ConfigDA.prototype.config_get_config_version = function(data,callback)
{
    this.dbModel.query_callback_array("call config_get_config_version()"
        ,[

        ]
        ,callback);
}


ConfigDA.prototype.config_get_system_config = function(data,callback)
{
    this.dbModel.query_callback_array("call config_get_system_config()"
        ,[

        ]
        ,callback);
}

ConfigDA.prototype.system_auto_broadcast_event = function(data,callback){
    this.dbModel.query_callback_array("call system_auto_broadcast_event()"
        ,[]
        ,callback);
}

ConfigDA.prototype.system_slave_connect = function(data,callback){
    this.dbModel.query_callback_array("call system_slave_connect(?,?)"
        ,[data.node_id||0
        ,data.socket_id]
        ,callback);
}
ConfigDA.prototype.system_slave_disconnect = function(data,callback){
    this.dbModel.query_callback_array("call system_slave_disconnect(?,?)"
        ,[data.node_id||0
            ,data.socket_id]
        ,callback);
}
