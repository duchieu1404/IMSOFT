var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
    res.redirect('/index.html');
});

/* GET home page. */
router.get('/login', function(req, res) {
    res.render('login');
});

router.post('/login',function(req,res){

    let dataLogin = {
        username:req.body.txtUsername,
        password:req.body.txtPassword
    };

    req.app.AccountDA.admin_login(dataLogin,function(err,data){
        if(data.status == 0){
            let userInfo = JSON.parse(data.data);
            req.session.user_logined = userInfo;
            return res.redirect('/index.html');
        }
        else
        {
            return res.render('login');
        }
    });
});

router.get('/:page.html', function(req, res) {
    res.render(req.param('page'));
});


router.get('/:dir/:page.html', function(req, res) {
    res.render(req.param('dir')+'/'+req.param('page'));//.replace(".html", ""));
});

module.exports = router;
