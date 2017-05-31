//
//  Copyright Seiko Epson Corporation 2014-2016 All rights reserved.
//
//  Ver.2.0.0
//

enum EposEasySelectDeviceType : int {
    EPOS_EASY_SELECT_DEVTYPE_TCP = 0,
    EPOS_EASY_SELECT_DEVTYPE_BLUETOOTH,
};

#ifdef __OBJC__
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@interface EposEasySelectInfo : NSObject

@property (assign, nonatomic, readonly) int deviceType;
@property (strong, nonatomic, readonly) NSString *printerName;
@property (strong, nonatomic, readonly) NSString *macAddress;
@property (strong, nonatomic, readonly) NSString *target;

@end

@interface EposEasySelect : NSObject

- (EposEasySelectInfo *)parseQR:(NSString *)data;
- (EposEasySelectInfo *)parseBeacon:(CLBeacon *)beacon;
- (NSString *)createQR:(NSString *)printerName DeviceType:(int)deviceType MacAddress:(NSString*)macAddress;

@end
#endif  /*__OBJC__*/