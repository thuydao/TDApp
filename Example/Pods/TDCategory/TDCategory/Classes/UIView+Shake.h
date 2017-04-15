//
//  UIView+Shake.h
//  PayThis
//
//  Created by lok on 10/07/2015.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_Shake)

-(void)shake;
-(void)shakeWithCallback:(void (^)(void))completeBlock;

@end
