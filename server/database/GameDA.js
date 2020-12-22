"use strict";
var _DBModel = require("./../shared_class/db_models/DBModel.js");

var GameDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = GameDA;

GameDA.prototype.event_popup_get = function(data,callback){
    return this.dbModel.query_callback_array("call event_popup_get(?,?,?)", [data.user_id, data.os,data.version], callback);
}
GameDA.prototype.event_popup_callback = function(data,callback){
    return this.dbModel.query_callback_object("call event_popup_callback(?,?,?)", [data.user_id, data.event_id,data.callback_data], callback);
}

GameDA.prototype.event_popup_claim = function(data,callback){
    return this.dbModel.query_callback_object("call event_popup_claim(?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.reward_code,data.event_id], callback);
}