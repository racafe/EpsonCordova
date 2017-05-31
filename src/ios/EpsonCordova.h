/********* EpsonCordova.m Cordova Plugin Implementation *******/

#import <ePOS2.h>
#import <ePOSEasySelect.h>
#import <Cordova/CDV.h>

@interface EpsonCordova : CDVPlugin {
	- (void)print:(CDVInvokedUrlCommand *)command;
}