"use strict";

var _DBModel = require("../shared_class/db_models/DBModel.js");

var ConfigDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = ConfigDA;

ConfigDA.prototype.admin_config_data_sync_type_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_config_data_sync_type_get_all()", [], callback);
}

ConfigDA.prototype.admin_config_data_sync_category_save = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_config_data_sync_category_save(?,?,?,?)", [
        data.admin_id,
        data.id,
        data.name,
        data.description
    ], callback);
}

ConfigDA.prototype.admin_config_data_sync_category_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_config_data_sync_category_get_all()", [], callback);
}



ConfigDA.prototype.admin_config_data_sync_type_save = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_config_data_sync_type_save(?,?,?,?,?,?,?,?,?)", [
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


ConfigDA.prototype.admin_tester_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_tester_get_all()", [], callback);
}


ConfigDA.prototype.admin_tester_save = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_tester_save(?,?,?,?,?,?,?)", [
        data.admin_id,
        data.id,
        data.device_id,
        data.os_type,
        data.version,
        data.status,
        data.note
    ], callback);
}


ConfigDA.prototype.admin_tester_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_tester_delete(?,?)", [
        data.admin_id,
        data.tester_id
    ], callback);
}


// end lesss
ConfigDA.prototype.admin_event_EndlessTreasure_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_EndlessTreasure_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_EndlessTreasure_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_event_EndlessTreasure_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_EndlessTreasure_save = async function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_EndlessTreasure_save(?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to
    ], callback);
} 

ConfigDA.prototype.admin_event_EndlessTreasure_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_EndlessTreasure_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_EndlessTreasure_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_event_EndlessTreasure_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_EndlessTreasure_save = async function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_EndlessTreasure_save(?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to
    ], callback);
}


// 
ConfigDA.prototype.admin_event_pharmacy_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_pharmacy_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_pharmacy_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_event_pharmacy_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_pharmacy_save = async function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_pharmacy_save(?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to
    ], callback);
} 

ConfigDA.prototype.admin_event_pharmacy_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_pharmacy_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_pharmacy_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_event_pharmacy_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_pharmacy_save = async function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_pharmacy_save(?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to
    ], callback);
}

// racing
ConfigDA.prototype.admin_event_racing_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_racing_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_racing_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_event_racing_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_racing_save = async function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_racing_save(?,?,?,?,?,?,?,?)", [
        data.id,
        data.status,
        data.time_from, 
        data.time_to,
        data.time_show_to,
        data.time_show_from,
        data.max_user,
        data.id_event
    ], callback);
}
// end racing

ConfigDA.prototype.admin_event_ssp_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_ssp_get_all()", [], callback);
}
ConfigDA.prototype.admin_event_ssp_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_event_ssp_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_ssp_save = async function (data, callback) {
    console.log(data);
    return this.dbModel.query_callback_array("call admin_event_ssp_save(?,?,?,?,?,?,?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to,
        data.id_ssp,
        data.id_bundle,
        data.link_download,
        data.flag_download,
        data.version,
        data.platform
        // data.levelX3
    ], callback);
}

ConfigDA.prototype.admin_get_update_version = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_get_update_version()", [], callback);
}

ConfigDA.prototype.admin_update_version_save = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_update_version_save(?,?,?)", [
        data.id,
        data.version,
        data.status
    ], callback);
}

ConfigDA.prototype.admin_event_ft_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_ft_get_all()", [], callback);
}

ConfigDA.prototype.admin_event_ft_save = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_ft_save(?,?,?,?,?,?,?,?,?,?,?,?)", [
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

ConfigDA.prototype.admin_event_ft_save_test = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_ft_save_test()", [
    ], callback);
}


ConfigDA.prototype.admin_event_ft_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_event_ft_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}


ConfigDA.prototype.event_ft_insert_test_data = async function (data, callback) {
    return await this.dbModel.query_callback_object("call event_ft_insert_test_data(?)", [
        data.event_id
    ], callback);
}
 

ConfigDA.prototype.event_Racing_insert_test_data = async function (data, callback) {
    return await this.dbModel.query_callback_object("call event_Racing_insert_test_data(?)", [
        data.event_id
    ], callback);
}
 

ConfigDA.prototype.admin_event_bonus_data_get_all = async function (data, callback) {
    return await this.dbModel.query_callback_array("call admin_event_bonus_data_get_all()", [], callback);
}
ConfigDA.prototype.admin_bonus_data_delete = async function (data, callback) {
    return await this.dbModel.query_callback_object("call admin_bonus_data_delete(?,?)", [
        data.admin_id,
        data.event_id
    ], callback);
}
ConfigDA.prototype.admin_event_bonus_data_save = async function (data, callback) {
    return this.dbModel.query_callback_array("call admin_event_bonus_data_save(?,?,?,?,?,?,?,?,?,?,?)", [
        data.id,
        data.status,
        data.time_from,
        data.time_to,
        data.id_ssp,
        data.id_bundle,
        data.link_download,
        
        data.version,
        data.key_download,
        data.point_plus,
        data.level_x3
    ], callback);
}
 
