"use strict";
var _PushDA = require('../database/PushDA');
var config = require('../config/config');
var OneSignal = require('onesignal-node');
var HVKUtils = require('../shared_class/HVKUtils');
var OneSiginalPush = function(){
    this.app = null;
    this.PushDA = null;
    this.schedule = {
        auto_push:null
    };
    this.onesignal_client = new OneSignal.Client({
        userAuthKey: "YzE5MGRiNTMtM2U5My00Yjg5LTg4OGItM2I0N2Q0MmM5N2Iw",
        app: { appAuthKey: "ZWM2Nzk0NmQtNGUzMC00ZGE0LTlkZTMtODVlMzI4MGRjN2M0", appId: "b74b079b-1608-41e9-a028-7cd4c7d8e37c" }
    });
}
module.exports = OneSiginalPush;
OneSiginalPush.prototype.initModule = function(app)
{
    this.app = app;
    this.PushDA = new _PushDA(this.app);
    this.reset_schedule_auto_push();
}

OneSiginalPush.prototype.reset_schedule_auto_push = function(){
    var self = this;
    if(this.schedule.auto_push !=null){
        clearInterval(this.schedule.auto_push);
    }
    this.schedule.auto_push  = setInterval(function(){
        console.log("Try to get push");
        self.PushDA.get_all_auto_push({},function(err,data){
            if(err || !data)
            {
                return;
            }
            for(let i = 0; i< data.length;i++ )
            {
                self.do_push(data[i]);
            }
        });
    },config.system_config.auto_push_interval);
}

OneSiginalPush.prototype.do_push = function (data) {
    let myClient = this.onesignal_client;
    if (myClient == null || myClient == undefined) {
        return;
    }
    let notification = null;
    if (data.contents != null) {
        notification = new OneSignal.Notification({
            contents: HVKUtils.parseInputToJSON(data.contents)
        });
    } else {
        notification = new OneSignal.Notification({
            content_available: true
        });
    }
    if (data.headings != null) {
        notification.setParameter("headings", HVKUtils.parseInputToJSON(data.headings));
    }
    if (data.subtitle != null) {
        notification.setParameter("subtitle", HVKUtils.parseInputToJSON(data.subtitle));
    }
    if (data.included_segments != null) {
        notification.setIncludedSegments(HVKUtils.parseInputToJSON(data.included_segments));
    }
    if (data.excluded_segments != null) {
        notification.setIncludedSegments(HVKUtils.parseInputToJSON(data.excluded_segments));
    }
    if (data.filters != null) {
        notification.setFilters(HVKUtils.parseInputToJSON(data.filters));
    }
    if (data.include_player_ids != null) {
        notification.setTargetDevices(HVKUtils.parseInputToJSON(data.include_player_ids));
    }
    if (data.data != null) {
        notification.setParameter("data", HVKUtils.parseInputToJSON(data.data));
    }
    if (data.url != null) {
        notification.setParameter("url", data.url);
    }
    if (data.small_icon != null) {
        notification.setParameter("small_icon", data.small_icon);
    }
    if (data.large_icon != null) {
        notification.setParameter("small_icon", data.large_icon);
    }
    myClient.sendNotification(notification, function (err, httpResponse, data) {
        if (err) {
            console.log('Something went wrong... ', err, notification);
        } else {
            console.log("Push OK: ", httpResponse.statusCode, data);
        }
    });
}


