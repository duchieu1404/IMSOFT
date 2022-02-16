let express = require('express');
let router = express.Router();
let HVKUtil = require('./../shared_class/HVKUtils');
let crypto = require('./../shared_class/crypt');
/* GET users listing. */


router.post('/user_login_by_device_id', function (req, res, next) {
    console.log("user_login_by_device_id data", req.body);
    req.app.UserDA.user_login_by_device_id(req.body, function (err, data) {
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


router.post('/user_login_by_cloud_username', function (req, res, next) {
    console.log("user_login_by_cloud_username data ", req.body);
    req.app.UserDA.user_login_by_cloud_username(req.body, function (err, data) {
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


router.post('/user_sync_data', function (req, res, next) {
    console.log("user_sync_data data:", req.body);
    req.app.UserDA.user_sync_data(req.body, function (err, data) {
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

router.post('/user_get_user_data', function (req, res, next) {

    console.log("user_get_user_data data:", req.body);

    req.app.UserDA.user_get_user_data(req.body, function (err, data) {
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


router.post('/user_gem_change_log', function (req, res, next) {

    console.log("user_gem_change_log data:", req.body);

    req.app.UserDA.user_gem_change_log(req.body, function (err, data) {
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

router.post('/user_gem_change_log_list', function (req, res, next) {

    console.log("user_gem_change_log_list data:", req.body);

    req.app.UserDA.user_gem_change_log_list(req.body, function (err, data) {
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

router.post('/email_user_get', function (req, res, next) {

    console.log("email_user_get data:", req.body);

    req.app.UserDA.email_user_get(req.body, function (err, data) {
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


router.post('/email_user_read', function (req, res, next) {

    console.log("mail_user_read data:", req.body);

    req.app.UserDA.email_user_read(req.body, function (err, data) {
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



router.post('/email_user_claim_gift', function (req, res, next) {

    console.log("email_user_claim_gift data:", req.body);

    req.app.UserDA.email_user_claim_gift(req.body, function (err, data) {
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



router.post('/email_user_claim_force_set', function (req, res, next) {

    console.log("email_user_claim_force_set data:", req.body);

    req.app.UserDA.email_user_claim_force_set(req.body, function (err, data) {
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




router.post('/email_user_claim_force_set_success', function (req, res, next) {

    console.log("email_user_claim_force_set_success data:", req.body);

    req.app.UserDA.email_user_claim_force_set_success(req.body, function (err, data) {
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

router.post('/email_user_check_has_mail', function (req, res, next) {

    console.log("email_user_check_has_mail data:", req.body);

    req.app.UserDA.email_user_check_has_mail(req.body, function (err, data) {
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



router.post('/team_create', function (req, res, next) {

    console.log("team_create data:", req.body);

    req.app.TeamDA.team_create(req.body, function (err, data) {
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



router.post('/team_edit', function (req, res, next) {

    console.log("team_edit data:", req.body);

    req.app.TeamDA.team_edit(req.body, function (err, data) {
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



router.post('/team_offer_join', function (req, res, next) {

    console.log("team_offer_join data:", req.body);

    req.app.TeamDA.team_offer_join(req.body, function (err, data) {
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


router.post('/team_search', function (req, res, next) {

    console.log("team_search data:", req.body);

    req.app.TeamDA.team_search(req.body, function (err, data) {
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


router.post('/team_join', function (req, res, next) {

    console.log("team_join data:", req.body);

    req.app.TeamDA.team_join(req.body, function (err, data) {
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


router.post('/team_leave', function (req, res, next) {

    console.log("team_leave data:", req.body);

    req.app.TeamDA.team_leave(req.body, function (err, data) {
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

router.post('/team_get_info', function (req, res, next) {

    console.log("team_get_info data:", req.body);

    req.app.TeamDA.team_get_info(req.body, function (err, data) {
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

router.post('/team_top_global', function (req, res, next) {

    console.log("team_top_global data:", req.body);

    req.app.TeamDA.team_top_global(req.body, function (err, data) {
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



router.post('/team_top_country', function (req, res, next) {

    console.log("team_top_country data:", req.body);

    req.app.TeamDA.team_top_country(req.body, function (err, data) {
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

router.post('/team_me', function (req, res, next) {

    console.log("team_me data:", req.body);

    req.app.TeamDA.team_me(req.body, function (err, data) {
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



router.post('/team_request_accept', function (req, res, next) {

    console.log("team_request_accept data:", req.body);

    req.app.TeamDA.team_request_accept(req.body, function (err, data) {
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


router.post('/team_request_reject', function (req, res, next) {

    console.log("team_request_reject data:", req.body);

    req.app.TeamDA.team_request_reject(req.body, function (err, data) {
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


router.post('/team_request_cancel', function (req, res, next) {

    console.log("team_request_cancel data:", req.body);

    req.app.TeamDA.team_request_cancel(req.body, function (err, data) {
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


router.post('/user_change_profile', function (req, res, next) {

    console.log("user_change_profile data:", req.body);

    req.app.UserDA.user_change_profile(req.body, function (err, data) {
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



router.post('/highscore_level_add', function (req, res, next) {

    console.log("highscore_level_add data:", req.body);

    req.app.UserDA.highscore_level_add(req.body, function (err, data) {
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


router.post('/highscore_level_get_me', function (req, res, next) {

    console.log("highscore_level_get_me data:", req.body);

    req.app.UserDA.highscore_level_get_me(req.body, function (err, data) {
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

    let md5URL = crypto.md5(JSON.stringify({
        action: "highscore_level_add_multi",
        user_id: req.body.user_id,
        score: req.body.scores
    }));

    console.log("highscore_level_add_multi", md5URL);

    req.app.RedisPool.get(md5URL, function (err, reply) {
        if (err || !reply) {

            req.app.RedisPool.set(md5URL, '1', function (err2) {
                req.app.RedisPool.expire(md5URL, 10, function (err3) {

                });
            });

            req.app.UserDA.highscore_level_add_multi(req.body, function (err, data) {
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


router.post('/highscore_level_get_team', function (req, res, next) {

    console.log("highscore_level_get_team data:", req.body);

    req.app.UserDA.highscore_level_get_team(req.body, function (err, data) {
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


router.post('/highscore_level_get_friend', function (req, res, next) {

    console.log("highscore_level_get_friend data:", req.body);

    req.app.UserDA.highscore_level_get_friend(req.body, function (err, data) {
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


router.post('/highscore_level_get_global', function (req, res, next) {

    console.log("highscore_level_get_global data:", req.body);

    req.app.UserDA.highscore_level_get_global(req.body, function (err, data) {
        if (err || !data) {
            return res.json({
                status: 1,
                msg: "ServerMsg/api_fail"
            });
        }

        console.log("highscore_level_get_global" + data);

        return res.json({
            "status": 0,
            "msg": "OK",
            "data": data.data
        });
    })
});


router.post('/user_ref_get', function (req, res, next) {

    console.log("user_ref_get data:", req.body);

    req.app.UserDA.user_ref_get(req.body, function (err, data) {
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



router.post('/user_ref_claim', function (req, res, next) {

    console.log("user_ref_claim data:", req.body);

    req.app.UserDA.user_ref_claim(req.body, function (err, data) {
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
router.post('/event_ct_get_current', function (req, res, next) {
    req.app.UserDA.event_ct_get_current(req.body, function (err, data) {
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

//Event FSC

router.post('/event_fsc_get_event_info_this_week', function (req, res, next) {

    console.log("event_fsc_get_event_info_this_week:", req.body);

    req.app.UserDA.event_fsc_get_event_info_this_week(req.body, function (err, data) {
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


router.post('/user_trophy_get', function (req, res, next) {

    console.log("user_trophy_get data:", req.body);

    req.app.UserDA.user_trophy_get(req.body, function (err, data) {
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


router.post('/utc', function (req, res, next) {

    console.log("user_test_check data:", req.body);

    req.app.UserDA.user_test_check(req.body, function (err, data) {
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
    var urlGetCountry = 'http://ip-api.com/json/' + clientIP + '?fields=status,country,city,countryCode';
    console.log("urlGetCountry " + urlGetCountry);
    var request = require('request');
    request(urlGetCountry, function (error, response, body) {
        console.log('error:', error); // Print the error if one occurred
        console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
        console.log('body:', body); // Print the HTML for the Google homepage.
        return res.send(body);
    });

});

router.post('/highscore_level_get_global', function (req, res, next) {

    console.log("highscore_level_get_global data:", req.body);

    req.app.UserDA.highscore_level_get_global(req.body, function (err, data) {
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



router.post('/friend_add_facebook_friends', function (req, res, next) {

    console.log("friend_add_facebook_friends data:", req.body);

    req.app.UserDA.friend_add_facebook_friends(req.body, function (err, data) {
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



router.post('/team_info_get_list', function (req, res, next) {

    console.log("team_info_get_list data:", req.body);

    req.app.UserDA.team_info_get_list(req.body, function (err, data) {
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



router.post('/user_info_get_list', function (req, res, next) {

    console.log("user_info_get_list data:", req.body);

    req.app.UserDA.user_info_get_list(req.body, function (err, data) {
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



router.post('/user_info_get_list_facebook', function (req, res, next) {

    console.log("user_info_get_list_facebook data:", req.body);

    req.app.UserDA.user_info_get_list_facebook(req.body, function (err, data) {
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



router.post('/friend_get_all', function (req, res, next) {

    console.log("friend_get_all data:", req.body);

    req.app.UserDA.friend_get_all(req.body, function (err, data) {
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

router.post('/invite_save_my_link', function (req, res, next) {

    console.log("invite_save_my_link data:");

    req.app.UserDA.invite_save_my_link(req.body, function (err, data) {
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


router.post('/invite_get_invite_me', function (req, res, next) {

    console.log("invite_get_invite_me data:");

    req.app.UserDA.invite_get_invite_me(req.body, function (err, data) {
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

router.post('/invite_set_invite_me', function (req, res, next) {

    console.log("invite_set_invite_me data:");

    req.app.UserDA.invite_set_invite_me(req.body, function (err, data) {
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

router.post('/invite_get_my_invited', function (req, res, next) {

    console.log("invite_get_my_invited data:");

    req.app.UserDA.invite_get_my_invited(req.body, function (err, data) {
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


router.post('/invite_claim_reward', function (req, res, next) {

    console.log("invite_claim_reward data:");

    req.app.UserDA.invite_claim_reward(req.body, function (err, data) {
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

router.post('/team_chat_send_message_system', function (req, res, next) {
    req.app.UserDA.team_chat_send_message_system(req.body, function (err, data) {
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
router.post('/team_claim_system_gift', function (req, res, next) {
    req.app.UserDA.team_claim_system_gift(req.body, function (err, data) {
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

router.post('/user_data_get_list_id', function (req, res, next) {
    req.app.UserDA.user_data_get_list_id(req.body, function (err, data) {
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

router.post('/user_time_iap', function (req, res, next) {
    req.app.UserDA.user_time_iap(req.body, function (err, data) {
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

router.post("/user_update_version", function (req, res, next) {
    req.app.UserDA.user_update_version(req.body, function (err, data) {
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

router.post("/user_get_update_version", function (req, res, next) {
    req.app.UserDA.user_get_update_version(req.body, function (err, data) {
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
