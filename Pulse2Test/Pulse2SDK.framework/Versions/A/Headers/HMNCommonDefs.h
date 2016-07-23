//
//  HMNCommonDefs.h
//  Pulse2SDK
//
//  Created by Igor Bezrukov on 07/12/15.
//  Copyright © 2015 Harman. All rights reserved.
//

#import <Foundation/Foundation.h>


/** Notifications will throw if the accessory has been connected. */
FOUNDATION_EXPORT NSString *const _Nonnull EVENT_DEVICE_CONNECTED;

/** Notifications will throw if the accessory has been disconnected. */
FOUNDATION_EXPORT NSString *const _Nonnull EVENT_DEVICE_DISCONNECTED;

/** Notifications will throw if the DeviceInfo Received from device. */
FOUNDATION_EXPORT NSString *const _Nonnull EVENT_DEVICE_INFO;

/** Notifications will throw if the Pattern info Received from device. */
FOUNDATION_EXPORT NSString *const _Nonnull EVENT_PATTERN_INFO;

/** Notifications will throw if the color capture Received from device. */
FOUNDATION_EXPORT NSString *const _Nonnull EVENT_SENSOR_CAPTURE_COLOR;

/** Notifications will throw if the Version Received from device. */
FOUNDATION_EXPORT NSString *const _Nonnull EVENT_VERSION;

/** Notifications will throw if the Brightness Received from device. */
FOUNDATION_EXPORT NSString *const _Nonnull EVENT_BRIGHTNESS;

/** Notifications will throw if the Sound Event received from device. */
FOUNDATION_EXPORT NSString *const _Nonnull EVENT_SOUND;

// Consts for Led rows & columns
const NSInteger LED_COLUMN_COUNT = 11;
const NSInteger LED_ROW_COUNT = 9;
const NSInteger LED_COUNT = LED_COLUMN_COUNT * LED_ROW_COUNT;

@interface HMNCommonDefs : NSObject

/// Device Patterns
typedef NS_ENUM(NSInteger, HMNPattern) {
    HMNPattern_Firework = 0,
    HMNPattern_Traffic,
    HMNPattern_Star,
    HMNPattern_Wave,
    HMNPattern_FireFly,
    HMNPattern_Rain,
    HMNPattern_Fire,
    HMNPattern_Canvas,
    HMNPattern_Hourglass,
    HMNPattern_Ripple
};

/// Token Identifiers
typedef NS_ENUM(NSUInteger, HMNToken) {
    HMNToken_DeviceName = 0,
    HMNToken_ProductID,
    HMNToken_ModelID,
    HMNToken_BatteryStatus,
    HMNToken_LinkedDeviceCount,
    HMNToken_ActiveChannel,
    HMNToken_AudioSource,
    HMNToken_MacAddress
};

@end
