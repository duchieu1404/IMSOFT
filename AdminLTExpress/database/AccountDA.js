"use strict";

var _DBModel = require("../shared_class/db_models/DBModel.js");

var AccountDA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = AccountDA;

AccountDA.prototype.admin_login = function(data,callback){
    return this.dbModel.query_callback_object("call admin_login(?,?,?)", [
        data.username,
        data.password,
        data.client_data
    ], callback);
}
