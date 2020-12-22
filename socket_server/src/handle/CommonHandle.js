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

var CommonHandle = function(){
    this.game_server = null;
    this.socket_io = null;

    this.UserDA = null;


}

CommonHandle.prototype.init_handle = function(game_server)
{
    this.game_server = game_server;
    this.socket_io = game_server.socket_io;
    this.UserDA = new _UserDA(this.game_server);

    this.init_listener();
}
CommonHandle.prototype.init_listener = function(){
    var self = this;

    this.socket_io.sockets.on('connection',function(client) {

        console.log("Connected ", client.id);


        HVKUtils.add_listener(client,Constant.SIO_EVENT_NAME.COMMON.disconnect,self.on_disconnect.bind(self));
        HVKUtils.add_listener(client,Constant.SIO_EVENT_NAME.COMMON.error,self.on_error.bind(self));

    });
}

CommonHandle.prototype.on_connect = function(client, message){
        console.log("Connected ", client.id);
}

CommonHandle.prototype.on_disconnect = function(client, message){

    console.log("on_disconnect ", client.id);
    var self = this;
    var dataDis = {};
    dataDis.socket_id = client.id;
    dataDis.socket_type = 0; // 0 : main socket
    dataDis.user_id = client.user_id;
    dataDis.server_id = self.game_server.opts.node_id;
    if(dataDis.user_id!=null && dataDis.user_id !=0){
        this.UserDA.socket_disconnect(dataDis,function(err,data){
            console.log("Bot disconnect zone ",err,data);
        });
    }

}

CommonHandle.prototype.on_error = function(client, message){

    console.log("on_error ", client.id,message);

}


module.exports = CommonHandle;
