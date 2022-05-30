"use strict";

var _DBModel = require("./../shared_class/db_models/DBModel.js");

var UserDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = UserDA;

UserDA.prototype.user_login_by_device_id = function (data, callback) {
    return this.dbModel.query_callback_object("call user_login_by_device_id(?,?,?,?)", [data.device_id, data.user_id, data.client_info, data.basic_info], callback);
}

UserDA.prototype.user_login_by_cloud_username = function (data, callback) {
    return this.dbModel.query_callback_object("call user_login_by_cloud_username(?,?,?,?,?,?,?,?,?)", [data.login_type, data.username, data.fullname, data.token, data.user_id, data.device_id, data.client_info, data.basic_info, data.avatar_url], callback);
}

UserDA.prototype.user_sync_data = function (data, callback) {
    return this.dbModel.query_callback_object("call user_sync_data(?,?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.client_info || '{}', data.data_sync, data.is_force_update || 0, data.last_time_sync], callback);
}

UserDA.prototype.user_get_user_data = function (data, callback) {
    return this.dbModel.query_callback_object("call user_get_user_data(?,?)", [data.user_id, data.cates], callback);
}
UserDA.prototype.user_gem_change_log = function (data, callback) {
    return this.dbModel.query_callback_object("call user_gem_change_log (?,?,?,?,?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.change_type || 0, data.value, data.value_after, data.level, data.desc, data.detail, data.local_time], callback);
}

UserDA.prototype.user_gem_change_log_list = function (data, callback) {
    return this.dbModel.query_callback_object("call user_gem_change_log_list(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.list], callback);
}

UserDA.prototype.email_user_get = function (data, callback) {
    return this.dbModel.query_callback_object("call email_user_get(?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id], callback);
}


UserDA.prototype.email_user_read = function (data, callback) {
    return this.dbModel.query_callback_object("call email_user_read(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.email_id], callback);
}

UserDA.prototype.email_user_claim_gift = function (data, callback) {
    return this.dbModel.query_callback_object("call email_user_claim_gift(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.email_id], callback);
}

UserDA.prototype.email_user_claim_force_set = function (data, callback) {
    return this.dbModel.query_callback_object("call email_user_claim_force_set(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.email_id], callback);
}


UserDA.prototype.email_user_claim_force_set_success = function (data, callback) {
    return this.dbModel.query_callback_object("call email_user_claim_force_set_success(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.email_id], callback);
}


UserDA.prototype.email_user_check_has_mail = function (data, callback) {
    return this.dbModel.query_callback_object("call email_user_check_has_mail(?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id], callback);
}

UserDA.prototype.user_change_profile = function (data, callback) {
    return this.dbModel.query_callback_object("call user_change_profile(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.new_profile], callback);
}

UserDA.prototype.highscore_level_add = function (data, callback) {
    return this.dbModel.query_callback_object("call highscore_level_add(?,?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.rest_id, data.tier, data.level, data.score], callback);
}

UserDA.prototype.highscore_level_get_me = function (data, callback) {
    return this.dbModel.query_callback_object("call highscore_level_get_me(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.rest_id, data.tier, data.level], callback);
}
UserDA.prototype.event_ct_get_current = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_get_current()", [], callback);
}

UserDA.prototype.highscore_level_add_multi = function (data, callback) {
    return this.dbModel.query_callback_object("call highscore_level_add_multi(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.scores], callback);
}

UserDA.prototype.highscore_level_get_team = function (data, callback) {
    return this.dbModel.query_callback_array("call highscore_level_get_team(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.rest_id, data.tier, data.level], callback);
}

UserDA.prototype.highscore_level_get_friend = function (data, callback) {
    return this.dbModel.query_callback_array("call highscore_level_get_friend(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.rest_id, data.tier, data.level], callback);
}

UserDA.prototype.highscore_level_get_global = function (data, callback) {
    return this.dbModel.query_callback_object("call highscore_level_get_global(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.rest_id, data.tier, data.level], callback);
}

UserDA.prototype.user_ref_get = function (data, callback) {
    return this.dbModel.query_callback_object("call user_ref_get(?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id], callback);
}

UserDA.prototype.user_ref_claim = function (data, callback) {
    return this.dbModel.query_callback_object("call user_ref_claim(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.user_ref_id], callback);
}

UserDA.prototype.user_trophy_get = function (data, callback) {
    return this.dbModel.query_callback_array("call user_trophy_get(?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id], callback);
}

UserDA.prototype.user_test_check = function (data, callback) {
    return this.dbModel.query_callback_object("call user_test_check(?,?,?)", [data.os, data.device_id, data.version], callback);
}

UserDA.prototype.friend_add_facebook_friends = function (data, callback) {
    return this.dbModel.query_callback_object("call friend_add_facebook_friends(?,?)", [data.user_id, data.friend_fb_ids], callback);
}

UserDA.prototype.user_info_get_list = function (data, callback) {
    return this.dbModel.query_callback_object("call user_info_get_list(?)", [data.user_ids], callback);
}
UserDA.prototype.user_info_get_list_facebook = function (data, callback) {
    return this.dbModel.query_callback_object("call user_info_get_list_facebook(?)", [data.user_ids], callback);
}

UserDA.prototype.event_fsc_get_event_info_this_week = function (data, callback) {
    return this.dbModel.query_callback_object("call event_fsc_get_event_info_this_week()", [], callback);
}

UserDA.prototype.event_ft_get_current = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ft_get_current()", [], callback);
}

UserDA.prototype.event_ft_add_multi = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ft_add_multi(?,?)", [data.user_id, data.list_score], callback);
}

UserDA.prototype.event_ft_get_leaderboard = function (data, callback) {
    return this.dbModel.query_callback_array("call event_ft_get_leaderboard(?,?)", [data.event_id, data.user_id], callback);
}

// UserDA.prototype.event_ft_get_leaderboard_final = function (data, callback) {
//     return this.dbModel.query_callback_array("call event_ft_get_leaderboard_final(?,?)", [data.event_id, data.user_id], callback);
// }

UserDA.prototype.event_ft_get_reward = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ft_get_reward(?)", [data.event_id], callback);
}


UserDA.prototype.event_ft_claiming_reward = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ft_claiming_reward(?,?)", [data.event_id,data.user_id], callback);
}


UserDA.prototype.team_info_get_list = function (data, callback) {
    return this.dbModel.query_callback_object("call team_info_get_list(?)", [data.team_ids], callback);
}


UserDA.prototype.friend_get_all = function (data, callback) {
    return this.dbModel.query_callback_object("call friend_get_all(?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id], callback);
}

UserDA.prototype.invite_get_short_link = function (data, callback) {
    return this.dbModel.query_callback_object("call invite_get_short_link(?)", [data.ref_code], callback);
}

UserDA.prototype.invite_save_my_link = function (data, callback) {
    return this.dbModel.query_callback_object("call invite_save_my_link(?,?,?)", [data.ref_code, data.user_id, data.short_link], callback);
}
UserDA.prototype.invite_get_invite_me = function (data, callback) {
    return this.dbModel.query_callback_object("call invite_get_invite_me(?,?)", [data.user_id, data.ref_code], callback);
}

UserDA.prototype.invite_set_invite_me = function (data, callback) {
    return this.dbModel.query_callback_object("call invite_set_invite_me(?,?)", [data.user_id, data.ref_code], callback);
}

UserDA.prototype.invite_get_my_invited = function (data, callback) {
    return this.dbModel.query_callback_object("call invite_get_my_invited(?)", [data.user_id], callback);
}

UserDA.prototype.invite_claim_reward = function (data, callback) {
    return this.dbModel.query_callback_object("call invite_claim_reward(?,?)", [data.user_id, data.list_invited], callback);
}

UserDA.prototype.team_chat_send_message_system = function (data, callback) {
    return this.dbModel.query_callback_object("call team_chat_send_message_system(?,?,?,?,?)", [data.user_id, data.team_id, data.msg, data.request_type, data.data_ext], callback);
}
UserDA.prototype.team_claim_system_gift = function (data, callback) {
    return this.dbModel.query_callback_object("call team_claim_system_gift(?,?,?)", [data.user_id, data.team_id, data.request_id], callback);
}

UserDA.prototype.user_data_get_list_id = function (data, callback) {
    return this.dbModel.query_callback_object("call user_data_get_list_id(?)", [data.user_ids], callback);
}

UserDA.prototype.user_time_iap = function (data, callback) {
    return this.dbModel.query_callback_object("call user_time_iap(?)", [data.user_time], callback);
}

UserDA.prototype.user_update_version = function (data, callback) {
    return this.dbModel.query_callback_object("call user_update_version(?,?,?,?)", [data.user_id, data.device_id, data.need_force, data.version], callback);
}

UserDA.prototype.user_get_update_version = function (data, callback) {
    return this.dbModel.query_callback_object("call user_get_update_version()", [], callback);
}

UserDA.prototype.config_get_time_server = function (data, callback) {
    return this.dbModel.query_callback_object("call config_get_time_server()", [], callback);
}