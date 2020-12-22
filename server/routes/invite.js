let express = require('express');
let router = express.Router();
let HVKUtil = require('./../shared_class/HVKUtils');
let crypto = require('./../shared_class/crypt');

/* GET home page. */
router.get('/', function(req, res, next) {
  getShortLink(req,res,next);
});

router.get('/:ref_code', function(req, res, next) {
  getShortLink(req,res,next);
});
router.get('/:ref_code/:desc', function(req, res, next) {
  getShortLink(req,res,next);
});

function getShortLink(req,res,next){
   let dataReq = {ref_code:req.params.ref_code||""};

  req.app.UserDA.invite_get_short_link(dataReq,function(err,data){
    if(err || !data){
      res.render('invite', { title: 'Food Voyage',inviteInfo:{ref_code:"02YCLOCC",short_link:"https://foodvoyage.page.link/imxYvkGSRTraWHaLA"} });
      return 1;
    }
    else
    {
      res.render('invite', { title: 'Food Voyage',inviteInfo:data });
    }
  });


}



module.exports = router;
