/**
 * Created by LuckyMan on 9/16/15.
 */
let Promise = require('promise');
let DBModel = function (dbclient) {

    this.dbclient = dbclient;
    this.query = function (sql, params) {
        let self = this;
        let promise = new Promise(function (resolve, reject) {
            if (sql == null) {
                reject("MISSING_PARAMS");
            }
            if (params == null) {
                params = [];
            }
            self.dbclient.query(sql, params, function (error, result) {
                if (error) {
                    return  reject(error);
                }
                else {
                    return  resolve(result);
                }
            });
        });
        return promise;
    }
    
    this.query_callback_object = function (sql, params,callback) {
        let self = this;
        let promise = new Promise(function (resolve, reject) {
            if (sql == null) {
                reject("MISSING_PARAMS");
            }
            if (params == null) {
                params = [];
            }
            self.dbclient.query(sql, params, function (error, result) {
                if (error) {
                    return  reject(error);
                }
                else {
                    return  resolve(result);
                }
            });
        });
        promise.then(function(dataX){
            if(dataX && dataX[0] && dataX[0][0]){
                return callback(null,dataX[0][0]);
            }
            else {
                return callback(null,{});
            }
        },function(errorX){
            console.error((new Date).toUTCString()+" query_callback_object",errorX);
            callback(errorX, {});
        });
    }

    this.query_callback_array = function (sql, params,callback) {
        let self = this;

        let promise = new Promise(function (resolve, reject) {
            if (sql == null) {
                reject("MISSING_PARAMS");
            }
            if (params == null) {
                params = [];
            }
            self.dbclient.query(sql, params, function (error, result) {
                if (error) {
                    return  reject(error);
                }
                else {
                    return  resolve(result);
                }
            });
        });
        promise.then(function(dataX){
            if(dataX && dataX[0]){
                return callback(null,dataX[0]);
            }
            else {
                return callback(null,[]);
            }
        },function(errorX){
            console.error((new Date).toUTCString()+" query_callback_object",errorX);
            callback(errorX, []);
        });
    }

    this.query_callback_multi_array = function (sql, params,callback) {
        let self = this;

        let promise = new Promise(function (resolve, reject) {
            if (sql == null) {
                reject("MISSING_PARAMS");
            }
            if (params == null) {
                params = [];
            }
            self.dbclient.query(sql, params, function (error, result) {
                if (error) {
                    return  reject(error);
                }
                else {
                    return  resolve(result);
                }
            });
        });
        promise.then(function(dataX){
            if(dataX){
                return callback(null,dataX);
            }
            else {
                return callback(null,[]);
            }
        },function(errorX){
            console.error((new Date).toUTCString()+" query_callback_object",errorX);
            callback(errorX, []);
        });
    }


    this.query_find = function (sql, params) {
        let self = this;
        let promise = new Promise(function (resolve, reject) {
            if (sql == null) {
                return  reject("MISSING_PARAMS");
            }
            if (params == null) {
                params = [];
            }
            self.dbclient.query(sql, params, function (error, result) {
                if (error) {
                    return  reject(error);
                }
                else {
                    if (result != null && result.length > 0) {
                        return  resolve(result);
                    }
                    else {
                        return  reject('NOT_FOUND');
                    }


                }
            });
        });
        return promise;
    }

}
module.exports = DBModel;