/**
 * Created by LuckyMan on 8/27/15.
 */
var mySqlClient = module.exports;
var _pool = null;
var NND = {};

NND.init = function(app){
    _pool = require('./dao-pool').createMySqlPool(app,app.mySQLConfig);
};

NND.acquire = function(cb){

    try{
        _pool.acquire(function(err,client){
            cb(err,client);
        });
    }catch (err) {
            console.error("========================acquire error==========================================");
            console.error(err);
            console.error("========================acquire error==========================================");
     }
}

NND.query = function(sql,args,cb)
{
    NND.acquire(function(err2,client)
    {
        if(!!err2)
        {
            console.error("========================acquire error==========================================");
            console.error(err2);
            console.error("========================acquire error==========================================");
            return;
        }
        client.query(sql,args,function(err,res){
            if(err){
                console.error("========================query error==========================================");
                console.error(err);

                if (err.code === 'PROTOCOL_CONNECTION_LOST'
                    || err.code === "PROTOCOL_CONNECTION_LOST"
                    || err.code === "PROTOCOL_ENQUEUE_AFTER_QUIT"
                    || err.code === "PROTOCOL_ENQUEUE_AFTER_FATAL_ERROR"
                    || err.code === "PROTOCOL_ENQUEUE_HANDSHAKE_TWICE"
                    || err.fatal
                ) {
                    console.log('Re-connecting lost connection: ' + err.stack);
                    _pool.release(client);
                }

                console.error("========================query error==========================================");
            }
            _pool.release(client);
            cb(err,res);
        });
    });
};


NND.shutdown = function()
{
    _pool.destroyAllNow();
}

mySqlClient.init = function(app)
{
    if(!!_pool)
    {
        return mySqlClient;
    }
    else
    {
        NND.init(app);
        mySqlClient.insert = NND.query;
        mySqlClient.update = NND.query;
        mySqlClient.delete = NND.query;
        mySqlClient.query = NND.query;
        return mySqlClient;
    }
};

mySqlClient.shutdown = function(app)
{
    NND.shutdown(app);
}

