/**
 * Created by luckyman on 8/29/17.
 */
"use strict";

var _DBModel = require("./../shared_class/db_models/DBModel.js");

var TeamDA = function(game_server){
    this.game_server = game_server;
    this.dbModel = new _DBModel(game_server.dbclient);
}

TeamDA.prototype.team_join_topic = function(data,callback)
{
    this.dbModel.query_callback_object("call team_join_topic(?,?)"
        ,[
            data.user_id,
            data.topic_name
        ]
        ,callback);
}

TeamDA.prototype.team_leave_topic = function(data,callback)
{
    this.dbModel.query_callback_object("call team_leave_topic(?,?)"
        ,[
            data.user_id,
            data.topic_name
        ]
        ,callback);
}

TeamDA.prototype.team_get_current_message = function(data,callback)
{
    this.dbModel.query_callback_object("call team_get_current_message(?,?)"
        ,[
            data.user_id,
            data.team_id
        ]
        ,callback);
}

TeamDA.prototype.team_send_request_heart = function(data,callback)
{
    this.dbModel.query_callback_object("call team_send_request_heart(?,?)"
        ,[
            data.user_id,
            data.team_id
        ]
        ,callback);
}

TeamDA.prototype.team_send_request_boost = function(data,callback)
{
    this.dbModel.query_callback_object("call team_send_request_boost(?,?,?)"
        ,[
            data.user_id,
            data.team_id,
            data.boost_id
        ]
        ,callback);
}


TeamDA.prototype.team_accept_request_heart = function(data,callback)
{
    this.dbModel.query_callback_object("call team_accept_request_heart(?,?,?)"
        ,[
            data.user_id,
            data.team_id,
            data.request_id
        ]
        ,callback);
}


TeamDA.prototype.team_accept_request_boost = function(data,callback)
{
    this.dbModel.query_callback_object("call team_accept_request_boost(?,?,?)"
        ,[
            data.user_id,
            data.team_id,
            data.request_id
        ]
        ,callback);
}



TeamDA.prototype.team_chat_send_message = function(data,callback)
{
    this.dbModel.query_callback_object("call team_chat_send_message(?,?,?)"
        ,[
            data.user_id,
            data.team_id,
            data.msg
        ]
        ,callback);
}

TeamDA.prototype.team_chat_send_message_with_sticker = function (data, callback) {
    this.dbModel.query_callback_object("call team_chat_send_message_with_sticker(?,?,?,?,?,?)"
        , [
            data.user_id,
            data.team_id,
            data.msg,
            data.sticker_id || 0,
            data.sticker_cate || 0,
            data.request_type
        ]
        , callback);
}


TeamDA.prototype.team_user_request_time = function(data,callback)
{
    this.dbModel.query_callback_object("call team_user_request_time(?,?)"
        ,[
            data.user_id,
            data.team_id
        ]
        ,callback);
}

module.exports = TeamDA;
