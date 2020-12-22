"use strict";

var _DBModel = require("../shared_class/db_models/DBModel.js");

var UserDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = UserDA;

UserDA.prototype.admin_search_user = function(data,callback){
    return this.dbModel.query_callback_array("call admin_search_user_with_spent(?,?,?,?,?,?,?)", [
        data.admin_id,
        data.user_id,
        data.fullname,
        data.device_id,
        data.min_spent,
        data.offset,
        data.limit
    ], callback);
}



UserDA.prototype.admin_delete_user = function(data,callback){
    return this.dbModel.query_callback_object("call admin_delete_user(?,?)", [
        data.admin_id,
        data.user_id
    ], callback);
}



UserDA.prototype.admin_list_email = function(data,callback){
    return this.dbModel.query_callback_object("call admin_list_email(?,?)", [
        data.admin_id,
        data.user_id
    ], callback);
}

UserDA.prototype.admin_delete_email = function(data,callback){
    return this.dbModel.query_callback_object("call admin_delete_email(?,?)", [
        data.admin_id,
        data.user_id
    ], callback);
}

UserDA.prototype.admin_send_email = function(data,callback){
    return this.dbModel.query_callback_object("call admin_send_email(?,?,?,?,?,?,?,?)", [
        data.admin_id,
        data.user_id,
        data.title,
        data.content,
        data.sent_by,
        data.gift,
        data.email_type,
        data.time_expire
    ], callback);
}

UserDA.prototype.admin_send_email_multi = function(data,callback){
    return this.dbModel.query_callback_object("call admin_send_email_multi(?,?,?,?,?,?,?,?)", [
        data.admin_id,
        data.user_ids,
        data.title,
        data.content,
        data.sent_by,
        data.gift,
        data.email_type,
        data.time_expire
    ], callback);
}


UserDA.prototype.admin_user_gem_log  = function(data,callback){
    return this.dbModel.query_callback_array("call admin_user_gem_log(?,?,?)", [
        data.admin_id,
        data.user_id,
        data.page ||0
    ], callback);
}

UserDA.prototype.admin_email_list_get = function(data,callback){
    return this.dbModel.query_callback_array("call admin_email_list_get(?,?,?)", [
        data.admin_id,
        data.user_id,
        data.page ||0
    ], callback);
}

UserDA.prototype.admin_get_all_user_data = function(data,callback){
    return this.dbModel.query_callback_object("call admin_get_all_user_data(?,?)", [
        data.admin_id,
        data.user_id
    ], callback);
}



