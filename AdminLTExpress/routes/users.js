var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  return res.render('users/index',{search_form:{},listUsers:[]});
});

router.post('/search_user', function(req, res) {
let search_form = {
      user_id:  req.body.searchUserId.replace(' ','')==''?0:eval(req.body.searchUserId),
      fullname:req.body.searchFullName,
      device_id:req.body.searchDeviceId,
      min_spent:req.body.searchMinSpent||0,
      offset:req.body.searchOffset||0,
     limit:req.body.searchLimit||100
}

req.app.UserDA.admin_search_user(search_form,function(err,data){

  return res.render('users/index',{search_form:search_form,listUsers:data});

});

});

router.post('/delete_user', function(req, res) {
    console.log(req.body.delete_edt_Id);
    req.app.UserDA.admin_delete_user({
        user_id : req.body.delete_edt_Id
    },function(err,data){
        return res.send(data||{status:1,msg:"err"});
    });
});

router.post('/get_all_user_data', function(req, res) {
    console.log(req.body.user_id);
    req.app.UserDA.admin_get_all_user_data({
        user_id : req.body.user_id
    },function(err,data){
        return res.send(data||{status:1,msg:"err"});
    });
});


router.post('/email_send', function(req, res) {

    let expireTime = null;
    if(!req.body.edt_expire_time || req.body.edt_expire_time==""){
        expireTime = null;
    }
    else
    {
        // need test try parse datetime and format it to server time
    }

    let arrIds = [];
    if(req.body.emailToNumberUser ==1 )
    {
        arrIds.push(req.body.edt_Id);
    }
    else
    {
        arrIds = req.body.edt_IdMulti.split(/[ .:;?!~,`"&|()<>{}\[\]\t\r\n/\\]+/).filter(function(value, index, arr){

            return value !="";

        });

    }
    console.log(arrIds);
    var dataSend = dataSend = {
        user_ids: JSON.stringify(arrIds),
        title:req.body.edt_Title,
        content:req.body.edt_Content,
        sent_by:req.body.edt_email_send_name,
        email_type:req.body.edt_MessageType
    };

    if(req.body.edt_MessageType==1){
    // gift
        let objGift = [];

        if(req.body.edt_email_Gem!=0){
            objGift.push({
                "type": 1,
                "quantity": req.body.edt_email_Gem
            });
        }

        for(var coin_i =1; coin_i<=20; coin_i++){
            if(req.body["edt_email_Coin"+coin_i]!=0 || req.body["edt_email_key_"+coin_i]!=0){
                objGift.push({
                    "type": 0,
                    "quantity": req.body["edt_email_Coin"+coin_i],
                    "key": req.body["edt_email_key_"+coin_i],
                    "resId":coin_i
                });
            }
        }

        if(req.body.edt_email_boost_x2!=0){
            objGift.push( {
                "type": 2,
                "quantity": req.body.edt_email_boost_x2
            });
        }


        if(req.body.edt_email_boost_pan!=0){
            objGift.push( {
                "type": 3,
                "quantity": req.body.edt_email_boost_pan
            });
        }

        if(req.body.edt_email_boost_time!=0){
            objGift.push( {
                "type": 4,
                "quantity": req.body.edt_email_boost_time
            });
        }

        if(req.body.edt_email_boost_cake!=0){
            objGift.push( {
                "type": 5,
                "quantity": req.body.edt_email_boost_cake
            });
        }

        if(req.body.edt_email_boost_ice!=0){
            objGift.push( {
                "type": 6,
                "quantity": req.body.edt_email_boost_ice
            });
        }

        if(req.body.edt_email_boost_serve!=0){
            objGift.push( {
                "type": 7,
                "quantity": req.body.edt_email_boost_serve
            });
        }

        if(req.body.edt_email_infinite_heart!=0){
            objGift.push( {
                "type": 8,
                "quantity": req.body.edt_email_infinite_heart
            });
        }


        dataSend.gift =JSON.stringify(objGift);

    }
    else
    {
        if(req.body.edt_MessageType==3 || req.body.edt_MessageType==4){

            let ress = [];
            for(var i = 1; i<=20; i++){
                if(req.body["edt_email_Coin"+i]!=null){
                    let res1 = {
                        "id": i,
                        "level": req.body["edt_email_levels_"+i],
                        "coin": req.body["edt_email_Coin"+i],
                        "lvl_stage": req.body["edt_email_tier_"+i],
                        "unlock_state":req.body["edt_email_unlock_state_"+i],
                        "key":req.body["edt_email_key_"+i]
                    };
                    ress.push(res1);
                }
            }
            // console.log("ress: " +JSON.stringify(ress));

            let reward = [];
            if(req.body.edt_email_Gem!=-1){
                reward.push({
                    "type": 1,
                    "quantity": req.body.edt_email_Gem
                });
            }


            if(req.body.edt_email_boost_x2!=-1){
                reward.push( {
                    "type": 2,
                    "quantity": req.body.edt_email_boost_x2
                });
            }


            if(req.body.edt_email_boost_pan!=-1){
                reward.push( {
                    "type": 3,
                    "quantity": req.body.edt_email_boost_pan
                });
            }

            if(req.body.edt_email_boost_time!=-1){
                reward.push( {
                    "type": 4,
                    "quantity": req.body.edt_email_boost_time
                });
            }

            if(req.body.edt_email_boost_cake!=-1){
                reward.push( {
                    "type": 5,
                    "quantity": req.body.edt_email_boost_cake
                });
            }

            if(req.body.edt_email_boost_ice!=-1){
                reward.push( {
                    "type": 6,
                    "quantity": req.body.edt_email_boost_ice
                });
            }

            if(req.body.edt_email_boost_serve!=-1){
                reward.push( {
                    "type": 7,
                    "quantity": req.body.edt_email_boost_serve
                });
            }

            if(req.body.edt_email_infinite_heart!=-1){
                reward.push( {
                    "type": 8,
                    "quantity": req.body.edt_email_infinite_heart
                });
            }


              let  objGiftForcset = {
                "res":ress,
                "reward":reward
            };

            

            dataSend.gift =JSON.stringify(objGiftForcset);

        }
    }

    console.log(dataSend);
    req.app.UserDA.admin_send_email_multi(dataSend,function(err,data){
        return res.send(data||{status:1,msg:"err"});
    });
});

router.get('/gem_log', function(req, res) {
    return res.render('users/gem_log',{search_form:{},listUsers:[]});
});

router.post('/gem_log', function(req, res) {
    let search_form = {
        user_id:  req.body.searchUserId.replace(' ','')==''?0:eval(req.body.searchUserId),
        page:req.body.page||0
    }

    req.app.UserDA.admin_user_gem_log(search_form,function(err,data){
        console.log(data);
        return res.render('users/gem_log',{search_form:search_form,listUsers:data||[]});

    });

});

router.get('/email_list', function(req, res) {
    return res.render('users/email_list',{search_form:{},listUsers:[]});
});

router.post('/email_list', function(req, res) {
    let search_form = {
        user_id:  req.body.searchUserId.replace(' ','')==''?0:eval(req.body.searchUserId),
        page:req.body.page||0
    }

    req.app.UserDA.admin_email_list_get(search_form,function(err,data){
        console.log(data);
        return res.render('users/email_list',{search_form:search_form,listUsers:data||[]});

    });

});





module.exports = router;
