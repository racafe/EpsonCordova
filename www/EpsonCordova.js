var exec = require('cordova/exec');

exports.printReceipt = function(arg0, arg1, success, error) {
    exec(success, error, "EpsonCordova", "printReceipt", [arg0,arg1]);
};

exports.greet = function (name, successCallback, errorCallback) {
	exec(successCallback, errorCallback, "EpsonCordova", "greet", [name]);
};