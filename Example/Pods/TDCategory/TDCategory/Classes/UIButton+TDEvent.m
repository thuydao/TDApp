//
//  UIButton+Block.h
//  BoothTag
//
//  Created by Thuy Dao on 4/22/12.
//  Copyright (c) 2012 Thuy Dao. All rights reserved.
//

#import "UIButton+TDEvent.h"
#import <objc/runtime.h>

static const void *touchUpInsideVoid = &touchUpInsideVoid;

@implementation UIButton (TDEvent)

#pragma mark - Setter & Getter

- (UIButtonBlock)touchUpInside
{
    return objc_getAssociatedObject(self, touchUpInsideVoid);
}

- (void)setTouchUpInside:(UIButtonBlock)touchUpInside
{
    objc_setAssociatedObject(self, touchUpInsideVoid, touchUpInside, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)td_clickBtn:(UIButtonBlock)touchUpInside
{
    self.touchUpInside = touchUpInside;
    
    [self addTarget:self action:@selector(clickBtnBlock:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)td_addTopButtonWithBlock:(UIButtonBlock)touchUpInside
{
    self.touchUpInside = touchUpInside;
    
    float w = 30;
    if ( self.frame.size.width > 30 )
    {
        w = self.frame.size.width;
    }
    
    float h = 30;
    if ( self.frame.size.height > 30 )
    {
        h = self.frame.size.height;
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, w, h);
    btn.center = self.center;
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn addTarget:self action:@selector(clickBtnBlock:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.superview addSubview:btn];
}

#pragma mark - clickButton

- (void)clickBtnBlock:(id)sender
{
    self.touchUpInside(sender);
}

@end
