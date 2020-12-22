/**
 * Created by luckyman on 4/19/17.
 */
var express = require('express');
var router = express.Router();

router.get('/',function(req, res) {
    req.DA.admin_get_list_events([],function reload_list_events(err,dataX){
        if(err || !dataX)
        {
            return res.render('admin/events/events',{dataEvent:[]});
        }
        return res.render('admin/events/events',{dataEvent:dataX});
    });
});

router.get('/duplicate/:event_id',function(req, res){
    req.DA.admin_event_duplicate({event_id:req.param('event_id')},function reload_list_events(err,dataX){
        if(err || !dataX)
        {
            return res.redirect('/admin/events');
        }
        return res.redirect('/admin/events');
    });
});


router.get('/delete/:event_id',function(req, res){
    req.DA.admin_event_delete({event_id:req.param('event_id')},function reload_list_events(err,dataX){
        if(err || !dataX)
        {
            return res.redirect('/admin/events');
        }
        return res.redirect('/admin/events');
    });
});

router.post('/events',function(req, res) {
    console.log("charge_card search : ",req.body);
    req.DA.admin_save_events_info({
         id:req.body.edt_id
        ,os_show:req.body.edt_os_show
        ,version_name:req.body.edt_version_name
        ,disable_review:req.body.edt_disable_review
        ,event_status:req.body.edt_event_status
        ,from_time:req.body.edt_from_time
        ,to_time:req.body.edt_to_time
        ,force_view:req.body.edt_force_view
        ,title:req.body.edt_title
        ,content:req.body.edt_content
        ,img_small:req.body.edt_img_small
        ,img_full:req.body.edt_img_full
        ,web_url:req.body.edt_web_url
        ,btn1_skin:req.body.edt_btn1_skin
        ,btn1_label:req.body.edt_btn1_label
        ,btn1_action:req.body.edt_btn1_action
        ,btn1_data:req.body.edt_btn1_data
        ,btn2_skin:req.body.edt_btn2_skin
        ,btn2_label:req.body.edt_btn2_label
        ,btn2_action:req.body.edt_btn2_action
        ,btn2_data:req.body.edt_btn2_data
    },function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            return res.redirect('/admin/events/events');
        }
        return res.redirect('/admin/events/events');
    });
});

module.exports = router;
