"use strict";

var _DBModel = require("./../shared_class/db_models/DBModel.js");

var DA = function (app) {
    this.app = app;
    this.dbModel = new _DBModel(app.dbclient);
}

module.exports = DA;
