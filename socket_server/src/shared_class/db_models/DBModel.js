/**
 * Created by LuckyMan on 9/16/15.
 */
var Promise = require('promise');
var DBModel = function (dbclient) {

    this.dbclient = dbclient;
    this.insert = function (table, data) {
        var self = this;
        var promise = new Promise(function (resolve, reject) {
            if (table == null || data == null) {
                return reject("MISSING_PARAMS");
            }
            str_insert_key = '';
            str_insert_value = '';
            array_fields_insert = [];
            for (var key in data) {
                str_insert_key += ' ' + key + ','
                str_insert_value += ' ? ,'
                array_fields_insert.push(data[key]);
            }
            if (str_insert_key.length >= 1) {
                str_insert_key = str_insert_key.substr(0, str_insert_key.length - 1);
            }
            if (str_insert_value.length >= 1) {
                str_insert_value = str_insert_value.substr(0, str_insert_value.length - 1);
            }
            self.dbclient.insert('insert into ' + table + '(' + str_insert_key + ') values(' + str_insert_value + ') ', array_fields_insert, function (error, result) {
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

    this.update = function (table, data, where_str) {
        var self = this;
        var promise = new Promise(function (resolve, reject) {
            if (table == null || data == null) {
                reject("MISSING_PARAMS");
            }

            array_fiels_update = [];
            str_update = '';
            for (var key in data) {
                str_update += ' ' + key + '= ?,'
                array_fiels_update.push(data[key]);
            }
            if (str_update.length >= 2) {
                str_update = str_update.substr(0, str_update.length - 1);
            }
            self.dbclient.query('update ' + table + ' set ' + str_update + ' ' + where_str, array_fiels_update, function (error, result) {
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

    this.save = function (table, data, where_str) {
        var self = this;
        var promise = new Promise(function (resolve, reject) {
            if (where_str != null && where_str.length > 0) {
                self.query_find("select * from  " + table + " " + where_str, []).then(function (x) {
                    self.update(table, data, where_str).then(function (xx) {
                        return  resolve(xx);
                    }, function (ee) {
                        return  reject(ee)
                    });
                }, function (e) {
                    self.insert(table, data).then(function (xx) {
                        return  resolve(xx);
                    }, function (ee) {
                        return  reject(ee)
                    });
                });

            }
            else // neu khong thi se la insert
            {
                self.insert(table, data).then(function (x) {
                    return  resolve(x);
                }, function (e) {
                    return  reject(e)
                });
            }
        });
        return promise;
    };

    this.save_insert = function (table, data, where_str, is_insert_only) {
        var self = this;
        var promise = new Promise(function (resolve, reject) {
            if (where_str != null && where_str.length > 0) {
                self.query_find("select * from  " + table + " " + where_str, []).then(function (x) {
                    if (is_insert_only) {
                        return reject("IS_INSERT_ONLY");
                    }
                    self.update(table, data, where_str).then(function (xx) {
                        return resolve(xx);
                    }, function (ee) {
                        return reject(ee);
                    });

                }, function (e) {
                    self.insert(table, data).then(function (xx) {
                        return resolve(xx);
                    }, function (ee) {
                        return reject(ee);

                    });
                });

            }
            else // neu khong thi se la insert
            {
                self.insert(table, data).then(function (x) {
                    return resolve(x);
                }, function (e) {
                    return reject(e)
                });
            }
        });
        return promise;
    };

    this.delete = function (table, where_str,data) {
        var self = this;
        if (where_str == null) {
            where_str = '';
        }
        if(data == null || data == undefined)
        {
            data = [];
        }
        var promise = new Promise(function (resolve, reject) {
            if (table == null) {
                return reject("MISSING_PARAMS");
            }

            self.dbclient.query('delete from ' + table + ' ' + where_str, data, function (error, result) {
                if (error) {
                    return  reject(error);
                }
                else {
                    return resolve(result);
                }
            });
        });
        return promise;
    };

    this.query = function (sql, params) {
        var self = this;

        var promise = new Promise(function (resolve, reject) {
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
        var self = this;

        var promise = new Promise(function (resolve, reject) {
            if (sql == null) {
                reject("MISSING_PARAMS");
            }
            if (params == null) {
                params = [];
            }
            self.dbclient.query(sql, params, function (error, result) {
                if (error) {
                    console.error(error);
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
            console.log(sql,errorX);
            callback(errorX, {});
        });
    }

    this.query_callback_array = function (sql, params,callback) {
        var self = this;

        var promise = new Promise(function (resolve, reject) {
            if (sql == null) {
                reject("MISSING_PARAMS");
            }
            if (params == null) {
                params = [];
            }
            self.dbclient.query(sql, params, function (error, result) {
                if (error) {
                    console.error(error);
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
            console.log(sql,errorX);
            callback(errorX, []);
        });
    }

    this.query_callback_multi_array = function (sql, params,callback) {
        var self = this;

        var promise = new Promise(function (resolve, reject) {
            if (sql == null) {
                reject("MISSING_PARAMS");
            }
            if (params == null) {
                params = [];
            }
            self.dbclient.query(sql, params, function (error, result) {
                if (error) {
                    console.error(error);
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
            console.log(sql,errorX);
            callback(errorX, []);
        });
    }


    this.query_find = function (sql, params) {
        var self = this;
        var promise = new Promise(function (resolve, reject) {
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