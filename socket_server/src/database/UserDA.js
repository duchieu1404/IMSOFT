/**
 * Created by luckyman on 8/29/17.
 */
"use strict";

var _DBModel = require("./../shared_class/db_models/DBModel.js");

var UserDA = function(game_server){
    this.game_server = game_server;
    this.dbModel = new _DBModel(game_server.dbclient);
}


UserDA.prototype.socket_disconnect = function(data,callback){
    console.log("socket_disconnect ",data);
    this.dbModel.query_callback_object("call socket_disconnect(?,?,?,?)"
        ,[
             data.server_id
            ,data.user_id
            ,data.socket_id
            ,data.socket_type
        ]
        ,callback);
}

UserDA.prototype.user_connect_socket = function(data,callback){
    console.log("user_connect_socket ",data);
    this.dbModel.query_callback_object("call user_connect_socket(?,?,?,?,?,?,?,?,?,?,?,?)"
        ,[
             data.username
            ,data.login_type
            ,data.user_id
            ,data.device_id
            ,data.socket_id

            ,data.client_type || "UNK"
            ,data.client_version || "1.0"
            ,data.client_ip || ""

            ,data.server_node_id
            ,data.server_ip
            ,data.server_port
            ,data.socket_type

        ]
        ,callback);
}

UserDA.prototype.user_disconnect_socket = function(data,callback){
    console.log("socket_disconnect ",data);
    this.dbModel.query_callback_object("call user_disconnect_socket(?,?,?,?,?,?,?,?,?,?)"
        ,[
             data.username
            ,data.login_type
            ,data.user_id
            ,data.device_id

            ,data.socket_id

            ,data.server_node_id
            ,data.server_ip
            ,data.server_port

            ,data.socket_type
            ,data.client_ip || ""
        ]
        ,callback);
}

module.exports = UserDA;
