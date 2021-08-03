var express = require('express');
var path = require('path');
var logger = require('morgan');
var cookieParser = require('cookie-parser');

var session = require('express-session');

var routes = require('./routes/index');
var users = require('./routes/users');
var root = require('./routes/root');
var adminRouter =  require('./routes/admin');
var logRouter = require('./routes/logs');
let configRouter = require('./routes/config');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

var app_configs = require('./configs/app_config');
app.libs = {};

app.mySQLConfig =app_configs.mySQLConfig;
let _dbclient = require('./shared_class/db_models/mysql');

let dbclient = _dbclient.init(app);
app.dbclient = dbclient;

app.libs.dbclient = dbclient;

app.use(session({
    secret: 'CFFSessionS@cr@t'
    , cookie: { maxAge: 6000000 }
    , resave: false,
    saveUninitialized: true,
}));

var _DA = require('./module/DA');
var DA = new _DA(app);




let _UserDA = require('./database/UserDA');
let UserDA = new _UserDA(app);
app.UserDA = UserDA;



let _ConfigDA = require('./database/ConfigDA');
let ConfigDA = new _ConfigDA(app);
app.ConfigDA = ConfigDA;


let _AccountDA = require('./database/AccountDA');
let  AccountDA = new _AccountDA(app);
app.AccountDA = AccountDA;

app.use(function(req, res, next){
    res.locals.user = req.session.user_logined ;
    next();
});

//http://stackoverflow.com/questions/11181546/how-to-enable-cross-origin-resource-sharing-cors-in-the-express-js-framework-o
app.all("*",function(req,res,next)
{
    res.header("Access-Control-Allow-Origin","*");
    res.header("Access-Control-Allow-Headers","X-Request-With");
    req.dbclient = dbclient;

    if(req.path.indexOf('/js/')==0
    ||req.path.indexOf('/css/')==0
    ||req.path.indexOf('/fonts/')==0
    ||req.path.indexOf('/img/')==0
    ||req.path.indexOf('/images/')==0
    ||req.path=='/login'
    ||req.path.indexOf('/login/')==0
    ||req.path.indexOf('/jsoneditor/')==0
    ||req.path.indexOf('/file_conigs/')==0
    )
    {
        return next();
    }
    else {
        // request with permission
        if(!req.session || req.session.user_logined == null || req.session.user_logined==undefined)
        {
            return res.redirect('/login');
        }
    }

    next();
});

app.use(require('less-middleware')(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);
app.use('/users', users);
app.use('/root', root);
app.use('/admin', adminRouter);
app.use('/log', logRouter);
app.use('/config', configRouter);

/// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

/// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

process.on('uncaughtException', function (err) {
    console.error((new Date).toUTCString() + ' uncaughtException:', err.message)
    console.error(err.stack)
    // process.exit(1)
})


module.exports = app;
 
