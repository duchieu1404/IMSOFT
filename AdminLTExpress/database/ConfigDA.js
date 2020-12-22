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



ConfigDA.prototype.admin_event_popup_get_all = function(data,callback){
    return this.dbModel.query_callback_array("call admin_event_popup_get_all()", [], callback);
}


ConfigDA.prototype.admin_event_popup_save = function(data,callback){
    return this.dbModel.query_callback_array("call admin_event_popup_save(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [
        data.admin_id,
        data.id,
        data.os_type,
        data.version,
        data.show_from,
        data.show_to,
        data.check_type,
        data.force_view,
        data.asset_url,
        data.bundle_name,
        data.status,
        data.note,
        data.promote_iap_cnf,
        data.promote_bundle_cnf,
        data.img_url,
        data.data,
        data.template_type,
        data.order_by,
        data.show_map_count,
        data.only_users,
        data.ignore_users,
        data.show_condition
    ], callback);
}


ConfigDA.prototype.admin_event_popup_delete = function(data,callback){
    return this.dbModel.query_callback_object("call admin_event_popup_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}

ConfigDA.prototype.admin_event_gcc_get_all = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_gcc_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_gcc_delete = function (data, callback) 
{
    return this.dbModel.query_callback_object("call admin_event_gcc_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_gcc_save = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_gcc_save(?,?,?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to,
        data.rest_ids,
        data.evt_copy
    ], callback);
}

ConfigDA.prototype.event_gcc_insert_test_data = function (data, callback) {
    return this.dbModel.query_callback_object("call event_gcc_insert_test_data(?,?)", [
        data.event_id,
        data.rest_id,
    ], callback);
}

ConfigDA.prototype.admin_event_ct_get_all = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_ct_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_ct_delete = function (data, callback) {
    return this.dbModel.query_callback_object("call admin_event_ct_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_ct_save = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_ct_save(?,?,?,?,?,?,?,?,?,?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to,
        data.count_by,
        data.join_require,
        data.join_reward,
        data.has_all_boost,
        data.max_rest_id,
        data.time_show_from,
        data.time_show_to,
        data.evt_popup_copy,
        data.champion_rest
    ], callback);
}

ConfigDA.prototype.admin_event_ct_add_score = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_add_multi(?,?)", [
        data.user_id,
        data.list_score
    ], callback);
}
ConfigDA.prototype.admin_event_ct_insert_test_data = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_insert_test_data(?,?)", [
        data.event_id,
        data.rest_id
    ], callback);
}

