var express = require('express');
var router = express.Router();
var eventsRounter = require('./events');

/* GET users listing. */
router.get('/', function(req, res) {
  res.send('respond with a resource');
});


router.get('/charge_card',function(req, res) {
  return res.render('admin/charge_card/list',{dataCards:[]});

  req.DA.admin_get_charge_card({

        user_id:req.body.user_id,
      fullname:req.body.user_id,
      date_from:req.body.user_id,
      date_to:req.body.user_id,
      card_code:req.body.user_id,
      card_seri:req.body.user_id,
      provider_code:req.body.user_id,
      status:req.body.user_id

  },function getServerConfig(err,dataX){
    if(err || !dataX)
    {
      console.log(err,dataX);
      return res.render('admin/charge_card/list',{dataCards:[]});
    }
    return res.render('admin/charge_card/list',{dataCards:dataX.data||[]});
  });
});

router.use('/events',eventsRounter);


module.exports = router;
