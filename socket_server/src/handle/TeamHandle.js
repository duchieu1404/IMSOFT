/**
 * Created by luckyman on 12/13/17.
 */
/**
 * Created by luckyman on 12/13/17.
 */

var config = require('./../config/config.js');
var Constant = require('./../config/constant.js');
var _ = require('lodash');
var crypt = require('./../shared_class/crypt.js');

var async = require('async');
var HVKUtils = require('./../shared_class/HVKUtils');

var _TeamDA = require('./../database/TeamDA');

var TeamHandle = function(){
    this.game_server = null;
    this.socket_io = null;

    this.TeamDA = null;


}

TeamHandle.prototype.init_handle = function(game_server)
{
    this.game_server = game_server;
    this.socket_io = game_server.socket_io;
    this.TeamDA = new _TeamDA(this.game_server);

    this.init_listener();
}
TeamHandle.prototype.init_listener = function(){
    var self = this;

    this.socket_io.sockets.on('connection',function(client) {
        console.log("Connected ", client.id);

        HVKUtils.add_listener(client,"team_join_topic",self.on_team_join_topic.bind(self));
        HVKUtils.add_listener(client,"team_leave_topic",self.on_team_leave_topic.bind(self));

        HVKUtils.add_listener(client,"team_get_current_message",self.on_team_get_current_message.bind(self));
        HVKUtils.add_listener(client,"team_send_request_heart",self.on_team_send_request_heart.bind(self));
        HVKUtils.add_listener(client,"team_send_request_boost",self.on_team_send_request_boost.bind(self));
        HVKUtils.add_listener(client,"team_accept_request_heart",self.on_team_accept_request_heart.bind(self));
        HVKUtils.add_listener(client,"team_accept_request_boost",self.on_team_accept_request_boost.bind(self));
        HVKUtils.add_listener(client,"team_chat_send_message",self.on_team_chat_send_message.bind(self));
        HVKUtils.add_listener(client,"team_user_request_time",self.on_team_user_request_time.bind(self));

    });
}

TeamHandle.prototype.on_team_join_topic = function(client,message){
    var data = HVKUtils.parseInputToJSON(message);


    data.topic_name = "TEAM_"+data.team_id;
    data.user_id = client.user_id;
    client.team_id = data.team_id;
    HVKUtils.join_socket_name(client,data.topic_name);

    console.log("on_team_join_topic ", data);

    this.TeamDA.team_join_topic(data,function(err,data){
        //Ket noi thanh cong : login thanh cong socket
        if(err || !data || !data.user_id){
            return client.emit('team_join_topic_result',{
                "status":1,
                "msg":"Error team_join_topic_result"+err
            });
        }
        return client.emit("team_join_topic_result",
            {
                "status":data.status,
                "msg":data.msg,
                "data":data
            });
    });
}

TeamHandle.prototype.on_team_leave_topic = function(client,message){
    var data = HVKUtils.parseInputToJSON(message);
    data.topic_name = "TEAM_"+data.team_id;
    data.user_id = client.user_id;
    client.team_id = null;

    HVKUtils.leave_socket_name(client,data.topic_name);

    console.log("on_team_leave_topic ", data);

    this.TeamDA.team_leave_topic(data,function(err,data){
        //Ket noi thanh cong : login thanh cong socket
        if(err || !data || !data.user_id){
            return client.emit('team_leave_topic_result',{
                "status":1,
                "msg":"Error team_leave_topic_result"+err
            });
        }
        return client.emit("team_leave_topic_result",
            {
                "status":data.status,
                "msg":data.msg,
                "data":data
            });
    });
}

TeamHandle.prototype.on_team_chat_send_message = function(client,message){
    var data = HVKUtils.parseInputToJSON(message);
    data.topic_name = "TEAM_"+data.team_id;
    data.time_request = HVKUtils.getDateTimeSQL();

    if(config.system_config.is_log_chat_msg==1){
        this.TeamDA.team_chat_send_message_with_sticker(data,function(err,data){
    });
    }else
    {
        if(data.team_id == client.team_id){
            HVKUtils.broadcastRoomName(this.socket_io,data.topic_name,"team_chat_send_message_result",{status:0,msg:"OK",data:data});
        }
    }
}


TeamHandle.prototype.on_team_get_current_message = function(client, message){

    console.log("user_connect_socket ", client.id);
    var self = this;
    var dataRequest = HVKUtils.parseInputToJSON(message);
    dataRequest.user_id = client.user_id;
    this.TeamDA.team_get_current_message(dataRequest,function(err,data){
        //Ket noi thanh cong : login thanh cong socket
        if(err){
            return client.emit('team_get_current_message_result',{
                "status":1,
                "msg":"Không thể kết nối vào server socket"
            });
        }
    });
}


TeamHandle.prototype.on_team_send_request_heart = function(client, message){

    console.log("on_team_send_request_heart ", client.id);
    var self = this;
    var dataRequest = HVKUtils.parseInputToJSON(message);
    dataRequest.user_id = client.user_id;

    console.log("on_team_send_request_heart",dataRequest);

    this.TeamDA.team_send_request_heart(dataRequest,function(err,data){
        //Ket noi thanh cong : login thanh cong socket
        console.log("team_send_request_boost",err,data);
        if(err ){
            return client.emit('team_send_request_heart_result',{
                "status":1,
                "msg":"Không thể kết nối vào server socket"
            });
        }
    });
}


TeamHandle.prototype.on_team_send_request_boost = function(client, message){

    console.log("on_team_send_request_boost ", client.id);
    var self = this;
    var dataRequest = HVKUtils.parseInputToJSON(message);
    dataRequest.user_id = client.user_id;
    console.log("on_team_send_request_boost ", dataRequest);

    this.TeamDA.team_send_request_boost(dataRequest,function(err,data){
        console.log("team_send_request_boost",err,data);
        //Ket noi thanh cong : login thanh cong socket
        if(err ){
            return client.emit('team_send_request_boost_result',{
                "status":1,
                "msg":"Không thể kết nối vào server socket"
            });
        }

    });
}


TeamHandle.prototype.on_team_accept_request_heart = function(client, message){

    console.log("on_team_accept_request_heart ", client.id);
    var self = this;
    var dataRequest = HVKUtils.parseInputToJSON(message);
    dataRequest.user_id = client.user_id;
    this.TeamDA.team_accept_request_heart(dataRequest,function(err,data){
        //Ket noi thanh cong : login thanh cong socket
        if(err){
            return client.emit('team_accept_request_heart_result',{
                "status":1,
                "msg":"Không thể kết nối vào server socket"
            });
        }

    });
}


TeamHandle.prototype.on_team_accept_request_boost = function(client, message){

    console.log("on_team_accept_request_boost ", client.id);
    var self = this;
    var dataRequest = HVKUtils.parseInputToJSON(message);
    dataRequest.user_id = client.user_id;
    this.TeamDA.team_accept_request_boost(dataRequest,function(err,data){
        //Ket noi thanh cong : login thanh cong socket
        if(err){
            return client.emit('team_accept_request_boost_result',{
                "status":1,
                "msg":"Không thể kết nối vào server socket"
            });
        }

    });
}


TeamHandle.prototype.on_team_user_request_time = function(client, message){

    console.log("on_team_user_request_time ", client.id);
    var self = this;
    var dataRequest = HVKUtils.parseInputToJSON(message);
    dataRequest.user_id = client.user_id;
    this.TeamDA.team_user_request_time(dataRequest,function(err,data){
        //Ket noi thanh cong : login thanh cong socket
        if(err){
            return client.emit('team_user_request_time_result',{
                "status":1,
                "msg":"Không thể kết nối vào server socket"
            });
        }
        return client.emit("team_user_request_time_result",
            {
                "status":data.status,
                "msg":data.msg,
                "data":data
            });

    });
}



module.exports = TeamHandle;
