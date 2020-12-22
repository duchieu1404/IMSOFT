/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var HVKUtils = {};

HVKUtils.parseInputToJSON = function(data){
let jsonR = {};
try{
    jsonR = JSON.parse(data);
}catch(err){
    jsonR = {};
}
return jsonR;
}


HVKUtils.array_add = function(arr, value) {
    for (var i=0; i < arr.length; i++) {
        if (arr[i] === value) {
            return;
        }
    }
    arr.push(value)
}


HVKUtils.array_sort =  function (arr, property, desc){
    function sorter(aa,bb){
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

HVKUtils.createRandomString =  function(prefixName,lengthRandom)
{
    lengthRandom = lengthRandom||10;
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < lengthRandom; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return prefixName+text;
}

// Returns a random number between 0 (inclusive) and 1 (exclusive)
HVKUtils.getRandom  = function () {
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

HVKUtils.createRandomRoomId = function(prefixName)
{
    var lengthRandom = 3;
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < lengthRandom; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return prefixName+text+ Math.floor(Date.now() / 1000);
}

HVKUtils.createNewRoomId = function()
{
    return Math.floor(Date.now() / 1000) ;
}

HVKUtils.getKeyValueHashMap = function(objHashMap)
{
    var keyValues = {};
    objHashMap.forEach(function(value, key) { keyValues[key]=value });
    return keyValues;
}

HVKUtils.getPlayerInfoForList = function(objHashMap)
{
    var keyValues = [];
    objHashMap.forEach(function(value, key) { keyValues.push(
        {id:value.id,
        username:value.username,
        gold:value.gold,
        player_pos:value.player_pos,
        diamond:value.diamond})});
    return keyValues;
}

HVKUtils.getPlayerInfoForListAPI = function(objHashMap)
{
    var keyValues = [];
    objHashMap.forEach(function(value, key) { keyValues.push(
    {   id:value.id,
        username:value.username,
        gold:value.gold,
        player_pos:value.player_pos,
        diamond:value.diamond,
        statistic:value.statistic
    })});
    return keyValues;
}

HVKUtils.getDateTime=function(){
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    return "'"+year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second+"'";
}

HVKUtils.getDateTimeLog=function(){
    var date = new Date();
    return date;
}

HVKUtils.getDate=function(){
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    return "-"+year+"-"+month+"-"+day;
}

HVKUtils.getDateTimeForFile=function(){
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    return ""+year+"-"+month+"-"+day+"-"+hour;
}



HVKUtils.getDateString = function () {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    return ""+year+"-"+month+"-"+day;
}


HVKUtils.registerAllInEventListener = function(ioNamespcae,namespace,DA){
    ioNamespcae.on('connection', function (client) {
        HVKUtils.add_listener_subscriber_socket_chanel(DA,client,"bc_subscribe_"+namespace+"_socket","bc_subscribe_"+namespace+"_socket_result");
        HVKUtils.add_listener_unsubscriber_socket_chanel(DA,client,"bc_unsubscribe_"+namespace+"_socket","bc_unsubscribe_"+namespace+"_socket_result");
    });
}

HVKUtils.add_listener_subscriber_socket_chanel = function(DA,client,name_in,name_out,callbackSuccess,callbackError)
{

    client.on(name_in, function (jData) {
        var data = {};
        try {
            data = JSON.parse(jData);
        } catch (err) {
            data = jData;
        }

        if (data.user_id == null || data.user_id == undefined) {
            client.emit(name_out, {
                status: "NG",
                "msg": "Register socket failure. Dont have user_id"+name_in,
                "data": data
            });
            if(callbackError && typeof callbackError == "function")
            {
                callbackError();
            }
        }
        else {
            client.user_id = data.user_id;

            DA.bc_cache_get_user_session({
                user_id:data.user_id,socket_id:null,search_by:0
            },function(errorX,dataX){
                if(errorX || dataX == null || dataX == undefined)
                {
                    client.emit(name_out, {
                        status: "NG",
                        "msg": "Register socket false. Dont found parent client or you dont in any room."+name_in,
                        "data": data
                    });
                    return ;
                }
                client.room_id = dataX.room_id;
                client.room_type = dataX.room_type;

                HVKUtils.join_socket_room(client,dataX.room_type,dataX.room_id);
                client.emit(name_out, {
                    status: "OK",
                    "msg": "Register socket success "+name_in ,
                    "data": {}
                });
                if(callbackSuccess && typeof callbackSuccess == "function")
                {
                    callbackSuccess();
                }

            });
        }
    });
}

HVKUtils.add_listener_unsubscriber_socket_chanel = function(DA,client,name_in,name_out)
{
    client.on(name_in, function (jData) {
        var data = {};
        try {
            data = JSON.parse(jData);
        } catch (err) {
            data = jData;
        }
        
        if (data.user_id == null || data.user_id == undefined) {
            client.emit(name_out, {
                status: "NG",
                "msg": "Register fish_in socket failure. Dont have user_id",
                "data": {}
            });
        }
        else {

            HVKUtils.leave_socket_room(client,client.room_type,client.room_id);
            HVKUtils.leave_socket_room(client,data.room_type,data.room_id);

            DA.bc_cache_get_user_session({
                user_id:data.user_id,socket_id:null,search_by:0
            },function(errorX,dataX){
                if(errorX || dataX == null || dataX == undefined)
                {
                    client.emit(name_out, {
                        status: "NG",
                        "msg": "Register socket false. Dont found parent client or you dont in any room."+name_in,
                        "data": {}
                    });
                    return ;
                }


                HVKUtils.leave_socket_room(client,dataX.room_type,dataX.room_id);

                client.user_id = null;
                client.room_id = null;
                client.room_type = null;

                client.emit(name_out, {
                    status: "OK",
                    "msg": "Unsubscribe fish_in socket success",
                    "data": {}
                });

            });
        }
    });
}


HVKUtils.join_socket_room = function(clientSocket,room_type,room_id) // join client vào room của socket để broadcast
{
    clientSocket.join("R" + room_type + "_" + room_id);
}

HVKUtils.join_socket_name = function(clientSocket,socketName) // join client vào room của socket để broadcast
{
    clientSocket.join(socketName);
}


HVKUtils.leave_socket_room = function(clientSocket,room_type,room_id) // leave client khỏi room của socket để không nhận broadcast
{
    clientSocket.leave("R" + room_type + "_" + room_id);
}

HVKUtils.broadcastRoom = function(ioBr,room_type,room_id,command,data)
{
    if(ioBr.in("R" + room_type + "_" + room_id))
    {
        ioBr.in("R" + room_type + "_" + room_id).emit(command, data);
    }
    else {
        ioBr.sockets.in("R" + room_type + "_" + room_id).emit(command, data);
    }
}

HVKUtils.broadcastRoomObj = function (ioBr,roomObj, command, data) {
    if(ioBr.in("R" + roomObj.type + "_" + roomObj.id))
    {
        ioBr.in("R" + roomObj.type + "_" + roomObj.id).emit(command, data);
    }
    else
    {
        ioBr.sockets.in("R" + roomObj.type + "_" + roomObj.id).emit(command, data);
    }
}

HVKUtils.broadcastRoomName = function (ioBr,roomName, command, data) {
    if(ioBr.in(roomName))
    {
        ioBr.in(roomName).emit(command, data);
    }
    else
    {
        ioBr.sockets.in(roomName).emit(command, data);
    }
}

HVKUtils.boardcastRoomExceptSender = function (roomObj, command, data, sender) {
    sender.broadcast.to("R" + roomObj.type + "_" + roomObj.id).emit(command, data);
}

HVKUtils.sendMessageToClient = function (ioX,client_id, command, data) {
    ioX.sockets.to(client_id).emit(command, data);
};

HVKUtils.forceDisconnectSocket = function(ioX,client,DA)
{
    if(client.user_id == null || client.user_id == undefined)
    {
        client.disconnect(true);
        return;
    }
    HVKUtils.leave_socket_room(client,client.room_type,client.id);

    DA.bc_cache_player_left_room({
        user_id:client.user_id
    },function(errorX,dataX){
        if(errorX)
        {
        }
        if(dataX && dataX[0] && dataX[0].length>0)
        {
            var xRoom = dataX[0][0];
            HVKUtils.leave_socket_room(client,xRoom.type,xRoom.id);
            HVKUtils.broadcastRoomObj(ioX,xRoom, "bc_has_player_left_room_result", {
                status: "OK",
                "msg": "Have user left room",
                "data": {id:client.user_id}
            }, client);
            if(xRoom.is_deleted!=1)
            {
                HVKUtils.broadcastRoomObj(ioX,xRoom, "bc_set_player_to_key_result", {
                    status: "OK",
                    "msg": "Server set you to key for this game",
                    "data": {is_key: xRoom.key_socket_id == client.user_id?1:0,player_key:xRoom.player_key}
                });
            }
        }
        DA.bc_cache_disconnect_socket({user_id:client.user_id,socket_id:client.id},function(er1,dt1){
        });
    });
    client.disconnect(true);



}

HVKUtils.forceDisconectSocketByID= function(ioX,socket_id,DA)
{
    var client = ioX.sockets.sockets[socket_id];
    if(client == null || client == undefined)
    {
        return;
    }
    HVKUtils.forceDisconnectSocket(ioX,client,DA);
}

module.exports = HVKUtils;
