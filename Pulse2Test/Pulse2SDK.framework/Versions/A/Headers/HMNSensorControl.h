//
//  HMNSound.h
//  Pulse2SDK
//
//  Created by Igor Bezrukov on 30/09/15.
//  Copyright © 2015 Harman. All rights reserved.
//
#import <Foundation/Foundation.h>

/// Class implements Version API
@interface HMNSensorControl : NSObject

/// Constant Described Microphone level parameters for pass via dictionary
/// The Value has NSNumber value from 0..99

FOUNDATION_EXPORT NSString * _Nonnull const KEY_MICROPHONE_LEVEL;

/// The Value has NSUInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_COLOR_R;
/// The Value has NSUInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_COLOR_G;
/// The Value has NSUInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_COLOR_B;

/**
 * @discussion Request microphone sound level from Device.
 * It will reply with EVENT_SOUND notification

 * @return none.
 */
+ (void)requestMicrophoneSoundLevel;

/**
 * @discussion Request for capturing color by Color Picker from the Device
 * It will reply with EVENT_SENSOR_CAPTURE_COLOR notification
 
 * @return none.
 */
+ (void)requestColorFromColorPicker;


@end
