/**
 * Created by luckyman on 8/29/17.
 */
const rateLimit = require('express-rate-limit');
const app = require('../app');
let app_config = {};
app_config.mySQLConfig = {
    host: 'localhost',
    port: 3306,
    user: 'hospital_dev_001',
    password: 'HospitalDev123$5',
    database:'Hospital_Dev_001',
    charset : 'utf8mb4_general_ci',
    waitForConnections : true,  // Determines the pool's action when no connections are available and the limit has been reached. If true, the pool will queue the connection request and call it when one becomes available. If false, the pool will immediately call back with an error. (Default: true)
    queueLimit :0, //The maximum number of connection requests the pool will queue before returning an error from
    getConnection:0 //. If set to 0, there is no limit to the number of queued connection requests. (Default: 0)
}

//
// app_config.mySQLConfig = {
//
//     host: '35.193.201.255', // KC_live : 35.193.201.255
//
//     port: 3306,
//     user: 'root',
//     password: 'Kc123$5',
//     database:'kc_foodvoyage_001',
//     charset : 'utf8mb4',
//     waitForConnections : true,  // Determines the pool's action when no connections are available and the limit has been reached. If true, the pool will queue the connection request and call it when one becomes available. If false, the pool will immediately call back with an error. (Default: true)
//     queueLimit :0, //The maximum number of connection requests the pool will queue before returning an error from
//     getConnection:0 //. If set to 0, there is no limit to the number of queued connection requests. (Default: 0)
// }

app_config.system_config = {
    auto_push_interval:10000
}
app_config.userSyncDataLimiter = rateLimit({
    windowMs: 60 * 1000, // 1 phút
    max: 10, // Tối đa 1 request trong 1 phút
    message: 'Too many requests for user_sync_data, please try again later.',
  });
  app_config.ev = "Hospital_dev_";
module.exports = exports = app_config;
