//
//  HMNDeviceInfo.h
//  Pulse2SDK
//
//  Created by Igor Bezrukov on 30/09/15.
//  Copyright © 2015 Harman. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "HMNCommonDefs.h"

/// Class implements Device Info API
@interface HMNDeviceInfo : NSObject

/// Constants Described deviceInfo model for pass via dictionary
/// The Value has NSInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_DEVICE_INDEX;
/// The Value has NSString value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_DEVICE_NAME;
/// The Value has NSInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_PRODUCT_ID;
/// The Value has NSInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_MODEL_ID;
/// The Value has Bool value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_BATTERY_IS_CHARGING;
/// The Value has NSInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_BATTERY_VALUE;
/// The Value has NSInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_LINKED_DEVICE_COUNT;
/// The Value has NSInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_ACTIVE_CHANNEL_VALUE;
/// The Value has NSInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_AUDIO_SOURCE_VALUE;
/// The Value has NSString value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_DEVICE_INFO_MAC_ADDRESS_VALUE;


/**
 * @discussion Change device name.
 * @param deviceName An new device name. Nonnull.
 * @return none.
 */
+ (void)setDeviceName:(NSString * _Nonnull)deviceName;

/**
 * @discussion Request information from Device like name, battery, active channel.
 * @return none.
 */
+ (void)requestDeviceInfo;

/**
 * @discussion Request information from Device for the specified token
 * @param token. Value from enumeration HMNToken
 * @param index. Device index: 0 - master, 1 - slave.
 * @return none.
 */
+ (void)requestDeviceInfoToken:(HMNToken)token forDeviceIndex:(UInt8)index;

@end
