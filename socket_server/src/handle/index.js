/**
 * Created by luckyman on 8/29/17.
 */
var Handles = {
    ConfigHandle: new (require('./ConfigHandle'))(),
    CommonHandle: new (require('./CommonHandle'))(),
    UserHandle: new (require('./UserHandle'))(),
    MasterSync: new (require('./MasterSync'))(),
    TeamHandle: new (require('./TeamHandle'))(),

    ChatHandle: new (require('./ChatHandle'))()
};

module.exports = exports = Handles;