//
//  UIColor+Core.h
// Core
//
//  " on 8/16/14.
//  ". All rights reserved.
//

#import <UIKit/UIKit.h>

#define COLOR_CUSTOM_RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define COLOR_CUSTOM_RGB_ALPHA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface UIColor (TDCore)

@end
