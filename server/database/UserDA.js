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

UserDA.prototype.event_get_event_this_week = function (data, callback) {
    return this.dbModel.query_callback_object("call event_get_event_this_week()", [], callback);
}

UserDA.prototype.event_user_send_score = function (data, callback) {
    return this.dbModel.query_callback_object("call event_user_send_score(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id, data.rest_id, data.score], callback);
}

UserDA.prototype.event_user_send_score_multi = function (data, callback) {
    return this.dbModel.query_callback_object("call event_user_send_score_multi(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.scores], callback);
}

UserDA.prototype.event_rank_get_global_total_score = function (data, callback) {
    return this.dbModel.query_callback_array("call event_rank_get_global_total_score(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id, data.rest_id, data.page || 0], callback);
}
UserDA.prototype.event_rank_get_global_best_score = function (data, callback) {
    return this.dbModel.query_callback_array("call event_rank_get_global_best_score(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id, data.rest_id, data.page || 0], callback);
}
UserDA.prototype.event_rank_get_team_total_score = function (data, callback) {
    return this.dbModel.query_callback_array("call event_rank_get_team_total_score(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id, data.rest_id, data.page || 0], callback);
}

UserDA.prototype.event_rank_get_global_total_score_lite = function (data, callback) {
    return this.dbModel.query_callback_array("call event_rank_get_global_total_score_lite(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id, data.rest_id, data.page || 0], callback);
}
UserDA.prototype.event_rank_get_global_best_score_lite = function (data, callback) {
    return this.dbModel.query_callback_array("call event_rank_get_global_best_score_lite(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id, data.rest_id, data.page || 0], callback);
}
UserDA.prototype.event_rank_get_team_total_score_lite = function (data, callback) {
    return this.dbModel.query_callback_array("call event_rank_get_team_total_score_lite(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id, data.rest_id, data.page || 0], callback);
}


UserDA.prototype.event_rank_get_me = function (data, callback) {
    return this.dbModel.query_callback_object("call event_rank_get_me(?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id], callback);
}

UserDA.prototype.event_get_reward = function (data, callback) {
    return this.dbModel.query_callback_array("call event_get_reward(?,?,?,?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id, data.event_id, data.rest_id, data.rank_type], callback);
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
UserDA.prototype.user_info_get_list = function (data, callback) {
    return this.dbModel.query_callback_object("call user_info_get_list_facebook(?)", [data.user_ids], callback);
}




UserDA.prototype.team_info_get_list = function (data, callback) {
    return this.dbModel.query_callback_object("call team_info_get_list(?)", [data.team_ids], callback);
}


UserDA.prototype.friend_get_all = function (data, callback) {
    return this.dbModel.query_callback_object("call friend_get_all(?,?,?,?)", [data.user_id, data.username, data.login_type, data.device_id], callback);
}

UserDA.prototype.invite_get_short_link = function(data,callback) {
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

UserDA.prototype.event_ct_add_multi = function (data, callback) 
{
    return this.dbModel.query_callback_object("call event_ct_add_multi(?,?)", [data.user_id, data.list_score], callback);
}
UserDA.prototype.event_ct_set_get_user_rest = function (data, callback) 
{
    return this.dbModel.query_callback_object("call event_ct_set_get_user_rest(?,?,?,?)", [data.user_id, data.event_id, data.rest_id, data.force_set], callback);
}
UserDA.prototype.event_ct_get_current = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_get_current()", [], callback);
}
UserDA.prototype.event_ct_get_leaderboard = function (data, callback) {
    return this.dbModel.query_callback_array("call event_ct_get_leaderboard(?,?)", [data.user_id, data.event_id], callback);
}

UserDA.prototype.event_ct_get_leaderboard_champions = function (data, callback) {
    return this.dbModel.query_callback_array("call event_ct_get_leaderboard_champions(?,?)", [ data.event_id,data.page||0], callback);
}

UserDA.prototype.event_ct_get_leaderboard_champion_me = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_get_leaderboard_champion_me(?,?)", [data.user_id, data.event_id], callback);
}

UserDA.prototype.event_ct_get_event_info = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_get_event_info(?)", [data.event_id], callback);
}

UserDA.prototype.event_ct_get_reward = function (data, callback) {
    return this.dbModel.query_callback_array("call event_ct_get_reward(?)", [data.event_id], callback);
}
UserDA.prototype.event_ct_set_claim_unlock = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_set_claim_unlock(?,?)", [data.user_id, data.event_id], callback);
}
UserDA.prototype.event_ct_get_reward_config = function (data, callback) {
    return this.dbModel.query_callback_array("call event_ct_get_reward_config(?,?)", [data.user_id, data.event_id], callback);
}
UserDA.prototype.event_ct_get_reward_events = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_get_reward_events(?)", [data.user_id], callback);
}
UserDA.prototype.event_ct_claim_reward_event = function (data, callback) {
    return this.dbModel.query_callback_object("call event_ct_claim_reward_event(?,?)", [data.user_id, data.event_id], callback);
}
UserDA.prototype.team_chat_send_message_system = function (data, callback) {
    return this.dbModel.query_callback_object("call team_chat_send_message_system(?,?,?,?,?)", [data.user_id, data.team_id, data.msg, data.request_type, data.data_ext], callback);
}
UserDA.prototype.team_claim_system_gift = function (data, callback) {
    return this.dbModel.query_callback_object("call team_claim_system_gift(?,?,?)", [data.user_id, data.team_id, data.request_id], callback);
}