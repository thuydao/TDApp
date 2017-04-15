//
//  UIScrollView+Core.m
// Core
//
//  " on 7/18/14.
//  ". All rights reserved.
//

#import "UIScrollView+TDCore.h"

@implementation UIScrollView (TDCore)

#pragma mark - ContentSize

- (void)td_setContentSizeWidth:(CGFloat)width
{
    self.contentSize = CGSizeMake(width, self.frame.size.height);
}

- (void)td_setContentSizeHeight:(CGFloat)height
{
    self.contentSize = CGSizeMake(self.frame.size.width,height);
    
}

- (void)td_setFreeze
{
    self.contentSize = self.frame.size;
}

@end
