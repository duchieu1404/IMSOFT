"use strict";

var _DBModel = require("../shared_class/db_models/DBModel.js");

var ConfigDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = ConfigDA;

ConfigDA.prototype.admin_config_data_sync_type_get_all = function(data,callback){
    return this.dbModel.query_callback_array("call admin_config_data_sync_type_get_all()", [], callback);
}

ConfigDA.prototype.admin_config_data_sync_category_save = function(data,callback){
    return this.dbModel.query_callback_array("call admin_config_data_sync_category_save(?,?,?,?)", [
        data.admin_id,
        data.id,
        data.name,
        data.description
    ], callback);
}

ConfigDA.prototype.admin_config_data_sync_category_get_all = function(data,callback){
    return this.dbModel.query_callback_array("call admin_config_data_sync_category_get_all()", [], callback);
}



ConfigDA.prototype.admin_config_data_sync_type_save = function(data,callback){
    return this.dbModel.query_callback_array("call admin_config_data_sync_type_save(?,?,?,?,?,?,?,?,?)", [
        data.admin_id,
        data.id,
        data.key,
        data.code,
        data.cate_type,
        data.value_type,
        data.is_not_sync,
        data.level,
        data.description
    ], callback);
}


ConfigDA.prototype.admin_tester_get_all = function(data,callback){
    return this.dbModel.query_callback_array("call admin_tester_get_all()", [], callback);
}


ConfigDA.prototype.admin_tester_save = function(data,callback){
    return this.dbModel.query_callback_array("call admin_tester_save(?,?,?,?,?,?,?)", [
        data.admin_id,
        data.id,
        data.device_id,
        data.os_type,
        data.version,
        data.status,
        data.note
    ], callback);
}


ConfigDA.prototype.admin_tester_delete = function(data,callback){
    return this.dbModel.query_callback_object("call admin_tester_delete(?,?)", [
        data.admin_id,
        data.tester_id
    ], callback);
}

ConfigDA.prototype.admin_event_fsc_get_all = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_fsc_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_fsc_delete = function (data, callback) 
{
    return this.dbModel.query_callback_object("call admin_event_fsc_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_fsc_save = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_fsc_save(?,?,?,?,?)", [
        data.id,
        data.type,
        data.status,
        data.time_from,
        data.time_to
    ], callback);
}

