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
router.get('/sync_category',async  function (req, res) {
    console.log("get sync_category ");
    await req.app.ConfigDA.admin_config_data_sync_category_get_all({}, function admin_config_data_sync_type_get_all(err, dataX) {
        console.log(err, dataX);
        if (err || !dataX) {
            return res.render('config/sync_category', { dataConfigs: [] });
        }
        return res.render('config/sync_category', { dataConfigs: dataX });
    });
});

router.post('/sync_category', async function (req, res) {
    await req.app.ConfigDA.admin_config_data_sync_category_save({
        id: req.body.edt_Id,
        name: req.body.edt_Name,
        description: req.body.edt_Description
    }, function (errSave, dataSave) {
        return res.redirect('/config/sync_category');
    });
});

router.get('/sync_type',async function (req, res) {
    await req.app.ConfigDA.admin_config_data_sync_type_get_all({}, function admin_config_data_sync_type_get_all(err, dataX) {
        if (err || !dataX) {
            console.log(err, dataX);
            return res.render('config/sync_type', { dataConfigs: [] });
        }
        return res.render('config/sync_type', { dataConfigs: dataX });
    });
});



router.post('/sync_type',async function (req, res) {
    await req.app.ConfigDA.admin_config_data_sync_type_save({
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



router.get('/tester',async function (req, res) {
    console.log("get tester ");
    await req.app.ConfigDA.admin_tester_get_all({}, function admin_config_data_sync_type_get_all(err, dataX) {
        console.log(err, dataX);
        if (err || !dataX) {
            return res.render('config/tester', { dataConfigs: [] });
        }
        return res.render('config/tester', { dataConfigs: dataX });
    });
});

router.post('/tester',async function (req, res) {
    await req.app.ConfigDA.admin_tester_save({
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


router.post('/delete_tester',async function (req, res) {
    console.log(req.body.delete_edt_Id);
    await req.app.ConfigDA.admin_tester_delete({
        tester_id: req.body.delete_edt_Id
    }, function (err, data) {
        return res.send(data || { status: 1, msg: "err" });
    });
});



//event pharmacy

router.get('/event_pharmacy',async function (req, res) {
    await req.app.ConfigDA.admin_event_pharmacy_get_all({}, function admin_event_pharmacy_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_pharmacy', { dataConfigs: [] });
        }
        return res.render('config/event_pharmacy', { dataConfigs: dataX });
    });
});

router.post('/event_pharmacy',async function (req, res) {
    await req.app.ConfigDA.admin_event_pharmacy_save({
        status: req.body.edt_status,
        id: req.body.edt_id,
        type: req.body.edt_type,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_pharmacy');
    });
});


router.post('/event_pharmacy_delete',async function (req, res) {
    await req.app.ConfigDA.admin_event_pharmacy_delete({}, function admin_pharmacy_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_pharmacy_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});




// event racing
router.get('/event_racing',async function (req, res) {
    await req.app.ConfigDA.admin_event_racing_get_all({}, function admin_event_racing_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_racing', { dataConfigs: [] });
        }
        return res.render('config/event_racing', { dataConfigs: dataX });
    });
});

router.post('/event_racing',async function (req, res) {
    await req.app.ConfigDA.admin_event_racing_save({
        status: req.body.edt_status,
        id: req.body.edt_id,
        id_event:req.body.edt_id_event,
        type: req.body.edt_type,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to,
        time_show_to:req.body.edt_time_show_to,
        time_show_from : req.body.edt_time_show_from,
        max_user:req.body.edt_max_user
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_racing');
    });
});


router.post('/event_racing_delete',async function (req, res) {
    await req.app.ConfigDA.admin_event_racing_delete({}, function admin_racing_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_racing_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});

// Event Seson pass

router.get('/event_ssp',async function (req, res) {
    await req.app.ConfigDA.admin_event_ssp_get_all({}, function admin_event_ssp_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_ssp', { dataConfigs: [] });
        }
        return res.render('config/event_ssp', { dataConfigs: dataX });
    });
});

router.post('/event_ssp',async function (req, res) {
    await req.app.ConfigDA.admin_event_ssp_save({
        status: req.body.edt_status,
        id: req.body.edt_id,
        type: req.body.edt_type,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to,
        id_ssp : req.body.edt_id_ssp,
        id_bundle : req.body.edt_id_bundle,
        link_download : req.body.edt_link_download,
        data_ssp : req.body.edt_data_ssp,
        level_x3 : req.body.edt_levelX3
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_ssp');
    });
});


router.post('/event_ssp_delete',async function (req, res) {
    await req.app.ConfigDA.admin_event_ssp_delete({}, function admin_ssp_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_ssp_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});


//Event Food Tour
router.get('/event_ft',async function (req, res) {
    await req.app.ConfigDA.admin_event_ft_get_all({}, function admin_event_ft_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_ft', { dataConfigs: [] });
        }
        return res.render('config/event_ft', { dataConfigs: dataX });
    });
});

router.post('/event_ft',async function (req, res) {
    await req.app.ConfigDA.admin_event_ft_save({
        id: req.body.edt_id,
        status: req.body.edt_status,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to,
        time_show_to: req.body.edt_time_show_to,
        join_require: req.body.edt_join_require,
        max_user : req.body.edt_max_user,
        rank1: req.body.edt_rank1,
        rank2: req.body.edt_rank2,
        rank3: req.body.edt_rank3,
        rank_to7: req.body.edt_rank_to7,
        rank_to20: req.body.edt_rank_to20,
        rank_to40: req.body.edt_rank_to40
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_ft');
    });
});

router.post('/admin_event_ft_save_test', async function (req, res) {
    await req.app.ConfigDA.admin_event_ft_save_test({}, function (errSave, dataSave) {
        return res.redirect('/config/event_ft');
    });
});

router.post('/event_ft_delete',async function (req, res) {
    await req.app.ConfigDA.admin_event_ft_delete({}, function admin_event_ft_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_ft_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});


router.post('/event_ft_insert_test_data',async function (req, res) {
    await req.app.ConfigDA.event_ft_insert_test_data({}, function event_ft_insert_test_data(err, dataX) {
        req.app.ConfigDA.event_ft_insert_test_data({
            event_id: req.body.edt_event_id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});
//Version

router.get('/version',async function (req, res) {
    await req.app.ConfigDA.admin_get_update_version({}, function admin_get_update_verison(err, dataX) {
        if (err || !dataX) {
            return res.render('config/version', { dataConfigs: [] });
        }
        return res.render('config/version', { dataConfigs: dataX });
    });
});

router.post('/version',async function (req, res) {
    await req.app.ConfigDA.admin_update_version_save({
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
 

// Event Seson pass

router.get('/event_ssp',async function (req, res) {
    await req.app.ConfigDA.admin_event_ssp_get_all({}, function admin_event_ssp_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_ssp', { dataConfigs: [] });
        }
        return res.render('config/event_ssp', { dataConfigs: dataX });
    });
});

router.post('/event_ssp',async function (req, res) {
    await req.app.ConfigDA.admin_event_ssp_save({
        status: req.body.edt_status,
        id: req.body.edt_id,
        type: req.body.edt_type,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to,
        id_ssp : req.body.edt_id_ssp,
        id_bundle : req.body.edt_id_bundle,
        link_download : req.body.edt_link_download
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_ssp');
    });
});


router.post('/event_ssp_delete',async function (req, res) {
    await req.app.ConfigDA.admin_event_ssp_delete({}, function admin_ssp_get_all(err, dataX) {
        req.app.ConfigDA.admin_event_ssp_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});
// data bonus data

router.get('/event_bonus_data',async function (req, res) {
    await req.app.ConfigDA.admin_event_bonus_data_get_all({}, function admin_event_bonus_data_get_all(err, dataX) {
        if (err || !dataX) {
            return res.render('config/event_bonus_data', { dataConfigs: [] });
        }
        return res.render('config/event_bonus_data', { dataConfigs: dataX });
    });
});

router.post('/event_bonus_data',async function (req, res) {
    await req.app.ConfigDA.admin_event_bonus_data_save({
        status: req.body.edt_status,
        id: req.body.edt_id,
        type: req.body.edt_type,
        time_from: req.body.edt_time_from,
        time_to: req.body.edt_time_to,
        id_ssp : req.body.edt_id_ssp,
        id_bundle : req.body.edt_id_bundle,
        link_download : req.body.edt_link_download,
        key_download :  req.body.key_download,
        data_pass : req.body.edt_data_pass,
        point_plus : req.body.edt_point_plus,
        level_x3 : req.body.edt_level_x3
    }, function (errSave, dataSave) {
        return res.redirect('/config/event_bonus_data');
    });
});


router.post('/delete_bonus_data',async function (req, res) {
    await req.app.ConfigDA.admin_bonus_data_delete({}, function admin_ssp_get_all(err, dataX) {
        req.app.ConfigDA.admin_bonus_data_delete({
            event_id: req.body.delete_edt_Id
        }, function (err, data) {
            return res.send(data || { status: 1, msg: "err" });
        });
    });
});

 
module.exports = router;
