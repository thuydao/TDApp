//
//  UITapGestureRecognizer+block.m
// Core
//
//  Created by Dao Duy Thuy on 7/11/14.
//  ". All rights reserved.
//

#import "UIView+TDEvent.h"
#import <objc/runtime.h>

static const void *UITapGestureRecognizerBlockVoid  = &UITapGestureRecognizerBlockVoid;

@implementation UIView (TDEvent)

#pragma mark - Setter & Getter

- (UITapGestureRecognizerBlock)tapGestureRecognizerBlock
{
    return objc_getAssociatedObject(self, UITapGestureRecognizerBlockVoid);
}

- (void)setTapGestureRecognizerBlock:(UITapGestureRecognizerBlock)tapGestureRecognizerBlock
{
    objc_setAssociatedObject(self, UITapGestureRecognizerBlockVoid, tapGestureRecognizerBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)td_addHandleTapBlock:(UITapGestureRecognizerBlock)block
{
    self.tapGestureRecognizerBlock = block;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:(id)self action:@selector(UITapGestureRecognizerBlockVoid:)]];
}

#pragma mark - handleTap

- (void)UITapGestureRecognizerBlockVoid:(UITapGestureRecognizer *)sender
{
    self.tapGestureRecognizerBlock(sender);
}

@end
