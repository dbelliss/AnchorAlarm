//
//  HMNLedPattern.h
//  Pulse2SDK
//
//  Created by Igor Bezrukov on 18/11/15.
//  Copyright © 2015 Harman. All rights reserved.
//

@import UIKit;
#import "HMNCommonDefs.h"

@interface HMNLedControl : NSObject

/// Constants Described deviceInfo model for pass via dictionary
/// The Value has NSInteger value
FOUNDATION_EXPORT NSString * _Nonnull const KEY_LED_PATTERN_ID;

/// The Value has NSUInteger value from 0..255
FOUNDATION_EXPORT NSString * _Nonnull const KEY_LED_BRIGHTNESS;

/**
 * @discussion Setup Background Color to Master Device
 * @param color - UIColor object
 * @param propageToSlaveDevice - Need to propagete background color to Slave device
 * @return none.
 */
+ (void)setBackgroundColor:(UIColor * _Nonnull)color propagateToSlaveDevice:(BOOL)applyToSlave;

/**
 * @discussion Draw 11(columns)x9(rows) color image bitmap on the Master Device
 * @param imageMatrix - Array of 99 UIColor* objects,The color of each pixel is represented color by UIColor.
 * @return none.
 */
+ (void)setColorImage:(NSArray * _Nonnull)imageMatrix;

/**
 * @discussion Display Char on master and slave device
 * @param charAsciiCode - Char ascii code - in hex; Supported ascii symbols: 0..9 A..Z ? ! $ + - = % * / # " & ' ( ) , . : ; < > ` { | } ~
 * @param charColor - Color of char;
 * @param backgroundColor - Background color;
 * @param applyToSlave - if need to propagate to slave device
 
 * @return none.
 */
+ (void)setLedChar:(UInt8)charAsciiCode charColor:(UIColor * _Nonnull)charColor backgroundColor:(UIColor * _Nonnull)backgroundColor applyToSlaveDevice:(BOOL)applyToSlave;

/**
 * @discussion Propagate Current Led Pattern on master to slave device
  
 * @return none.
 */
+ (void)propagateCurrentLedPattern;

/**
 * @discussion Set Display Led Brightness on master device
 * @param brightness - 0..255;
 
 * @return none.
 */
+ (void)setLedBrightness:(UInt8)brightness;

/**
 * @discussion Set Pattern on master device
 * @param pattern - id of pattern
 * @param patternData - array of 99 unsigned int values wrapped to NSNumbers for Canvas and Firefly:
 *                      0 - do not draw point
 *                      non-0 - draw point on canvas
 *                    - nil for other pattern types

 * @return none.
 */
+ (void)setLedPattern:(HMNPattern)pattern withData:(NSArray * _Nullable)patternData;

/**
 * @discussion Query device led pattern information.
 * It will reply with EVENT_PATTERN_INFO notification.
 
 * @return none.
 */
+ (void)requestLedPatternInfo;

/**
 * @discussion Query device led brightness.
 * It will reply with EVENT_BRIGHTNESS notification
 
 * @return none.
 */
+ (void)requestLedBrightness;

@end
