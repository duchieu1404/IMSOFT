"use strict";

var _DBModel = require("../shared_class/db_models/DBModel.js");

var ConfigDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = ConfigDA;

ConfigDA.prototype.admin_config_data_sync_type_get_all = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_config_data_sync_type_get_all()", [], callback);
}

ConfigDA.prototype.admin_config_data_sync_category_save = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_config_data_sync_category_save(?,?,?,?)", [
        data.admin_id,
        data.id,
        data.name,
        data.description
    ], callback);
}

ConfigDA.prototype.admin_config_data_sync_category_get_all = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_config_data_sync_category_get_all()", [], callback);
}



ConfigDA.prototype.admin_config_data_sync_type_save = function (data, callback) {
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


ConfigDA.prototype.admin_tester_get_all = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_tester_get_all()", [], callback);
}


ConfigDA.prototype.admin_tester_save = function (data, callback) {
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


ConfigDA.prototype.admin_tester_delete = function (data, callback) {
    return this.dbModel.query_callback_object("call admin_tester_delete(?,?)", [
        data.admin_id,
        data.tester_id
    ], callback);
}

ConfigDA.prototype.admin_event_fsc_get_all = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_fsc_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_fsc_delete = function (data, callback) {
    return this.dbModel.query_callback_object("call admin_event_fsc_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_fsc_save = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_fsc_save(?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to
    ], callback);
}

ConfigDA.prototype.admin_get_update_version = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_get_update_version()", [], callback);
}

ConfigDA.prototype.admin_update_version_save = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_update_version_save(?,?,?)", [
        data.id,
        data.version,
        data.status
    ], callback);
}

ConfigDA.prototype.admin_event_ft_get_all = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_ft_get_all()", [], callback);
}

ConfigDA.prototype.admin_event_ft_save = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_ft_save(?,?,?,?,?,?,?,?,?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to,
        data.time_show_to,
        data.max_user,
        data.rank1,
        data.rank2,
        data.rank3,
        data.rank_to7,
        data.rank_to20,
        data.rank_to40

    ], callback);
}

ConfigDA.prototype.admin_event_ft_save_test = function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_ft_save_test()", [
    ], callback);
}


ConfigDA.prototype.admin_event_ft_delete = function (data, callback) {
    return this.dbModel.query_callback_object("call admin_event_ft_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}


ConfigDA.prototype.event_ft_insert_test_data = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ft_insert_test_data(?)", [
        data.event_id
    ], callback);
}
