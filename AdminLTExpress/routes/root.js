var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
    res.redirect('/index.html');
});

/* GET home page. */
router.get('/config/server', function(req, res) {
    req.DA.bc_get_server_config(function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            console.log(err,dataX);
            return res.render('root/config/server',{dataServerConfig:[]});
        }
        return res.render('root/config/server',{dataServerConfig:dataX.data});
    });
});

router.post('/config/server', function(req, res) {
    req.DA.bc_save_server_config({
        id:req.body.edt_Id,
        ckey:req.body.edt_Ckey,
        cvalue:req.body.edt_Cvalue,
        type:req.body.edt_Type,
        description:req.body.edt_Description
    },function(errSave,dataSave){
        return res.redirect('/root/config/server/');
    });
});

router.get('/config/fish_bullet/:money_type', function(req, res) {
    console.log("fish_bullet",req.param('money_type'));

    req.DA.bc_get_list_version({is_show:-1,money_type:req.param('money_type')==1?1:0},function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            console.log(err,dataX);
            return res.render('root/fish_bullet/version',{dataVersions:[],money_type:req.param('money_type')==1?1:0});
        }
        return res.render('root/fish_bullet/version',{dataVersions:dataX.data,money_type:req.param('money_type')==1?1:0});
    });
});

router.post('/config/fish_bullet', function(req, res) {
    req.DA.bc_save_config_version({
        version_id:req.body.edt_Id,
        name:req.body.edt_Name,
        description:req.body.edt_Description,
        order_by:req.body.edt_OrderBy,
        money_type:req.body.edt_Money_Type
    },function(errSave,dataSave){
        return res.redirect('/root/config/fish_bullet/'+req.body.edt_Money_Type);
    });
});

router.get('/config/fish_bullet/duplicate/:money_type/:version_id', function(req, res) {
    req.DA.bc_duplicate_version({version_id:req.param('version_id'),money_type:req.param('money_type')==1?1:0},function duplicateVersionConfig(errSave,dataXSave){
        return res.redirect('/root/config/fish_bullet/'+(req.param('money_type')==1?1:0));
    });
});

router.get('/config/fish_bullet/delete/:money_type/:version_id', function(req, res) {
    req.DA.bc_delete_version({version_id:req.param('version_id'),money_type:req.param('money_type')==1?1:0},function duplicateVersionConfig(errSave,dataXSave){
        req.DA.bc_get_list_version({is_show:-1,money_type:req.param('money_type')==1?1:0},function getServerConfig(err,dataX){
            return res.redirect('/root/config/fish_bullet/'+(req.param('money_type')==1?1:0));
        });
    });
});

router.get('/config/fish_bullet/change_active/:money_type/:version_id', function(req, res) {
    req.DA.bc_set_version_active({version_id:req.param('version_id'),money_type:req.param('money_type')==1?1:0},function duplicateVersionConfig(errSave,dataXSave){
        req.DA.bc_get_list_version({is_show:-1,money_type:req.param('money_type')==1?1:0},function getServerConfig(err,dataX){
            return res.redirect('/root/config/fish_bullet/'+(req.param('money_type')==1?1:0));
        });
    });
});

router.get('/config/fish_bullet/change_test/:money_type/:version_id', function(req, res) {
    req.DA.bc_set_version_test({version_id:req.param('version_id'),money_type:req.param('money_type')==1?1:0},function duplicateVersionConfig(errSave,dataXSave){
        req.DA.bc_get_list_version({is_show:-1,money_type:req.param('money_type')==1?1:0},function getServerConfig(err,dataX){
            return res.redirect('/root/config/fish_bullet/'+(req.param('money_type')==1?1:0));
        });
    });
});

router.get('/config/fish_bullet/change_show/:money_type/:version_id/:is_show', function(req, res) {
    console.log("change_show ",req.param('is_show'));
    req.DA.bc_set_version_show_hide({version_id:req.param('version_id')
        ,money_type:req.param('money_type')==1?1:0
        ,is_show:req.param('is_show')==1?1:0
    },function duplicateVersionConfig(errSave,dataXSave){
        req.DA.bc_get_list_version({is_show:-1,money_type:req.param('money_type')==1?1:0},function getServerConfig(err,dataX){
            return res.redirect('/root/config/fish_bullet/'+(req.param('money_type')==1?1:0));
        });
    });
});

router.get('/config/fish_bullet/fish_info/:money_type/:version_id', function(req, res) {

    console.log("fish_info",req.param('money_type'),req.param('version_id'));

    req.DA.bc_get_fishtype_by_version({id:-1
                    ,version_id:req.param('version_id')
                    ,money_type:req.param('money_type')==1?1:0
            },function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            console.log(err,dataX);
            return res.render('root/fish_bullet/fish_info',{fishInfos:[]
                ,money_type:req.param('money_type')==1?1:0
                ,version_id:req.param('version_id')
            });
        }
        return res.render('root/fish_bullet/fish_info',{fishInfos:dataX.data||[]
            ,money_type:req.param('money_type')==1?1:0
            ,version_id:req.param('version_id')
        });
    });
});

router.post('/config/fish_bullet/fish_info/save_fish_info', function(req, res) {
    req.DA.bc_save_fishtype({
        id:eval(req.body.edt_Fish_Id),
        name:req.body.edt_Ten,
        base_speed:eval(req.body.edt_TocDo),
        is_boss:req.body.edt_Is_Boss=='on'?1:0,
        is_active:req.body.edt_Is_Active=='on'?1:0,
        can_group:req.body.edt_BoiDan=='on'?1:0
        ,max_number_in_pool:eval(req.body.edt_SoLuongToiDa)
        ,decrease_bullet_pierce:eval(req.body.edt_HeSoChongXuyen)
        ,last_bullet_pierce_damm_ratio:eval(req.body.edt_DamXuyenCuoi)
        ,version_id:eval(req.body.edt_Version_Id)
        ,tb_id:eval(req.body.edt_Tb_id2||-1)
        ,money_type:eval(req.body.edt_Money_Type)
    },function(errSave,dataSave){
        return res.redirect('/root/config/fish_bullet/fish_info/'+(req.body.edt_Money_Type==1?1:0)+'/'+req.body.edt_Version_Id);
    });
});

router.post('/config/fish_bullet/fish_info/save_fish_bullet_info', function(req, res) {;
    req.DA.bc_save_fish_bullet({
        gold:eval(req.body.edt_Gold),
        base_hp:eval(req.body.edt_BaseHp),
        default_min_hp_ratio:eval(req.body.edt_MinHp),
        default_max_hp_ratio:eval(req.body.edt_MaxHp),
        default_appear_ratio:eval(req.body.edt_Ratio),
        special1_min_hp_ratio:eval(req.body.edt_MinHp_1),
        special1_max_hp_ratio:eval(req.body.edt_MaxHp_1),
        special1_appear_ratio:eval(req.body.edt_Ratio_1),
        special2_min_hp_ratio:eval(req.body.edt_MinHp_2),
        special2_max_hp_ratio:eval(req.body.edt_MaxHp_2),
        special2_appear_ratio:eval(req.body.edt_Ratio_2),
        fish_id:eval(req.body.edt_Fish_Id_Bullet),
        bullet_id:eval(req.body.edt_Bullet_Id),
        config_id:eval(req.body.edt_Config_id_Bullet||-1),
        version_id:eval(req.body.edt_Version_Id_Bullet),
        money_type:eval(req.body.edt_Money_Type_Bullet)
    },function(errSave,dataSave){
        return res.redirect('/root/config/fish_bullet/fish_info/'+(req.body.edt_Money_Type_Bullet==1?1:0)+'/'+req.body.edt_Version_Id_Bullet);
    });
});


router.get('/config/fish_bullet/bullet_info/:money_type/:version_id', function(req, res) {

    console.log("fish_info",req.param('money_type'),req.param('version_id'));

    req.DA.bc_get_bullettype({
        tb_id:-1
        ,id:-1
        ,version_id:req.param('version_id')
        ,money_type:req.param('money_type')==1?1:0
    },function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            console.log(err,dataX);
            return res.render('root/fish_bullet/bullet_info',{dataBullets:[]
                ,money_type:req.param('money_type')==1?1:0
                ,version_id:req.param('version_id')
            });
        }
        return res.render('root/fish_bullet/bullet_info',{dataBullets:dataX.data||[]
            ,money_type:req.param('money_type')==1?1:0
            ,version_id:req.param('version_id')
        });
    });
});

router.post('/config/fish_bullet/fish_info/save_bullet_info', function(req, res) {
    req.DA.bc_save_bullettype({
        id:req.body.edt_Bullet_Id,
        name:req.body.edt_TenSung,
        damm:req.body.edt_SatThuong,
        speed_shoot:req.body.edt_TocDoBan,
        speed_bullet:req.body.edt_TocDoDan,
        pierce:req.body.edt_DoXuyen,
        damm_range:req.body.edt_TamSatThuong,
        reflex_count:req.body.edt_NayTuong,
        type:req.body.edt_LoaiDanId,
        price:req.body.edt_Gia,
        version_id:req.body.edt_Version_Id,
        money_type:req.body.edt_Money_Type,
        tb_id:req.body.edt_Tb_Id
    },function(errSave,dataSave){
        return res.redirect('/root/config/fish_bullet/bullet_info/'+(req.body.edt_Money_Type==1?1:0)+'/'+req.body.edt_Version_Id);
    });
});


router.get('/admin/message', function(req, res) {
    return res.render('root/admin/message',{listUsers:[],search_form:{
        user_id:  -1,
        fullname:'',
        searchDeviceId:'',
        searchMax:0
    }});
});

router.post('/admin/message/search_user',function(req, res) {
    req.DA.admin_search_user({
        user_id:  req.body.searchUserId.replace(' ','')==''?-1:eval(req.body.searchUserId),
        fullname:req.body.searchFullName,
        device_id:req.body.searchDeviceId,
        searchMax:req.body.searchMax.replace(' ','')==''?-1:eval(req.body.searchMax),
    },function getServerConfig(err,dataX){
        if(err || !dataX)
        {
            return res.render('root/admin/message',{listUsers:[],search_form:{
                user_id:  req.body.searchUserId,
                fullname:req.body.searchFullName,
                searchDeviceId:req.body.searchDeviceId,
                searchMax:req.body.searchMax.replace(' ','')==''?-1:eval(req.body.searchMax)
            }});
        }
        return res.render('root/admin/message',{listUsers:dataX||[],search_form:{
            user_id:  req.body.searchUserId,
            fullname:req.body.searchFullName,
            searchDeviceId:req.body.searchDeviceId,
            searchMax:req.body.searchMax.replace(' ','')==''?-1:eval(req.body.searchMax)
        }});
    });
});

router.post('/admin/send_email_to_user',function(req, res) {
    req.DA.admin_send_email_to_user({
        user_id:  req.body.edt_Id.replace(' ','')==''?-1:eval(req.body.edt_Id),
        type: eval(req.body.edt_MessageType),
        money_value: eval(req.body.edt_MoneyValue),
        tite:req.body.edt_Title||'',
        content:req.body.edt_Content||''

    },function send_email_to_user(err,dataX){
        console.log("send_email_to_user sql:: ",err,dataX);
        return res.send(JSON.stringify(dataX||{status:"NG",msg:"Không thành công"}));
    });
});


router.get('/admin/xocdia', function(req, res) {
    req.DA.admin_xocdia_state_viewer({
    },function send_email_to_user(err,dataX){
        if(err ||! dataX)
         return res.render('root/admin/xocdia',{data:[]});


        return res.render('root/admin/xocdia',{data:dataX});

    });

});

router.post('/admin/xocdia/new_result',function(req, res) {
    req.DA.admin_xocdia_state_change({
        new_result:req.body.new_result
    },function change_new_state(err,dataX){
        if(err ||! dataX)
            return res.render('root/admin/xocdia',{data:[]});

        return res.render('root/admin/xocdia',{data:dataX});
    });
});




module.exports = router;
