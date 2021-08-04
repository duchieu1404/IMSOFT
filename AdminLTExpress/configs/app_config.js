/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app_config = {};

app_config.mySQLConfig = {

    host: '14.225.3.138',   //14.225.3.183
    port: 3306,
    user: 'foodvoyage',
    password: 'FoodVoyage123$5',
    database:'food_voyage_001',
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

module.exports = exports = app_config;