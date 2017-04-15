//
//  UIButton+Block.h
//  BoothTag
//
//  Created by Thuy Dao on 4/22/12.
//  Copyright (c) 2012 Thuy Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIButtonBlock) (UIButton *sender);

@interface UIButton (TDEvent)

@property (nonatomic, strong) UIButtonBlock touchUpInside;

- (void)td_clickBtn:(UIButtonBlock)touchUpInside;

- (void)td_addTopButtonWithBlock:(UIButtonBlock)touchUpInside;

@end
