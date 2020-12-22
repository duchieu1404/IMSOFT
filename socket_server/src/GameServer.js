/**
 * Created by luckyman on 8/29/17.
 */
var http = require('http');
var fs = require("fs");
var os = require('os');
var path = require('path');
var HttpsServer = require('./HttpsServer');
var redis = require('socket.io-redis');
var config = require('./config/config.js')
var _dbclient = require('./shared_class/mysql/mysql');
var Handles = require('./handle');


function GameServer() {
    this.httpServer = null;
    this.socket_io = null;
    this.dbclient = null;
    this.mySQLConfig = null;
    this.zoneManager = null;
    this.opts = {};
}

GameServer.prototype.start = function(opts) {
    var self = this;
    this.opts = {
        is_master: opts.is_master || 0,
        port: opts.port || 3000,
        is_use_https: opts.is_use_https || 0,
        node_id: opts.node_id || 0,
        db_test: opts.db_test || 0
    }
    this.mySQLConfig = config.mySQLConfig;
    if (this.opts.db_test) {
        this.mySQLConfig = config.mySQLConfig_test;
    }

    console.log(this.mySQLConfig);

    var dirSsl = path.join(path.dirname(module.filename), '../ssl');

    var pathKey = path.join(dirSsl, 'key.pem');
    var pathCert = path.join(dirSsl, 'cert.pem');

    if (this.opts.is_use_https && fs.existsSync(pathKey) && fs.existsSync(pathCert)) {
        // HTTP/TLS
        var options = {
            key: fs.readFileSync(pathKey, 'utf8'),
            cert: fs.readFileSync(pathCert, 'utf8')
        };
        console.log("TLS: supported");
        this.httpServer = HttpsServer.createServer(options);
    } else {
        // HTTP only
        console.log("TLS: not supported");
        this.httpServer = http.createServer();
    }

    this.socket_io = require('socket.io').listen(this.httpServer);
    var y = require('events').EventEmitter.prototype._maxListeners = 100;
    //
    // var ioRedisAdapter = redis({ host: 'localhost', port: 6379, key: "slot_server" });
    //
    // ioRedisAdapter.pubClient.on('error', function(err) {
    //     console.log("ioRedisAdapter pubClient", err);
    // });
    // ioRedisAdapter.subClient.on('error', function(err) {
    //     console.log("ioRedisAdapter subClient", err);
    // });

    var dbclient = _dbclient.init(this);
    this.dbclient = dbclient;

    // this.socket_io.adapter(ioRedisAdapter);

    // this.server_ip = "";
    // this.

    this.httpServer.listen(this.opts.port);

    function onError(error) {
        if (error.syscall !== 'listen') {
            throw error;
        }

        var bind = typeof self.opts.port === 'string' ?
            'Pipe ' + self.opts.port :
            'Port ' + self.opts.port;

        // handle specific listen errors with friendly messages
        switch (error.code) {
            case 'EACCES':
                console.error(bind + ' requires elevated privileges');
                process.exit(1);
                break;
            case 'EADDRINUSE':
                console.error(bind + ' is already in use');
                process.exit(1);
                break;
            default:
                throw error;
        }
    }

    function onListening() {
        var addr = this.httpServer.address();
        var bind = typeof addr === 'string' ?
            'pipe ' + addr :
            'port ' + addr.port;
        console.log('Server listening on: ', this.httpServer.address(), bind);
    }

    this.httpServer.on('error', onError);
    this.httpServer.on('listening', onListening.bind(this));

    Handles.UserHandle.init_handle(this);
    Handles.ConfigHandle.init_handle(this);
    Handles.CommonHandle.init_handle(this);
    Handles.ChatHandle.init_handle(this);
    Handles.TeamHandle.init_handle(this);

    if (this.opts.is_master == 1) {
        var MasterNode = require('./MasterNode');
        var nodeMasterObj = new MasterNode(this);
        nodeMasterObj.resetScheduleScanSystemConfig();
        nodeMasterObj.system_reload_auto_broadcast();
        nodeMasterObj.system_reload_auto_broadcast_message();

        nodeMasterObj.init_listener();

        this.MasterNode = nodeMasterObj;


    } else {
        var SlaverNode = require('./SlaverNode');
        this.SlaverNode = new SlaverNode(this);
        this.SlaverNode.reloadAllConfig();
    }

    // var EmailUtil = new (require('./module/Email'))();
    // EmailUtil.sendEmail({to_email:"thao.daohuu@gmail.com"},function (error,info) {
    //     console.log("Send Email",error,info);
    // });
}


module.exports = GameServer;