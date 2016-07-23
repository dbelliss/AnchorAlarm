//
//  HMNDeviceGeneral.h
//  Pulse2SDK
//
//  Created by Igor Bezrukov on 08/12/15.
//  Copyright © 2015 Harman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNDeviceGeneral : NSObject
/// These keys included inside dictionary for EVENT_DEVICE_CONNECTED
/// The Value has NSUInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_IAP_CONNECTION_ID;
/// The Value has String value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_IAP_MANUFACTURER;
/// The Value has String value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_IAP_NAME;
/// The Value has String value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_IAP_SERIAL_NUMBER;

/**
 * @discussion Connect to master device.
 * @return none.
 */
+ (void)connectToMasterDevice;

@end
