/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app_config = {};

app_config.mySQLConfig = {

    host: 'localhost',   //14.225.3.183
    port: 3306,
    user:'happy_cooking',
    password: 'K;NC7#5h-ZwV?)<9cbpA',
    database:'Happy_Cooking_Live',
    charset : 'utf8mb4_general_ci',
    waitForConnections : true,  // Determines the pool's action when no connections are available and the limit has been reached. If true, the pool will queue the connection request and call it when one becomes available. If false, the pool will immediately call back with an error. (Default: true)
    queueLimit :0, //The maximum number of connection requests the pool will queue before returning an error from
    getConnection:0 //. If set to 0, there is no limit to the number of queued connection requests. (Default: 0)
}

app_config.onesignal_config =  {
    userAuthKey: "",
    app: { appAuthKey: "MTBiOTYxYjUtYzFjZC00MGQyLTk5NTQtZjcwZTY5NTkwZjZi",
        appId: "7c076858-2a4d-48d9-8fbe-187d3f45d594" }
};

app_config.system_config = {
    auto_push_interval:10000
}
app_config.option_clearCache = {
    url: 'https://apihappydoctorlivegame.colorgamejsc.com/apix/hospital_del_redis_key',
    json: true,
    method :'POST'
}
app_config.ev = "Happy_doctor_dev_";

module.exports = exports = app_config;
