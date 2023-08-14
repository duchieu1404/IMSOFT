/**
 * Created by luckyman on 8/29/17.
 */

var app_config = {};

app_config.mySQLConfig = {
    host: 'localhost',
    port: 3306,
    user: 'user_hospital',
    password: 'Hospital123$5',
    database:'hospital_001',
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
    config_reload_config_version:0,
    time_to_scan_system_config:10000,
    time_to_scan_auto_broadcast:10000,
    time_to_scan_scan_auto_event:100,
    time_to_scan_node_zone_list:1000,
    master_node_url:'http://slot.thaodh.com:2052/master_node',
    force_reload_all_config:0,
    FACEBOOK_APP_ID:"",
    FACEBOOK_APP_SECRET:"",
    call_fb_api_on_server:0,
    is_use_list_fixed:1,
    list_games_fixed:'{}',
    slot_service_base_api:'http://localhost:6699/'

};

app_config.i18ns = [];


module.exports = exports = app_config;
