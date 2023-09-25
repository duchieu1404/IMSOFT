var HVKUtils = {};

HVKUtils.array_sort = function(arr, property, desc) {
    function sorter(aa, bb) {
        var a = !desc ? aa : bb;
        var b = !desc ? bb : aa;

        if (typeof a[property] == "number") {
            return (a[property] - b[property]);
        } else {
            return ((a[property] < b[property]) ? -1 : ((a[property] > b[property]) ? 1 : 0));
        }
    }
    return arr.sort(sorter);
};

HVKUtils.createRandomString = function(prefixName, lengthRandom) {
    lengthRandom = lengthRandom || 10;
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < lengthRandom; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return prefixName + text;
}

// Returns a random number between 0 (inclusive) and 1 (exclusive)
HVKUtils.getRandom = function() {
        return Math.random();
    }
    // Returns a random number between min (inclusive) and max (exclusive)
HVKUtils.getRandomArbitrary = function(min, max) {
        return Math.random() * (max - min) + min;
    }
    // Returns a random integer between min (included) and max (excluded)
    // Using Math.round() will give you a non-uniform distribution!
HVKUtils.getRandomInt = function(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }
    // Returns a random integer between min (included) and max (included)
    // Using Math.round() will give you a non-uniform distribution!
HVKUtils.getRandomIntInclusive = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

HVKUtils.createRandomRoomId = function(prefixName) {
    var lengthRandom = 3;
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < lengthRandom; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return prefixName + text + Math.floor(Date.now() / 1000);
}

HVKUtils.createNewRoomId = function() {
    return Math.floor(Date.now() / 1000);
}

HVKUtils.getKeyValueHashMap = function(objHashMap) {
    var keyValues = {};
    objHashMap.forEach(function(value, key) { keyValues[key] = value });
    return keyValues;
}

HVKUtils.getDateTime = function() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    return "'" + year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second + "'";
}

HVKUtils.getDateTimeLog = function() {
    var date = new Date();
    return date;
}

HVKUtils.getDate = function() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    return "-" + year + "-" + month + "-" + day;
}

HVKUtils.getDateTimeForFile = function() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    return "" + year + "-" + month + "-" + day + "-" + hour;
}



HVKUtils.getDateString = function() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    return "" + year + "-" + month + "-" + day;
}

HVKUtils.join_socket_name = function(clientSocket, socketName) // join client vào room của socket để broadcast
    {
        clientSocket.join(socketName);
    }
HVKUtils.leave_socket_name = function(clientSocket, socketName) // join client vào room của socket để broadcast
    {
        clientSocket.leave(socketName);
    }


HVKUtils.broadcastRoomName = function(ioBr, roomName, command, data) {
    var x_Date = Date.now();
    var user_count = HVKUtils.numClientsInRoom(ioBr, "/", roomName);

    if (roomName) {
        if (ioBr.in(roomName)) {
            ioBr.in(roomName).emit(command, data);
        } else {
            ioBr.sockets.in(roomName).emit(command, data);
        }
    } else {
        ioBr.emit(command, data);

    }
    var time_push = Date.now() - x_Date;
    var l = [
        'TS: ' + x_Date,
        'T: ' + time_push + "ms",
        'U: ' + user_count
    ];
    console.log(l.join(',\t'));

}

HVKUtils.numClientsInRoom = function(ioBr, namespace, room) {
    if (!room) {
        return Object.keys(ioBr.sockets.sockets).length;
    }
    if (ioBr.nsps[namespace].adapter.rooms[room]) {
        return (ioBr.sockets.adapter.rooms[room].length);
    }
    return 0;
}

HVKUtils.boardcastRoomNameExceptSender = function(roomObjName, command, data, sender) {
    sender.broadcast.to(roomObjName).emit(command, data);
}


HVKUtils.sendMessageToClient = function(ioX, client_id, command, data) {
    ioX.sockets.to(client_id).emit(command, data);
};

HVKUtils.getClientObjBySocketID = function(ioX, socket_id) {
    var client = (ioX && ioX.sockets && ioX.sockets.connected) ? ioX.sockets.connected[socket_id] : null;
    if (client == null || client == undefined) {
        client = (ioX && ioX.sockets && ioX.sockets.socket) ? ioX.sockets.socket(socket_id) : null;
    }
    return client;
}

HVKUtils.forceDisconectSocketByID = function(ioX, socket_id, DA) {
    var client = HVKUtils.getClientObjBySocketID(ioX, socket_id);
    if (client) {
        HVKUtils.forceDisconnectSocket(ioX, client, DA);
    }
}


HVKUtils.forceDisconnectSocket = function(ioX, client, DA) {
    if (client.user_id == null || client.user_id == undefined) {
        try {
            client.disconnect(true);
        } catch (err) {

        }
        return;
    }

    // DA.bc_cache_player_left_room({
    //     user_id: client.user_id
    // }, function(errorX, dataX) {
    //     if (errorX) {}
    //     if (dataX && dataX[0] && dataX[0].length > 0) {
    //         var xRoom = dataX[0][0];
    //         HVKUtils.leave_socket_room(client, xRoom.type, xRoom.id);
    //         HVKUtils.broadcastRoomObj(ioX, xRoom, "bc_has_player_left_room_result", {
    //             status: "OK",
    //             "msg": "Have user left room",
    //             "data": { id: client.user_id }
    //         }, client);
    //         if (xRoom.is_deleted != 1) {
    //             HVKUtils.broadcastRoomObj(ioX, xRoom, "bc_set_player_to_key_result", {
    //                 status: "OK",
    //                 "msg": "Server set you to key for this game",
    //                 "data": { is_key: xRoom.key_socket_id == client.user_id ? 1 : 0, player_key: xRoom.player_key }
    //             });
    //         }
    //     }
    //     DA.bc_cache_disconnect_socket({ user_id: client.user_id, socket_id: client.id }, function(er1, dt1) {});
    // });
    client.disconnect(true);

}

HVKUtils.parseInputToJSON = function(jData) {
    if (jData == null || jData == "") {
        return {};
    }
    var data = {};
    try {
        data = JSON.parse(jData);
    } catch (exx) {
        data = jData;
    }
    return data;
}

HVKUtils.replcaceStringByTextFilter = function(origin_string, arr_filter) {
    "use strict";
    if (origin_string == null || origin_string == undefined) {
        return "";
    }
    for (var x in arr_filter) {
        var filterX = arr_filter[x];
        origin_string = origin_string.replace(new RegExp(filterX.msg_from, 'gi'), filterX.msg_to);
    }
    return origin_string
}


HVKUtils.add_listener = function(client, event_name, func) {
    client.on(event_name, function(message) {
        func(client, message);
    });
}

HVKUtils.jsonToQueryString = function(json) {
    return '?' +
        Object.keys(json).map(function(key) {
            return encodeURIComponent(key) + '=' +
                encodeURIComponent(json[key]);
        }).join('&');
}
HVKUtils.logDetails = function(apiName,reqBody,time){
    console.log(`${HVKUtils.getDateTime()} , API = ${apiName} request_body =${reqBody} time==>${time} `);
    if(time > 5000){
        console.log(`${HVKUtils.getDateTime()} , API = ${apiName} time_out time==>${time} `);
    }
}

module.exports = HVKUtils;