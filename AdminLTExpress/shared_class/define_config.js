var define_config = {

	PREFIX_GAME_ROOM : "gr",
	PREFIX_CHAT_ROOM : "cr",
	LENGTH_RANDOM_GAME_ROOM : 10,
	LENGTH_RANDOM_CHAT_ROOM : 10,

	PLAYER_IN_ROOM_TYPE_PLAYER : 0,
	PLAYER_IN_ROOM_TYPE_VIEWER :1,
	ROOM_PLAYER_MAX :4,   // max number player in room
	ROOM_VIEWER_MAX :10,   // max number viewer in room

	ACTION_SUCCESS : 0, // return when do an action success.
	ACTION_RETURN_NONE :-1,
	// define error code 
	ERR_UNDEFINED : 9999,

	// error with USER model
	ERR_USER_NOT_ONLINE : 20000,

	// error with ROOM model
	ERR_ROOM_NOT_AVAILABLE :10000,

	// error when JOIN ROOM function
	ERR_JOIN_ROOM_PLAYER_FULL : 10001, // room is full, client can't join room as a player
	ERR_JOIN_ROOM_VIEWER_FULL : 10002, // room is full, client can't join room as a viewer
	ERR_JOIN_ROOM_USER_NOT_ONLINE : 10003, // user is not exits or not online;

	// error when config room function
	ERR_ROOM_CONFIG_NOT_PERMISSION : 10004, // player set config room is not have permission. player must be room_owner to set config


};

