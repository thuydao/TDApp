//
//  UIColor+HexColor.h
//  UIColorHexColor
//
//  Created by Matt Quiros on 2/8/14.
//  Copyright (c) 2014 Matt Quiros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor*)pxColorWithHexValue:(NSString*)hexValue;
+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end
