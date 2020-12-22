/**
 * Created by luckyman on 12/13/17.
 */
var config = require('./../config/config.js');
var Constant = require('./../config/constant.js');
var _ = require('lodash');
var crypt = require('./../shared_class/crypt.js');

var async = require('async');
var _UserDA = require('./../database/UserDA');
var HVKUtils = require('./../shared_class/HVKUtils');

var UserHandle = function(){
    this.game_server = null;
    this.socket_io = null;
    this.UserDA = null;
}

UserHandle.prototype.init_handle = function(game_server)
{
    this.game_server = game_server;
    this.socket_io = game_server.socket_io;
    this.UserDA = new _UserDA(this.game_server);

    this.init_listener();
}
UserHandle.prototype.init_listener = function(){
    var self = this;

    this.socket_io.sockets.on('connection',function(client) {
        HVKUtils.add_listener(client,"user_connect_socket",self.on_user_connect_socket.bind(self));
        HVKUtils.add_listener(client,"user_disconnect_socket",self.on_user_disconnect_socket.bind(self));
    });

}

UserHandle.prototype.on_user_disconnect_socket = function(client, message){

    console.log("user_disconnect_socket ", client.id);
    var self = this;
    var dataRequest = HVKUtils.parseInputToJSON(message);
    dataRequest.client_ip = client.handshake.headers['x-forwarded-for'] || client.request.connection.remoteAddress;
    dataRequest.device_id = dataRequest.device_id || "UNKNOWN";
    dataRequest.socket_id = client.id;
    dataRequest.server_ip = this.game_server.opts.server_ip;
    dataRequest.server_port = this.game_server.opts.port;
    dataRequest.server_node_id = this.game_server.opts.node_id;
    dataRequest.socket_type = 0; // 0 : main socket

    this.UserDA.user_disconnect_socket(dataRequest,function(err,data){
        if(err || !data ){
            return client.emit('user_disconnect_socket_result',{
                "status":1,
                "msg":"Không thể kết nối vào server socket"
            });
        }
        client.user_id = 0;
        return client.emit("user_disconnect_socket_result",
            {
                "status":data.status,
                "msg":data.msg,
                "data":data
            });
    });
}


UserHandle.prototype.on_user_connect_socket = function(client, message){

    console.log("user_connect_socket ", client.id);
    var self = this;
    var dataRequest = HVKUtils.parseInputToJSON(message);
    dataRequest.client_ip = client.handshake.headers['x-forwarded-for'] || client.request.connection.remoteAddress;
    dataRequest.device_id = dataRequest.device_id || "UNKNOWN";
    dataRequest.socket_id = client.id;
    dataRequest.server_ip = this.game_server.opts.server_ip;
    dataRequest.server_port = this.game_server.opts.port;
    dataRequest.server_node_id = this.game_server.opts.node_id;
    dataRequest.socket_type = 0; // 0 : main socket

    this.UserDA.user_connect_socket(dataRequest,function(err,data){
            //Ket noi thanh cong : login thanh cong socket
        if(err || !data || !data.user_id){
            return client.emit('user_connect_socket_result',{
                "status":1,
                "msg":"Không thể kết nối vào server socket"
            });
        }
        client.user_id = data.user_id;
        return client.emit("user_connect_socket_result",
            {
                "status":data.status,
                "msg":data.msg,
                "data":data
            });
    });
}

module.exports = UserHandle;
