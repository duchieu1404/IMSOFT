"use strict";
var _DBModel = require("./../shared_class/db_models/DBModel.js");

var TeamDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = TeamDA;


TeamDA.prototype.team_create = function(data,callback){
    return this.dbModel.query_callback_object("call team_create(?,?,?,?,?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.team_name,data.team_avatar_id,data.team_avatar_url,data.team_type,data.team_description,data.require_star||0], callback);
}
TeamDA.prototype.team_edit = function(data,callback){
    return this.dbModel.query_callback_object("call team_edit(?,?,?,?,?,?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.team_id,data.team_name,data.team_avatar_id,data.team_avatar_url,data.team_type,data.team_description,data.require_star||0], callback);
}

TeamDA.prototype.team_offer_join = function(data,callback){
    return this.dbModel.query_callback_array("call team_offer_join(?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id], callback);
}

TeamDA.prototype.team_search = function(data,callback){
    return this.dbModel.query_callback_array("call team_search(?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.name,data.page||0], callback);
}

TeamDA.prototype.team_join = function(data,callback){
    return this.dbModel.query_callback_object("call team_join(?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.team_id, data.confirmed||0], callback);
}

TeamDA.prototype.team_leave = function(data,callback){
    return this.dbModel.query_callback_object("call team_leave(?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.team_id, data.confirmed||0], callback);
}

TeamDA.prototype.team_get_info = function(data,callback){
    return this.dbModel.query_callback_object("call team_get_info(?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.team_id], callback);
}

TeamDA.prototype.team_top_country = function(data,callback){
    return this.dbModel.query_callback_object("call team_top_country(?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.country, data.page ||0], callback);
}
TeamDA.prototype.team_top_global = function(data,callback){
    return this.dbModel.query_callback_object("call team_top_global(?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id, data.page ||0], callback);
}



TeamDA.prototype.team_me = function(data,callback){
    return this.dbModel.query_callback_object("call team_me(?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id], callback);
}


TeamDA.prototype.team_request_accept = function(data,callback){
    return this.dbModel.query_callback_object("call team_request_accept(?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.team_id,data.user_id_request], callback);
}


TeamDA.prototype.team_request_reject = function(data,callback){
    return this.dbModel.query_callback_object("call team_request_reject(?,?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.team_id,data.user_id_request], callback);
}


TeamDA.prototype.team_request_cancel = function(data,callback){
    return this.dbModel.query_callback_object("call team_request_cancel(?,?,?,?,?)", [data.user_id, data.username,data.login_type, data.device_id,data.team_id], callback);
}

