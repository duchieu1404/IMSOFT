"use strict";

var _DBModel = require("../shared_class/db_models/DBModel.js");

var PushDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = PushDA;

PushDA.prototype.get_all_auto_push = async  function(data,callback){
    return await this.dbModel.query_callback_array("call get_all_auto_push()", [], callback);
}
