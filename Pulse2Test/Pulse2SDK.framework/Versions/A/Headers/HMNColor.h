//
//  HMNColor.h
//  Pulse2SDK
//
//  Created by Igor Bezrukov on 30/11/15.
//  Copyright © 2015 Harman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HMNColor : NSObject

@property (nonatomic) UInt8 R;
@property (nonatomic) UInt8 G;
@property (nonatomic) UInt8 B;

@property (nonatomic, readonly) UInt8 webSafeColor;

/**
 * @discussion initWithRGB
 * @param R - in hex
 * @param G - in hex
 * @param B - in hex
 
 * @return instance type. Fill WebSafeColorIndex Value.
 */
- (instancetype _Nullable)initWithR:(UInt8)r G:(UInt8)g B:(UInt8)b NS_DESIGNATED_INITIALIZER;

- (instancetype _Nullable)init;

+ (HMNColor * _Nullable)hmnColorWithUIColor:(UIColor * _Nonnull)uicolor;

@end
