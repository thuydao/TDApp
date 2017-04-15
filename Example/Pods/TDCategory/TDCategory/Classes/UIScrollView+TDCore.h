//
//  UIScrollView+Core.h
// Core
//
//  " on 7/18/14.
//  ". All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (TDCore)


#pragma mark - ContentSize

- (void)td_setContentSizeWidth:(CGFloat)width;
- (void)td_setContentSizeHeight:(CGFloat)height;
- (void)td_setFreeze;

@end
