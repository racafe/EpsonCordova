var exec = require('cordova/exec');

exports.print = function(arg0, arg1, success, error) {
    exec(success, error, "EpsonCordova", "print", [arg0,arg1]);
};
