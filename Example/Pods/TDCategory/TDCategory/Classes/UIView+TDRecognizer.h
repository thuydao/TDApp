//
//  UIView+TDGestureRecognizer.h
//  TDRecognizer
//
//  Created by thuydd on 3/27/15.
//  Copyright (c) 2015 TB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TDRecognizer)

- (void)td_addSiglePan:(id)tagert selector:(SEL)selector;
- (void)td_addDoublePan:(id)tagert selector:(SEL)selector;
- (void)td_addTriplePan:(id)tagert selector:(SEL)selector;
- (void)td_addHoldPress:(id)tagert selector:(SEL)selector duration:(NSInteger)dur;
- (void)td_doublePress:(id)tagert selector:(SEL)selector;
- (void)td_triplePress:(id)tagert selector:(SEL)selector;
- (void)td_numberPress:(NSInteger)num tagert:(id)tagert selector:(SEL)selector;

@end
