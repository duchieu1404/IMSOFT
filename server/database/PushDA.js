"use strict";
var _DBModel = require("./../shared_class/db_models/DBModel.js");

var PushDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = PushDA;

PushDA.prototype.get_all_auto_push = function(data,callback){
    return this.dbModel.query_callback_array("call onesignal_get_all_push_schedule()", [], callback);
}