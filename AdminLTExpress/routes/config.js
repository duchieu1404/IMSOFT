var express = require('express');
var router = express.Router();
const fs = require('fs')
const fsex = require('fs-extra')

/* GET home page. */
router.get('/', function(req, res) {
    res.redirect('/index.html');
});

/* GET home page. */
router.get('/sync_category', function(req, res) {
    console.log("get sync_category ");
    req.app.ConfigDA.admin_config_data_sync_category_get_all({},function admin_config_data_sync_type_get_all(err,dataX){
        console.log(err,dataX);
        if(err || !dataX)
        {
            return res.render('config/sync_category',{dataConfigs:[]});
        }
        return res.render('config/sync_category',{dataConfigs:dataX});
    });
});

router.post('/sync_category', function(req, res) {
    req.app.ConfigDA.admin_config_data_sync_category_save({
        id:req.body.edt_Id,
        name:req.body.edt_Name,
        description:req.body.edt_Description
    },function(errSave,dataSave){
        return res.redirect('/config/sync_category');
    });
});

router.get('/sync_type', function(req, res) {
    req.app.ConfigDA.admin_config_data_sync_type_get_all({},function admin_config_data_sync_type_get_all(err,dataX){
        if(err || !dataX)
        {
            console.log(err,dataX);
            return res.render('config/sync_type',{dataConfigs:[]});
        }
        return res.render('config/sync_type',{dataConfigs:dataX});
    });
});



router.post('/sync_type', function(req, res) {
    req.app.ConfigDA.admin_config_data_sync_type_save({
        id:req.body.edt_Id,
        key:req.body.edt_Key,
        code:req.body.edt_Code,
        cate_type:req.body.edt_Cate_type,
        value_type:req.body.edt_Value_type,
        is_not_sync:req.body.edt_Is_not_sync,
        level:req.body.edt_Level,
        description:req.body.edt_Description
    },function(errSave,dataSave){
        return res.redirect('/config/sync_type');
    });
});


router.get('/refresh_sync_type_file',function(req,res){
    let path = './../public/file_configs/';

    

    fs.unlink(path, (err) => {
        if(err && err.code == 'ENOENT') {
            // file doens't exist
            console.info("File doesn't exist, won't remove it.");
        } else if (err) {
            // other errors, e.g. maybe we don't have enough permission
            console.error("Error occurred while trying to remove file");
        } else {
            console.info(`removed`);
        }
    });

    // With a callback:
    fsex.writeJson('./package.json', {name: 'fs-extra'}, err => {
        if (err) return console.error(err)

        console.log('success!')
    })



});



router.get('/tester', function(req, res) {
    console.log("get tester ");
    req.app.ConfigDA.admin_tester_get_all({},function admin_config_data_sync_type_get_all(err,dataX){
        console.log(err,dataX);
        if(err || !dataX)
        {
            return res.render('config/tester',{dataConfigs:[]});
        }
        return res.render('config/tester',{dataConfigs:dataX});
    });
});

router.post('/tester', function(req, res) {
    req.app.ConfigDA.admin_tester_save({
        id:req.body.edt_id,
        device_id:req.body.edt_device_id,
        os_type:req.body.edt_os_type,
        version:req.body.edt_version,
        status:req.body.edt_status,
        note:req.body.edt_note
    },function(errSave,dataSave){
        return res.redirect('/config/tester');
    });
});


router.post('/delete_tester', function(req, res) {
    console.log(req.body.delete_edt_Id);
    req.app.ConfigDA.admin_tester_delete({
        tester_id : req.body.delete_edt_Id
    },function(err,data){
        return res.send(data||{status:1,msg:"err"});
    });
});




router.get('/event_popup', function(req, res) {
    console.log("get tester ");
    req.app.ConfigDA.admin_event_popup_get_all({},function admin_event_popup_get_all(err,dataX){
        console.log(err,dataX);
        if(err || !dataX)
        {
            return res.render('config/event_popup',{dataConfigs:[]});
        }
        return res.render('config/event_popup',{dataConfigs:dataX});
    });
});

router.post('/event_popup', function(req, res) {
    req.app.ConfigDA.admin_event_popup_save({
        id:req.body.edt_id,
        os_type:req.body.edt_os_type,
        version:req.body.edt_version,
        status:req.body.edt_status,
        show_from:req.body.edt_show_from,
        show_to:req.body.edt_show_to,
        check_type:req.body.edt_check_type,
        force_view:req.body.edt_force_view,
        asset_url:req.body.edt_asset_url,
        bundle_name:req.body.edt_bundle_name,
        note:req.body.edt_note,
        promote_iap_cnf:req.body.edt_promo_iap,
        promote_bundle_cnf:req.body.edt_promo_bundle,
        template_type:req.body.edt_template_type,
        img_url:req.body.edt_img_url,
        data:req.body.edt_data,
        order_by:req.body.edt_order,
        show_map_count:req.body.edt_show_map_count,
        only_users:req.body.edt_only_users,
        ignore_users:req.body.edt_ignore_users,
        show_condition: req.body.edt_show_condition,
    },function(errSave,dataSave){
        return res.redirect('/config/event_popup');
    });
});


router.post('/delete_event_popup', function(req, res) {
    console.log(req.body.delete_edt_Id);
    req.app.ConfigDA.admin_event_popup_delete({
        event_id : req.body.delete_edt_Id
    },function(err,data){
        return res.send(data||{status:1,msg:"err"});
    });
});


// event gcc api

router.get('/event_gcc', function (req, res) 
{
    req.app.ConfigDA.admin_event_gcc_get_all({}, function admin_event_gcc_get_all(err, dataX) 
    {
        if (err || !dataX) {
            return res.render('config/event_gcc', { dataConfigs: [] });
        }
        return res.render('config/event_gcc', { dataConfigs: dataX });
    });
});

router.post('/event_gcc', function (req, res) 
{
    req.app.ConfigDA.admin_event_gcc_save({
        id: req.body.edt_id,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to,
        status: req.body.edt_status,
        rest_ids: req.body.edt_rest_ids,
        evt_copy: req.body.edt_evt_copy,
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_gcc');
    });
});


router.post('/event_gcc_delete', function (req, res) 
{
    req.app.ConfigDA.admin_event_gcc_delete({}, function admin_event_gcc_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_gcc_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});

router.post('/event_gcc_insert_test_data', function (req, res) {
    req.app.ConfigDA.event_gcc_insert_test_data({}, function event_gcc_insert_test_data(err, dataX) 
    {
        req.app.ConfigDA.event_gcc_insert_test_data(
        {
            event_id: req.body.edt_event_id,
            rest_id: req.body.edt_rest_id
        }, function (err, data) 
        {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});

//event ct

router.get('/event_ct', function (req, res) {
    req.app.ConfigDA.admin_event_ct_get_all({}, function admin_event_ct_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_ct', { dataConfigs: [] });
        }
        return res.render('config/event_ct', { dataConfigs: dataX });
    });
});

router.post('/event_ct', function (req, res) {
    req.app.ConfigDA.admin_event_ct_save({
        status: req.body.edt_status,
        id: req.body.edt_id,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to,
        count_by: req.body.edt_count_by,
        join_require: req.body.edt_join_require,
        join_reward: req.body.edt_join_reward,
        has_all_boost: req.body.edt_has_all_boost,
        max_rest_id: req.body.edt_max_rest_id,
        time_show_from: req.body.edt_time_show_from,
        time_show_to: req.body.edt_time_show_to,
        evt_popup_copy: req.body.edt_evt_popup_copy,
        champion_rest: req.body.edt_champion_rest
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_ct');
    });
});


router.post('/event_ct_delete', function (req, res) {
    req.app.ConfigDA.admin_event_ct_delete({}, function admin_ct_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_ct_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});

router.post('/event_ct_add_score', function (req, res) {
    req.app.ConfigDA.admin_event_ct_add_score({}, function admin_event_ct_add_score(err, dataX) {

        var json = [];

        if (!req.body.edt_event_id || !req.body.edt_score)
        {
            return;
        }
        list_score = 
        {
            "event_id" : req.body.edt_event_id,
            "score": parseInt(req.body.edt_score)
        }
        json.push(list_score);
        req.app.ConfigDA.admin_event_ct_add_score({
            user_id: req.body.edt_user_id,
            list_score: JSON.stringify(list_score)
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});

router.post('/event_ct_insert_test_data', function (req, res) {
    req.app.ConfigDA.admin_event_ct_insert_test_data({}, function admin_event_ct_insert_test_data(err, dataX) {
        req.app.ConfigDA.admin_event_ct_insert_test_data({
            event_id: req.body.edt_event_id,
            rest_id: req.body.edt_rest_id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});


//reward json

router.get('/reward_json', function (req, res) {
    return res.render('config/reward_json');
});

module.exports = router;
