var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  res.send('respond with a resource');
});


router.get('/charge_card',function(req, res) {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var today =  ""+year+"-"+month+"-"+day;

  return res.render('log/charge_card',{dataCards:[],search_form:{ user_id: '',
      fullname: '',
      date_from:  today + " 12:00:00",
      date_to: today + " 23:59:59",
      card_code: '',
      card_seri: '',
      provider_code: '-1',
      status: '-1' }
  });
});

router.post('/charge_card',function(req, res) {
  console.log("charge_card search : ",req.body);
  req.DA.admin_get_charge_card({
      user_id:  req.body.searchUserId.replace(' ','')==''?-1:eval(req.body.searchUserId),
      fullname:req.body.searchFullName,
      date_from:req.body.searchStartTime,
      date_to:req.body.searchEndTime,
      card_code:req.body.searchCardCode,
      card_seri:req.body.searchCardSeri,
      provider_code:req.body.searchProviderCode,
      status:req.body.searchStatus
  },function getServerConfig(err,dataX){
    if(err || !dataX)
    {
      return res.render('log/charge_card',{dataCards:[],search_form:{
          user_id:  req.body.searchUserId,
          fullname:req.body.searchFullName,
          date_from:req.body.searchStartTime,
          date_to:req.body.searchEndTime,
          card_code:req.body.searchCardCode,
          card_seri:req.body.searchCardSeri,
          provider_code:req.body.searchProviderCode,
          status:req.body.searchStatus
      }});
    }
    return res.render('log/charge_card',{dataCards:JSON.parse(JSON.stringify(dataX||[])),search_form:{
        user_id:  req.body.searchUserId,
        fullname:req.body.searchFullName,
        date_from:req.body.searchStartTime,
        date_to:req.body.searchEndTime,
        card_code:req.body.searchCardCode,
        card_seri:req.body.searchCardSeri,
        provider_code:req.body.searchProviderCode,
        status:req.body.searchStatus
    }});
  });
});


router.get('/sms',function(req, res) {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var today =  ""+year+"-"+month+"-"+day;

    return res.render('log/sms',{dataCards:[],search_form:{ user_id: '',
        fullname: '',
        date_from:  today + " 12:00:00",
        date_to: today + " 23:59:59",
        phone_number: '',
        provider_code: '-1'}
    });
});

router.post('/sms',function(req, res) {
    req.DA.admin_get_charge_sms({
        user_id:  req.body.searchUserId.replace(' ','')==''?-1:eval(req.body.searchUserId),
        fullname:req.body.searchFullName,
        date_from:req.body.searchStartTime,
        date_to:req.body.searchEndTime,
        phone_number:req.body.searchPhoneNumber,
        provider_code:req.body.searchProviderCode,
    },function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            return res.render('log/sms',{dataCards:[],search_form:{
                user_id:  req.body.searchUserId,
                fullname:req.body.searchFullName,
                date_from:req.body.searchStartTime,
                date_to:req.body.searchEndTime,
                phone_number:req.body.searchPhoneNumber,
                provider_code:req.body.searchProviderCode,
            }});
        }
        return res.render('log/sms',{dataCards:JSON.parse(JSON.stringify(dataX||[])),search_form:{
            user_id:  req.body.searchUserId,
            fullname:req.body.searchFullName,
            date_from:req.body.searchStartTime,
            date_to:req.body.searchEndTime,
            phone_number:req.body.searchPhoneNumber,
            provider_code:req.body.searchProviderCode,
        }});
    });
});


router.get('/cashout',function(req, res) {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var today =  ""+year+"-"+month+"-"+day;

    return res.render('log/cashout',{
        dataCards:[]
        ,search_form:{  user_id: '',
                        fullname: '',
                        date_from:  today + " 12:00:00",
                        date_to: today + " 23:59:59",
                        card_code: '',
                        card_seri: '',
                        provider_code: '-1',
                        status: '-1'
                    }
    });
});



router.post('/cashout',function(req, res) {
    req.DA.admin_get_cashout({
        user_id:  req.body.searchUserId.replace(' ','')==''?-1:eval(req.body.searchUserId),
        fullname:req.body.searchFullName,
        date_from:req.body.searchStartTime,
        date_to:req.body.searchEndTime,
        card_code:req.body.searchCardCode,
        card_seri:req.body.searchCardSeri,
        provider_code:req.body.searchProviderCode,
        status:req.body.searchStatus
    },function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            return res.render('log/cashout',{dataCards:[],search_form:{
                user_id:  req.body.searchUserId,
                fullname:req.body.searchFullName,
                date_from:req.body.searchStartTime,
                date_to:req.body.searchEndTime,
                card_code:req.body.searchCardCode,
                card_seri:req.body.searchCardSeri,
                provider_code:req.body.searchProviderCode,
                status:req.body.searchStatus
            }});
        }
        return res.render('log/cashout',{dataCards:JSON.parse(JSON.stringify(dataX||[])),search_form:{
            user_id:  req.body.searchUserId,
            fullname:req.body.searchFullName,
            date_from:req.body.searchStartTime,
            date_to:req.body.searchEndTime,
            card_code:req.body.searchCardCode,
            card_seri:req.body.searchCardSeri,
            provider_code:req.body.searchProviderCode,
            status:req.body.searchStatus
        }});
    });
});


router.get('/fish_bullet',function(req, res) {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var today =  ""+year+"-"+month+"-"+day;

    return res.render('log/fish_bullet',{dataCards:[],search_form:{ user_id: '',
        fullname: '',
        date_log:  today + " 12:00:00",
        money_type:-1
        }
    });
});


router.post('/fish_bullet',function(req, res) {
    console.log({
        user_id:  req.body.searchUserId.replace(' ','')==''?-1:eval(req.body.searchUserId),
        fullname:req.body.searchFullName,
        date_log:req.body.searchStartTime,
        money_type:eval(req.body.searchMoneyType)
    });


    req.DA.admin_get_log_fish_bullet({
        user_id:  req.body.searchUserId.replace(' ','')==''?-1:eval(req.body.searchUserId),
        fullname:req.body.searchFullName,
        date_log:req.body.searchStartTime,
        money_type:eval(req.body.searchMoneyType)
    },function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            return res.render('log/fish_bullet',{dataCards:[],search_form:{
                user_id:  req.body.searchUserId,
                fullname:req.body.searchFullName,
                date_log:req.body.searchStartTime,
                money_type:eval(req.body.searchMoneyType)
            }});
        }
        return res.render('log/fish_bullet',{dataCards:JSON.parse(JSON.stringify(dataX||[])),search_form:{
            user_id:  req.body.searchUserId,
            fullname:req.body.searchFullName,
            date_log:req.body.searchStartTime,
            money_type:eval(req.body.searchMoneyType)
        }});
    });
});


router.get('/report',function(req, res) {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var today =  ""+year+"-"+month+"-"+day;

    return res.render('log/report',{dataCards:[],search_form:{
        date_from:  today + " 00:00:00",
        date_to: today + " 23:59:59",
    }
    });
});



router.post('/report',function(req, res) {
    req.DA.admin_agent_report({
        date_from:req.body.searchStartTime,
        date_to:req.body.searchEndTime,
    },function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            return res.render('log/report',{dataCards:[],search_form:{
                date_from:req.body.searchStartTime,
                date_to:req.body.searchEndTime,
            }});
        }
        return res.render('log/report',{dataCards:JSON.parse(JSON.stringify(dataX||[])),search_form:{
            date_from:req.body.searchStartTime,
            date_to:req.body.searchEndTime,
        }});
    });
});

module.exports = router;
