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

        for(var key_id =1; key_id<=3; key_id++){
            if(req.body["edt_email_map_key_"+key_id]!=null && req.body["edt_email_map_key_"+key_id]!=0){
                objGift.push({
                    "type": 16,
                    "quantity": req.body["edt_email_map_key_"+key_id],
                    "map_id":key_id
                });
            }

            if(req.body["edt_email_map_coin_"+key_id]!=null && req.body["edt_email_map_coin_"+key_id]!=0){
                objGift.push({
                    "type": 14,
                    "quantity": req.body["edt_email_map_coin_"+key_id],
                    "map_id":key_id
                });
            }
        }

        for(var giftId = 0;giftId<20;giftId++){
            if(req.body["edt_email_gift_"+giftId]!=null && req.body["edt_email_gift_"+giftId]!=0){
                objGift.push( {
                    "type": giftId,
                    "quantity": req.body["edt_email_gift_"+giftId]
                });
            }
        }

        dataSend.gift =JSON.stringify(objGift);

    }
    else
    {
        if(req.body.edt_MessageType==3 || req.body.edt_MessageType==4){

            let map = [];
            for(var i = 1; i<=3; i++){
                if(req.body["edt_email_map_unlock_"+i]!=null){
                    let res1 = {
                        "id": i,
                        "level": req.body["edt_email_map_level_"+i],
                        "tier": req.body["edt_email_map_tier_"+i],
                        "unlock": req.body["edt_email_map_unlock_"+i]
                    };
                    map.push(res1);
                }
            }

            let objGift = [];

            for(var key_id =1; key_id<=3; key_id++){
                if(req.body["edt_email_map_key_"+key_id]!=null && req.body["edt_email_map_key_"+key_id]!=0){
                    objGift.push({
                        "type": 16,
                        "quantity": req.body["edt_email_map_key_"+key_id],
                        "map_id":key_id
                    });
                }
    
                if(req.body["edt_email_map_coin_"+key_id]!=null && req.body["edt_email_map_coin_"+key_id]!=0){
                    objGift.push({
                        "type": 14,
                        "quantity": req.body["edt_email_map_coin_"+key_id],
                        "map_id":key_id
                    });
                }
            }
    
            for(var giftId = 0;giftId<20;giftId++){
                if(req.body["edt_email_gift_"+giftId]!=null && req.body["edt_email_gift_"+giftId]!=0){
                    objGift.push( {
                        "type": giftId,
                        "quantity": req.body["edt_email_gift_"+giftId]
                    });
                }
            }

            let  objGiftForcset = {
                "map":map,
                "reward":objGift
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
