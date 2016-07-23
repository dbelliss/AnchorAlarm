//
//  HMNVersion.h
//  Pulse2SDK
//
//  Created by Igor Bezrukov on 30/09/15.
//  Copyright © 2015 Harman. All rights reserved.
//
#import <Foundation/Foundation.h>

/// Class implements Version API
@interface HMNDFU : NSObject

/// Constants Described Version parameters for pass via dictionary
/// The Value has NSString value

FOUNDATION_EXPORT NSString * _Nonnull const KEY_SW_VERSION;
FOUNDATION_EXPORT NSString * _Nonnull const KEY_HW_VERSION;

/**
 * @discussion Request version from Device.
 * @return none.
 */
+ (void)requestVersion;

@end
