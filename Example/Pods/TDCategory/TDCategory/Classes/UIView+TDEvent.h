//
//  UITapGestureRecognizer+block.h
// Core
//
//  Created by Dao Duy Thuy on 7/11/14.
//  ". All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UITapGestureRecognizerBlock) (UITapGestureRecognizer *sender);

@interface UIView (TDEvent)

@property (nonatomic, copy) UITapGestureRecognizerBlock tapGestureRecognizerBlock;

- (void)td_addHandleTapBlock:(UITapGestureRecognizerBlock)block;

@end
