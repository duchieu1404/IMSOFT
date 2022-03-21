const { RSA_NO_PADDING } = require('constants');
var express = require('express');
var router = express.Router();
const fs = require('fs')
const fsex = require('fs-extra');
const { render } = require('../../server/app');

/* GET home page. */
router.get('/', function (req, res) {
    res.redirect('/index.html');
});

/* GET home page. */
router.get('/sync_category', function (req, res) {
    console.log("get sync_category ");
    req.app.ConfigDA.admin_config_data_sync_category_get_all({}, function admin_config_data_sync_type_get_all(err, dataX) {
        console.log(err, dataX);
        if (err || !dataX) {
            return res.render('config/sync_category', { dataConfigs: [] });
        }
        return res.render('config/sync_category', { dataConfigs: dataX });
    });
});

router.post('/sync_category', function (req, res) {
    req.app.ConfigDA.admin_config_data_sync_category_save({
        id: req.body.edt_Id,
        name: req.body.edt_Name,
        description: req.body.edt_Description
    }, function (errSave, dataSave) {
        return res.redirect('/config/sync_category');
    });
});

router.get('/sync_type', function (req, res) {
    req.app.ConfigDA.admin_config_data_sync_type_get_all({}, function admin_config_data_sync_type_get_all(err, dataX) {
        if (err || !dataX) {
            console.log(err, dataX);
            return res.render('config/sync_type', { dataConfigs: [] });
        }
        return res.render('config/sync_type', { dataConfigs: dataX });
    });
});



router.post('/sync_type', function (req, res) {
    req.app.ConfigDA.admin_config_data_sync_type_save({
        id: req.body.edt_Id,
        key: req.body.edt_Key,
        code: req.body.edt_Code,
        cate_type: req.body.edt_Cate_type,
        value_type: req.body.edt_Value_type,
        is_not_sync: req.body.edt_Is_not_sync,
        level: req.body.edt_Level,
        description: req.body.edt_Description
    }, function (errSave, dataSave) {
        return res.redirect('/config/sync_type');
    });
});


router.get('/refresh_sync_type_file', function (req, res) {
    let path = './../public/file_configs/';



    fs.unlink(path, (err) => {
        if (err && err.code == 'ENOENT') {
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
    fsex.writeJson('./package.json', { name: 'fs-extra' }, err => {
        if (err) return console.error(err)

        console.log('success!')
    })



});



router.get('/tester', function (req, res) {
    console.log("get tester ");
    req.app.ConfigDA.admin_tester_get_all({}, function admin_config_data_sync_type_get_all(err, dataX) {
        console.log(err, dataX);
        if (err || !dataX) {
            return res.render('config/tester', { dataConfigs: [] });
        }
        return res.render('config/tester', { dataConfigs: dataX });
    });
});

router.post('/tester', function (req, res) {
    req.app.ConfigDA.admin_tester_save({
        id: req.body.edt_id,
        device_id: req.body.edt_device_id,
        os_type: req.body.edt_os_type,
        version: req.body.edt_version,
        status: req.body.edt_status,
        note: req.body.edt_note
    }, function (errSave, dataSave) {
        return res.redirect('/config/tester');
    });
});


router.post('/delete_tester', function (req, res) {
    console.log(req.body.delete_edt_Id);
    req.app.ConfigDA.admin_tester_delete({
        tester_id: req.body.delete_edt_Id
    }, function (err, data) {
        return res.send(data || { status: 1, msg: "err" });
    });
});



//event fsc

router.get('/event_fsc', function (req, res) {
    req.app.ConfigDA.admin_event_fsc_get_all({}, function admin_event_fsc_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_fsc', { dataConfigs: [] });
        }
        return res.render('config/event_fsc', { dataConfigs: dataX });
    });
});

router.post('/event_fsc', function (req, res) {
    req.app.ConfigDA.admin_event_fsc_save({
        status: req.body.edt_status,
        id: req.body.edt_id,
        type: req.body.edt_type,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_fsc');
    });
});


router.post('/event_fsc_delete', function (req, res) {
    req.app.ConfigDA.admin_event_fsc_delete({}, function admin_fsc_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_fsc_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});

//Event Food Tour
router.post('/event_ft', function (req, res) {
    req.app.ConfigDA.admin_ft_get_all({}, function admin_ft_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_ft', { dataConfigs: [] });
        }
        return res.render('config/event_ft', { dataConfigs: dataX });
    });
});

router.post('event_ft', function (req, res) {
    req.app.ConfigDA.admin_event_ft_save({
        id: req.body.edt_id,
        status: req.body.edt_status,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to,
        time_show_to: req.body.edt_time_show_to,
        join_require: req.body.edt_join_require
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_ft');
    });
});

router.post('event_ft_delete', function (req, res) {
    req.app.ConfigDA.admin_event_ft_delete({}, function admin_ft_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_ft_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});

//Version

router.get('/version', function (req, res) {
    req.app.ConfigDA.admin_get_update_version({}, function admin_get_update_verison(err, dataX) {
        if (err || !dataX) {
            return res.render('config/version', { dataConfigs: [] });
        }
        return res.render('config/version', { dataConfigs: dataX });
    });
});

router.post('/version', function (req, res) {
    req.app.ConfigDA.admin_update_version_save({
        id: req.body.edt_id,
        version: req.body.edt_version,
        status: req.body.edt_status,
    }, function (errSave, dataSave) {
        return res.redirect('/config/version');
    });
});

//reward json

router.get('/reward_json', function (req, res) {
    return res.render('config/reward_json');
});

module.exports = router;
