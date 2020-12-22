
"use strict";

var _DBModel = require("./../shared_class/db_models/DBModel.js");

var BroadcastDA = function(game_server){
    this.game_server = game_server;
    this.dbModel = new _DBModel(game_server.dbclient);
}

module.exports = BroadcastDA;

BroadcastDA.prototype.broadcast_message_get_all = function(data,callback){
    this.dbModel.query_callback_object("call broadcast_message_get_all()"
        ,[]
        ,callback);}