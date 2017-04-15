//
//  UIView+Extention.m
//  XPOS-iPad
//
//  Created by Tun on 2016/01/20.
//  Copyright © 2016年 SmartOSC. All rights reserved.
//

#import "UIView+Border.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Border)

@dynamic borderColor, borderWidth, cornerRadius, masksToBounds;

- (void)setBorderColor:(UIColor *)borderColor {        self.layer.borderColor = borderColor.CGColor; }
- (UIColor *)borderColor                      { return [UIColor colorWithCGColor:self.layer.borderColor]; }

- (void)setBorderWidth:(CGFloat)borderWidth   {        self.layer.borderWidth = borderWidth; }
- (CGFloat)borderWidth                        { return self.layer.borderWidth; }

- (void)setCornerRadius:(CGFloat)cornerRadius {        self.layer.cornerRadius = cornerRadius; }
- (CGFloat)cornerRadius                       { return self.layer.cornerRadius; }

- (void)setMasksToBounds:(BOOL)masksToBounds  {        self.layer.masksToBounds = masksToBounds; }
- (BOOL)masksToBounds                         { return self.layer.masksToBounds; }

@end
