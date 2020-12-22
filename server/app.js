let createError = require('http-errors');
let express = require('express');
let path = require('path');
let cookieParser = require('cookie-parser');
let logger = require('morgan');

let indexRouter = require('./routes/index');
let usersRouter = require('./routes/users');
let apixRouter  = require('./routes/apix');
let inviteRouter  = require('./routes/invite');

let config = require('./config/config.js')
var _dbclient = require('./shared_class/db_models/mysql');

let app = express();
app.mySQLConfig = config.mySQLConfig;


let dbclient = _dbclient.init(app);
app.dbclient = dbclient;



let _UserDA = require('./database/UserDA');
let UserDA = new _UserDA(app);
app.UserDA = UserDA;

let _TeamDA = require('./database/TeamDA');
let TeamDA = new _TeamDA(app);
app.TeamDA = TeamDA;


let _GameDA = require('./database/GameDA');
let GameDA = new _GameDA(app);
app.GameDA = GameDA;



let redisPool = require('redis-connection-pool')('myRedisPool', {
  host: '127.0.0.1', // default
  port: 6379, //default
  max_clients: 30, // defalut
  perform_checks: false, // checks for needed push/pop functionality
  database: 0, // database number to use
});

app.RedisPool = redisPool;

var _PushDA = require('./database/PushDA');
var PushDA = new _PushDA(app);
app.PushDA = PushDA;

var _OneSignalPush = require('./modules/OneSignalPush');
var OneSignalPush = new _OneSignalPush();
OneSignalPush.initModule(app);

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.all("*", function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Request-With");
  req.dbclient = app.dbclient;
  next();
});

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/apix', apixRouter);
app.use('/invite', inviteRouter);
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  console.log("Client request link not found ", req);
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');


});

process.on('uncaughtException', function(err) {
  console.error((new Date).toUTCString() + ' uncaughtException:', err.message)
  console.error(err.stack)
  // process.exit(1)
});





module.exports = app;
