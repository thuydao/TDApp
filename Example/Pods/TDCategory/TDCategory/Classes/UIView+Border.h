//
//  UIView+Extention.h
//  XPOS-iPad
//
//  Created by Tun on 2016/01/20.
//  Copyright © 2016年 SmartOSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable BOOL masksToBounds;

@end
