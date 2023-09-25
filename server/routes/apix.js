let express = require('express');
let router = express.Router();
let HVKUtil = require('./../shared_class/HVKUtils');
let crypto = require('./../shared_class/crypt');
let config = require("../config/config");

// const app_config = require("../config/config");
/* GET users listing. */


router.post('/user_login_by_device_id', async function (req, res, next) {
    const startTime = Date.now();
    await req.app.UserDA.user_login_by_device_id(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_login_by_device_id",JSON.stringify(req.body), endTime - startTime);
     
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
         

        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/user_login_by_cloud_username', async function (req, res, next) {
    console.log("user_login_by_cloud_username data ", req.body);
    const startTime = Date.now(); 
      
    await req.app.UserDA.user_login_by_cloud_username(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_login_by_cloud_username",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

// const userSyncDataQueue = new Queue('Hospital_userSyncDataQueue');
router.post('/user_sync_data', async function (req, res, next) { 
    const startTime = Date.now(); 
//     console.log(HVKUtil.getDateTime," api user_sync_data data: user_id = " , req.body.user_id, " data => " , json.stringify(req.body));
//    if(app_config.userSyncDataLimiter.check(req)){
//         userSyncDataQueue.add(req.body); // Thêm dữ liệu của request vào hàng đợi
//         console.log(HVKUtil.getDateTime," add queue Hospital_userSyncDataQueue success: user_id = " , req.body.user_id, " data => " , json.stringify(req.body));
//         return res.json({
//             status: 1,
//             msg:"OK",
//             data: req.body
//         });
//       //  res.status(429).send('Too many requests for user_sync_data, added to queue.');
//    }else{
//         console.log(HVKUtil.getDateTime," call procedure user_sync_data: user_id = " , req.body.user_id, " data => " , json.stringify(req.body));
        await req.app.UserDA.user_sync_data(req.body, function (err, data) {
            
            const endTime = Date.now(); 
            HVKUtil.logDetails("user_sync_data",JSON.stringify(req.body), endTime - startTime);
            if (err || !data) {
            console.log(err);
                return res.json({
                    status: 1,
                    msg: "ServerMsg/api_fail"
                });
            }
            return res.json({
                status: data.status,
                msg: data.msg,
                data: data.data
            });
        })
//    }
   
});

// // Xử lý công việc trong hàng đợi
// userSyncDataQueue.process(async (job) => {
//     console.log(HVKUtil.getDateTime,' job_id= ',job.id ,' Processing job:', json.stringify(job.data));
//     await req.app.UserDA.user_sync_data(job.data, function (err, data) {
//         if (err || !data) { 
//             onsole.log(HVKUtil.getDateTime,'Run job userSyncDataQueue sync_data to database error:', json.stringify(err));
//         }
//         console.log(HVKUtil.getDateTime,'Run job update sync_data to database OK:', json.stringify(job.data));
//     })
//     // Thực hiện xử lý công việc tại đây
//   });
  
//   // Lắng nghe sự kiện khi có công việc hoàn thành
//   userSyncDataQueue.on('completed', (job) => {
//     console.log(`Job ${job.id} has been completed.`);
//   });

router.post('/user_get_user_data', async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.user_get_user_data(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_get_user_data",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/user_gem_change_log', async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.user_gem_change_log(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_gem_change_log",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/user_gem_change_log_list', async function (req, res, next) {
    const startTime = Date.now(); 

    await req.app.UserDA.user_gem_change_log_list(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_gem_change_log_list",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/email_user_get', async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.email_user_get(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("email_user_get",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/email_user_read', async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.email_user_read(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("email_user_read",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});



router.post('/email_user_claim_gift' , async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.email_user_claim_gift(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("email_user_claim_gift",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});



router.post('/email_user_claim_force_set', async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.email_user_claim_force_set(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("email_user_claim_force_set",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});




router.post('/email_user_claim_force_set_success', async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.email_user_claim_force_set_success(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("email_user_claim_force_set_success",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/email_user_check_has_mail', async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.email_user_check_has_mail(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("email_user_check_has_mail",JSON.stringify(req.body), endTime - startTime);

        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});



router.post('/team_create', async function (req, res, next) {

    const startTime = Date.now();

    await req.app.TeamDA.team_create(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_create",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/team_change_leader', async function (req, res, next) {

    const startTime = Date.now();

    await req.app.TeamDA.team_change_leader(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_change_leader",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/team_edit', async function (req, res, next) {

    const startTime = Date.now();

    await req.app.TeamDA.team_edit(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_edit",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});



router.post('/team_offer_join', async function (req, res, next) {
    const startTime = Date.now();

    await req.app.TeamDA.team_offer_join(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_offer_join",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        });
    })
});


router.post('/team_search', async function (req, res, next) {
    const startTime = Date.now();
    await req.app.TeamDA.team_search(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_search",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        });
    })
});

router.post('/team_get_achievement_by_user',async  function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_get_achievement_by_user(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_get_achievement_by_user",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/team_join',async  function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_join(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_join",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/team_leave',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_leave(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_leave",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/team_get_info',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_get_info(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_get_info",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/team_top_global',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_top_global(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_top_global",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: "{}"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});



router.post('/team_top_country',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_top_country(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_top_country",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: "{}"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});
router.post('/user_top_global',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.user_top_global(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_top_global",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: "{}"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/user_top_country',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.user_top_country(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_top_country",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: "{}"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/team_me',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_me(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_me",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});



router.post('/team_request_accept',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_request_accept(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_request_accept",JSON.stringify(req.body), endTime - startTime);

        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/team_request_reject',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.team_request_reject(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_request_reject",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/team_request_cancel',async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.TeamDA.team_request_cancel(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_request_cancel",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


router.post('/user_change_profile',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.user_change_profile(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_change_profile",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        });
    })
});



router.post('/highscore_level_add',async function (req, res, next) {

    const startTime = Date.now(); 
    await req.app.UserDA.highscore_level_add(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("highscore_level_add",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        });
    })




});


router.post('/highscore_level_get_me',async function (req, res, next) {

    const startTime = Date.now(); 
    await req.app.UserDA.highscore_level_get_me(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("highscore_level_get_me",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })




});




router.post('/highscore_level_add_multi', function (req, res, next) {

    //console.log("highscore_level_add_multi data:",req.body);

    // console.log("highscore_level_add_multi begin",{
    //     action:"highscore_level_add_multi",
    //     user_id:req.body.user_id,
    //     score:req.body.scores
    // }  );
    
    const startTime = Date.now(); 
    let md5URL = crypto.md5(JSON.stringify({
        action: "highscore_level_add_multi",
        user_id: req.body.user_id,
        score: req.body.scores
    }));
 
     req.app.RedisPool.get(md5URL, function (err, reply) {
        
        if (err || !reply) {

            req.app.RedisPool.set(md5URL, '1', function (err2) {
                req.app.RedisPool.expire(md5URL, 10, function (err3) {

                });
            });

            req.app.UserDA.highscore_level_add_multi(req.body, function (err, data) {
                const endTime = Date.now(); 
                HVKUtil.logDetails("highscore_level_get_me",JSON.stringify(req.body), endTime - startTime);
                if (err || !data) {
                    return res.json({
                        status: 1,
                        msg: "ServerMsg/api_fail"
                    });
                }
                return res.json({
                    status: 0,
                    msg: "OK",
                    data: data
                });
            });
        } else {
            return res.json({
                status: 1,
                msg: "DOUBLE REQUEST"
            });
        }
    });

});


router.post('/highscore_level_get_team',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.highscore_level_get_team(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("highscore_level_get_team",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        });
    })
});


router.post('/highscore_level_get_friend',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.highscore_level_get_friend(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("highscore_level_get_friend",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        });
    })
});


router.post('/highscore_level_get_global',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.highscore_level_get_global(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("highscore_level_get_global",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
 

        return res.json({
            "status": 0,
            "msg": "OK",
            "data": data.data
        });
    })
});


router.post('/user_ref_get',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.user_ref_get(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_ref_get",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});



router.post('/user_ref_claim',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.user_ref_claim(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_ref_claim",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: JSON.parse(data.data || "[]")
        });
    })
});
// Event CT
router.post('/event_ct_get_current',async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_ct_get_current(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_ct_get_current",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});
// end less 

router.post('/event_EndlessTreasure_get_event_info_this_week',async function (req, res, next) {
    const startTime = Date.now(); 
    let cacheKey = config.ev+"event_EndlessTreasure_get_event_info_this_week";
    req.app.RedisClient.get(cacheKey,function(error,results){
        if(!error && results != null){
            const endTime = Date.now(); 
                HVKUtil.logDetails("event_EndlessTreasure_get_event_info_this_week",JSON.stringify(req.body), endTime - startTime);
            console.log(" user_id = " + req.body.user_id + " get cache event_racing_get_current  = ", results);
            return res.json({
                status: 0,
                msg: "OK",
                data: JSON.parse(results)
            });
        }else{
             req.app.UserDA.event_EndlessTreasure_get_event_info_this_week(req.body, function (err, data) {
                const endTime = Date.now(); 
                HVKUtil.logDetails("event_EndlessTreasure_get_event_info_this_week",JSON.stringify(req.body), endTime - startTime);
                if (err || !data) {
                    console.log( " user_id = " + req.body.user_id + " call procedure error " + cacheKey +"  err =>", JSON.stringify(err));
                    return res.json({
                        status: 1,
                        msg: "ServerMsg/api_fail"
                    });
                }
                req.app.RedisClient.setex(cacheKey, data.cacheDuration, JSON.stringify(data.data));
                console.log(" user_id = " + req.body.user_id + " set cache redis key="+ cacheKey + " expried time = " + data.cacheDuration + " Ok data =>", JSON.stringify(data.data));
                return res.json({
                    status: 0,
                    msg: "OK",
                    data: data.data
                });
            })
    }
    });
 
});



//Event pharmacy

router.post('/event_pharmacy_get_event_info_this_week',async function (req, res, next) {
 
    let cacheKey = config.ev+"event_pharmacy_get_event_info_this_week";
    const startTime = Date.now(); 
    
    req.app.RedisClient.get(cacheKey,function(error,results){
        if(!error && results != null){
            const endTime = Date.now(); 
                HVKUtil.logDetails("event_pharmacy_get_event_info_this_week",JSON.stringify(req.body), endTime - startTime);
            console.log(" user_id = " + req.body.user_id + " get cache event_racing_get_current  = ", results);
            return res.json({
                status: 0,
                msg: "OK",
                data: JSON.parse(results)
            });
        }else{
             req.app.UserDA.event_pharmacy_get_event_info_this_week(req.body, function (err, data) {
                const endTime = Date.now(); 
                HVKUtil.logDetails("event_pharmacy_get_event_info_this_week",JSON.stringify(req.body), endTime - startTime);
                if (err || !data) {
                    console.log( " user_id = " + req.body.user_id + " call procedure error event_pharmacy_get_event_info_this_week err =>", JSON.stringify(err));
                    return res.json({
                        status: 1,
                        msg: "ServerMsg/api_fail"
                    });
                }
                req.app.RedisClient.setex(cacheKey, data.cacheDuration, JSON.stringify(data.data));
                console.log(" user_id = " + req.body.user_id + " set cache redis key="+ cacheKey + " expried time = " + data.cacheDuration + " Ok data =>", JSON.stringify(data.data));
                return res.json({
                    status: 0,
                    msg: "OK",
                    data: data.data
                });
            })
    }
    });
});


router.post('/event_racing_get_current',async function (req, res, next) {
    const startTime = Date.now(); 
    let cacheKey = config.ev+"event_racing_get_current";
    req.app.RedisClient.get(cacheKey,function(error,results){
        if(!error && results != null){
            const endTime = Date.now(); 
            HVKUtil.logDetails("event_racing_get_current",JSON.stringify(req.body), endTime - startTime);
            console.log(" user_id = " + req.body.user_id + " get cache event_racing_get_current  = ", results);
            return res.json({
                status: 0,
                msg: "OK",
                data: JSON.parse(results)
            });
        }else{
        req.app.UserDA.event_racing_get_current(req.body, function (err, data) {
            const endTime = Date.now(); 
            HVKUtil.logDetails("event_racing_get_current",JSON.stringify(req.body), endTime - startTime);
                if (err || !data) {
                    console.log( " user_id = " + req.body.user_id + " error event_racing_get_current err =>", JSON.stringify(err));
                    return res.json({
                        status: 1,
                        msg: "ServerMsg/api_fail"
                    });
                }
            
            req.app.RedisClient.setex(cacheKey, data.cacheDuration, JSON.stringify(data.data));
                console.log(" user_id = " + req.body.user_id + " set cache redis key="+ cacheKey + " expried time = " + data.cacheDuration + " Ok data =>", JSON.stringify(data.data));
                return res.json({
                    status: 0,
                    msg: "OK",
                    data: data.data
                });
            })
    
        }
    });
});

router.post('/hospital_del_redis_key', async function (req, res, next) {
      let key =  req.body.cacheKey;
      let keyApp =  req.body.keyApp;
      if(key && keyApp == "6gnb^QM3uRC8B"){
        req.app.RedisClient.del(key,function(err,reply){
        
        if (err) {
        console.error('Error deleting key:', err);
        return res.json({
                status: 0,
                msg: "Error delete key error = "+JSON.stringfy(err),
                data: null
            });
      } else {
          if (reply === 1) {
          console.log('Key deleted successfully.key redis='+key);
              return res.json({
                status: 0,
                msg: 'Key deleted successfully.key redis='+key,
                data: null
            });
              
          } else {
          console.log('Key redis='+key + ' not found');
            return res.json({
                status: 0,
                msg:'Key redis='+key + ' not found',
                data: null
            });
              
          }
      }
           // sole.log("Delete key redis ="+ key);
        })
      }
});



router.post('/event_racing_add_multi', async function (req, res, next) {
    const startTime = Date.now(); 

    await req.app.UserDA.event_racing_add_multi(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_racing_add_multi",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data || "{}"
        })
    });
});

router.post('/user_get_join_event_racing', async function (req, res, next) {
    const startTime = Date.now(); 
    if(req.body.user_id && req.body.user_id > 0){
        console.log("user_id = " + req.body.user_id + " don't get join  user_get_join_event_racing");
        return res.json({
            status: 1,
            msg: "ServerMsg/api_fail",
        });
    }
    await req.app.UserDA.user_get_join_event_racing(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_get_join_event_racing",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            console.log("user_id = " + req.body.user_id + " join  user_get_join_event_racing error =>", JSON.stringify(err));
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
            });
        }
        console.log("user_id = " + req.body.user_id + " join  user_get_join_event_racing sucess data =>", JSON.stringify(data));
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        })
    });
});
router.post('/user_join_event_racing', async function (req, res, next) {
    const startTime = Date.now(); 
    if(req.body.user_id && req.body.user_id > 0){
        console.log("user_id = " + req.body.user_id + " don't  join  user_get_join_event_racing");
        return res.json({
            status: 1,
            msg: "ServerMsg/api_fail",
        });
    }
    await req.app.UserDA.user_join_event_racing(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_join_event_racing",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            console.log( "user_id = " + req.body.user_id + " join  user_join_event_racing err =>", JSON.stringify(err));
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
            });
        }
        console.log("user_id = " + req.body.user_id + " join  user_join_event_racing sucess data =>", JSON.stringify(data));
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        })
    });
});
router.post('/event_racing_claiming_reward', async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_racing_claiming_reward(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_racing_claiming_reward",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        })
    });
});

router.post('/event_racing_get_leaderboard', async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_racing_get_leaderboard(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_racing_get_leaderboard",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        })
    });
});

router.post('/event_racing_get_leaderboard_final', async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_racing_get_leaderboard_final(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_racing_get_leaderboard_final",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        })
    });
});

router.post('/event_racing_get_leaderboard', async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_racing_get_leaderboard(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_racing_get_leaderboard",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        })
    });
});

//Event FT
router.post('/event_ft_get_current',async function (req, res, next) {
    const startTime = Date.now(); 

    await req.app.UserDA.event_ft_get_current(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_ft_get_current",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    });

});

router.post('/event_ft_add_multi', async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_ft_add_multi(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_ft_add_multi",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data || "{}"
        })
    });
});

router.post('/event_ft_get_leaderboard',async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_ft_get_leaderboard(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_ft_get_leaderboard",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        })
    });
});

router.post('/event_ft_get_leaderboard_final', async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_ft_get_leaderboard_final(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_ft_get_leaderboard_final",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        })
    });
});

router.post('/event_ft_get_reward',async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_ft_get_reward(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_ft_get_reward",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: {}
            });

        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        })
    });
});

router.post('/event_ft_claiming_reward',async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_ft_claiming_reward(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_ft_claiming_reward",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });

        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data,
        })
    });
});

router.post('/event_ft_check_ban_user_ft',async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.event_ft_check_ban_user_ft(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_ft_check_ban_user_ft",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: {}
            });

        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data,
        })
    });
});



router.post('/user_trophy_get',async function (req, res, next) {
    const startTime = Date.now(); 

    await req.app.UserDA.user_trophy_get(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_trophy_get",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        });
    })
});


router.post('/utc',async function (req, res, next) {

    const startTime = Date.now(); 
    await req.app.UserDA.user_test_check(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_test_check",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: 0
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/country', function (req, res, next) {

    console.log("country data:", req.body);

    var clientIP = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
    let ip = clientIP.split(",")[0].trim();
    var urlGetCountry = 'http://ip-api.com/json/' + ip + '?fields=status,country,city,countryCode';
    console.log("urlGetCountry " + urlGetCountry);
    var request = require('request');
    request(urlGetCountry, function (error, response, body) {
        console.log('error:', error); // Print the error if one occurred
        console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
        console.log('body:', body); // Print the HTML for the Google homepage.
        return res.send(body);
    });

});

router.post('/highscore_level_get_global',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.highscore_level_get_global(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("highscore_level_get_global",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "highscore_level_get_global error" + err

            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data
        });
    })
});



router.post('/friend_add_facebook_friends',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.friend_add_facebook_friends(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("friend_add_facebook_friends",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: 0,
            msg: "OK"
        });
    })
});



router.post('/team_info_get_list',async function (req, res, next) {
 
    const startTime = Date.now(); 
    await req.app.UserDA.team_info_get_list(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_info_get_list",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});



router.post('/user_info_get_list',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.user_info_get_list(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_info_get_list",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});



router.post('/user_info_get_list_facebook',async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.user_info_get_list_facebook(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_info_get_list_facebook",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});



router.post('/friend_get_all',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.friend_get_all(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("friend_get_all",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});

router.post('/invite_save_my_link',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.invite_save_my_link(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("invite_save_my_link",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});


router.post('/invite_get_invite_me',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.invite_get_invite_me(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("invite_save_my_link",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data || "{}"
        });
    })
});

router.post('/invite_set_invite_me',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.invite_set_invite_me(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("invite_set_invite_me",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});

router.post('/invite_get_my_invited',async function (req, res, next) {

 
    const startTime = Date.now(); 

    await req.app.UserDA.invite_get_my_invited(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("invite_get_my_invited",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data || "{}"
        });
    })
});


router.post('/invite_claim_reward',async function (req, res, next) {

  
    const startTime = Date.now(); 

    await req.app.UserDA.invite_claim_reward(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("invite_claim_reward",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});

router.post('/team_chat_send_message_system',async function (req, res, next) {

    const startTime = Date.now(); 
    await req.app.UserDA.team_chat_send_message_system(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_chat_send_message_system",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});
router.post('/team_claim_system_gift',async function (req, res, next) {
    
    const startTime = Date.now(); 
    await req.app.UserDA.team_claim_system_gift(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("team_claim_system_gift",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
                data: []
            });
        }
        return res.json({
            status: 0,
            msg: "OK",
            data: data.data
        });
    })
});

router.post('/user_data_get_list_id',async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.user_data_get_list_id(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_data_get_list_id",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail",
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/user_time_iap', async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.user_time_iap(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_time_iap",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post("/user_update_version",async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.user_update_version(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_update_version",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

module.exports = router;

router.post("/user_get_update_version",async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.user_get_update_version(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("user_get_update_version",JSON.stringify(req.body), endTime - startTime);

        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post("/config_get_time_server",async function (req, res, next) {
    const startTime = Date.now(); 
    await req.app.UserDA.config_get_time_server(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("config_get_time_server",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});


/** Season pass  */

router.post('/event_getall_config_ssp',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.event_getall_config_ssp(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_getall_config_ssp",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            console.log(Date.now(),"error event_getall_config_ssp");
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

router.post('/event_getall_config_ssp_v2',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.event_getall_config_ssp_v2(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_getall_config_ssp",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) { 
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});
router.post('/event_getall_config_ssp_v3',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.event_getall_config_ssp_v3(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_getall_config_ssp_v3",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            console.log(Date.now(),"error event_getall_config_ssp_v3");
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});




router.post('/event_getall_bonus_pass',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.UserDA.event_getall_bonus_pass(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("event_getall_bonus_pass",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            console.log(Date.now(),"error event_getall_bonus_pass");
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});
router.post('/User_get_rank_team',async function (req, res, next) {

    const startTime = Date.now(); 

    await req.app.TeamDA.User_get_rank_team(req.body, function (err, data) {
        const endTime = Date.now(); 
        HVKUtil.logDetails("User_get_rank_team",JSON.stringify(req.body), endTime - startTime);
        if (err || !data) {
            console.log(Date.now(),"error User_get_rank_team");
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }
        return res.json({
            status: data.status,
            msg: data.msg,
            data: data.data
        });
    })
});

module.exports = router;
