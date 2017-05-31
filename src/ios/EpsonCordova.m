/********* EpsonCordova.m Cordova Plugin Implementation *******/

#import "EpsonCordova.h"

@implementation EpsonCordova

-(void) printReceipt:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* modelo = [command.arguments objectAtIndex:0];
	NSString* ip = [command.arguments objectAtIndex:1];
	
	Epos2Printer *printer = nil; 
	printer = [[Epos2Printer alloc] initWithPrinterSeries:EPOS2_TM_T20 lang:EPOS2_MODEL_ANK]; 
	if (printer == nil) { 
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	}else{
		[printer setReceiveEventDelegate:self];
		int result = EPOS2_SUCCESS; 
		result = [printer addTextAlign:EPOS2_ALIGN_CENTER]; 
		result = [printer addText:@"Hello World"]; 
		if (result != EPOS2_SUCCESS) { 
			//Displays error messages 
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		}else{
			result = [printer connect:[@"TCP:" stringByAppendingString:ip] timeout:EPOS2_PARAM_DEFAULT]; 
			result = [printer beginTransaction]; 
			if (result != EPOS2_SUCCESS) { 
				//Displays error messages 
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
			}else{
				Epos2PrinterStatusInfo *status = nil; 
				status = [printer getStatus]; 
				if (status.getConnection && status.getOnline) { 
					result = [printer sendData:EPOS2_PARAM_DEFAULT]; 
					pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Todo bien"];
				}else{ 
					//Displays error messages 
					//Abort process 
					pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
				} 
			}

		}
	}

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end