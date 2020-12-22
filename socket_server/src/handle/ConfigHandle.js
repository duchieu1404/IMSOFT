/**
 * Created by luckyman on 12/13/17.
 */
var config = require('./../config/config.js');
var Constant = require('./../config/constant.js');
var _ = require('lodash');
var crypt = require('./../shared_class/crypt.js');

var async = require('async');
var _ConfigDA = require('./../database/ConfigDA');
var HVKUtils = require('./../shared_class/HVKUtils');

var ConfigHandle = function(){
    this.game_server = null;
    this.socket_io = null;
    this.ConfigDA = null;
}

ConfigHandle.prototype.init_handle = function(game_server)
{
    this.game_server = game_server;
    this.socket_io = game_server.socket_io;
    this.ConfigDA = new _ConfigDA(this.game_server);

    this.init_listener();
}
ConfigHandle.prototype.init_listener = function(){
    var self = this;

    this.socket_io.sockets.on('connection',function(client) {
        HVKUtils.add_listener(client,"get_time_server",self.on_get_time_server.bind(self));
        HVKUtils.add_listener(client,"get_server_state",self.on_get_server_state.bind(self));
    });
}

ConfigHandle.prototype.on_get_time_server= function(client,message) {
    console.log("on_get_time_server",message);
    client.emit('get_time_server_result', { t: (new Date()).getTime() });
};


ConfigHandle.prototype.on_get_server_state = function(client, message){
    var data = HVKUtils.parseInputToJSON(message);
    async.parallel({
        server_time: function(callback) {
            callback(null, (new Date()).getTime())
        },
        config_version:function(callback){
            callback(null,config.config_version)
        },
        force_reload:function(callback){
            callback(null,config.system_config.force_reload_all_config)
        }

    },function(err, results) {
        if (err) {
            return client.emit('get_server_state_result',{
                    "status":1,
                    "msg":"Không lấy được thông tin config"
                });
        }
        return client.emit("get_server_state_result",
           {
                "status":0,
                "msg":"Lấy thông tin trạng thái server thành công.",
                "data":results
            });
    });
}



module.exports = ConfigHandle;
