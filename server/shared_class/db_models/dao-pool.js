/**
 * Created by LuckyMan on 8/27/15.
 */
var poolModule = require('generic-pool');
var createMySqlPool = function(app,mySQLConfig)
{
    return poolModule.Pool({
        name:'mysql',
        create:function(cb)
        {
            var mysql = require('mysql');
            var client = mysql.createConnection({
                host:mySQLConfig.host,
                user:mySQLConfig.user,
                password:mySQLConfig.password,
                database:mySQLConfig.database,
                socketPath:mySQLConfig.socketPath||null,
                charset: mySQLConfig.charset||'utf8mb4_general_ci',
                waitForConnections : true,
                queueLimit :0
            });
            client.connect();
            cb(null,client);
        },
        destroy:function(client)
        {
            client.end();
        },
        min:2,
        max:30,
        idleTimeoutMillis:30000,
        log:false
    });
};
exports.createMySqlPool = createMySqlPool;