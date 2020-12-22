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

var _UserDA = require('./../database/UserDA');

var ChatHandle = function(){
    this.game_server = null;
    this.socket_io = null;

    this.UserDA = null;


}

ChatHandle.prototype.init_handle = function(game_server)
{
    this.game_server = game_server;
    this.socket_io = game_server.socket_io;
    this.UserDA = new _UserDA(this.game_server);

    this.init_listener();
}
ChatHandle.prototype.init_listener = function(){
    var self = this;

    this.socket_io.sockets.on('connection',function(client) {
        console.log("Connected ", client.id);

        HVKUtils.add_listener(client,"chat_join_topic",self.chat_join_topic.bind(self));
        HVKUtils.add_listener(client,"chat_left_topic",self.chat_left_topic.bind(self));
        HVKUtils.add_listener(client,"chat_message_to_topic",self.chat_message_to_topic.bind(self));

    });
}

ChatHandle.prototype.chat_join_topic = function(client,message){
    var data = HVKUtils.parseInputToJSON(message);
    HVKUtils.join_socket_name(client,data.topic_name);
    client.emit("chat_join_topic_result",{status:0,msg:"OK"});
}
ChatHandle.prototype.chat_left_topic = function(client,message){
    var data = HVKUtils.parseInputToJSON(message);
    HVKUtils.leave_socket_name(client,data.topic_name);
    client.emit("chat_left_topic_result",{status:0,msg:"OK"});

}

ChatHandle.prototype.chat_message_to_topic = function(client,message){
    var data = HVKUtils.parseInputToJSON(message);
    HVKUtils.broadcastRoomName(this.socket_io,data.topic_name,"chat_message_to_topic_result",{status:0,msg:"OK",data:data});
}



module.exports = ChatHandle;
