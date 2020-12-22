/**
 * Created by luckyman on 8/29/17.
 */
var app_constant = {};
app_constant.MINI_GAME_ROOM = {

}

app_constant.SIO_EVENT_NAME = {
    CONNECTION:'connection'
    ,DISCONNECT :'disconnect'
    ,ERROR : 'error'
    ,LOGIN_FACEBOOK:'1'
    ,LOGIN_FACEBOOK_RESULT:'2'
}


app_constant.SIO_EVENT_NAME.COMMON = {
    "connect":"connected",
    "disconnect":"disconnect",
    "error":"error",
    "register_socket_with_user":"register_socket_with_user",
    "un_register_socket_with_user":"un_register_socket_with_user"
};

app_constant.SIO_EVENT_NAME.CLIENT_TO_SERVER = {
    "get_server_state":"get_server_state"
    ,"config_get_map":"config_get_map"
    ,"config_get_i18n":"config_get_i18n"


};

app_constant.SIO_EVENT_NAME.SERVER_TO_CLIENT = {
    "get_server_state_result":"get_server_state_result"
    ,"config_get_i18n_result":"config_get_i18n_result"

};



app_constant.SIO_EVENT_NAME.MASTER_SYNC = {
    "sync_system_config":"sync_system_config",
    "sync_config_version":"sync_config_version",
    "sync_config_i18ns":"sync_config_i18ns",

};







module.exports = exports = app_constant;