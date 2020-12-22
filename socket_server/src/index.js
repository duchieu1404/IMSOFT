/**
 * Created by luckyman on 8/29/17.
 */
var GameServer = require('./GameServer');

process.on('exit', function (code) {
    console.log("process.exit(" + code + ")");
});

process.on('uncaughtException', function (err) {
    console.log(err.stack);
    // process.exit(1);
});

var opts = {
    is_master: process.argv[2]||0
    ,port:process.argv[3]||3000
    ,is_use_https:process.argv[4]||0
    ,node_id:process.argv[5]||0
    ,server_ip:process.argv[6]||0
    ,db_test:process.argv[7]||0
};
console.log("Server Option : ",JSON.stringify(opts));

var gameServer = new GameServer(opts);
gameServer.start(opts);

