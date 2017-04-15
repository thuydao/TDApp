//
//  UIView+TDGestureRecognizer.m
//  TDRecognizer
//
//  Created by thuydd on 3/27/15.
//  Copyright (c) 2015 TB. All rights reserved.
//

#import "UIView+TDRecognizer.h"

@implementation UIView (TDRecognizer)

- (void)td_addSiglePan:(id)tagert selector:(SEL)selector {
    UIPanGestureRecognizer *singlePan = [[UIPanGestureRecognizer alloc] initWithTarget:tagert action:selector];
    singlePan.maximumNumberOfTouches = 1;
    
    [self addGestureRecognizer:singlePan];
}

- (void)td_addDoublePan:(id)tagert selector:(SEL)selector {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:tagert action:selector];
    pan.maximumNumberOfTouches = 2;
    
    [self addGestureRecognizer:pan];
}

- (void)td_addTriplePan:(id)tagert selector:(SEL)selector {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:tagert action:selector];
    pan.maximumNumberOfTouches = 3;
    
    [self addGestureRecognizer:pan];
}

- (void)td_addHoldPress:(id)tagert selector:(SEL)selector duration:(NSInteger)dur; {
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:tagert action:selector];
    gesture.minimumPressDuration = dur;
    gesture.allowableMovement = 600;
    [self addGestureRecognizer:gesture];
}

- (void)td_doublePress:(id)tagert selector:(SEL)selector {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:tagert action:selector];
    tapGesture.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapGesture];
}

- (void)td_triplePress:(id)tagert selector:(SEL)selector; {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:tagert action:selector];
    tapGesture.numberOfTapsRequired = 3;
    [self addGestureRecognizer:tapGesture];
}

- (void)td_numberPress:(NSInteger)num tagert:(id)tagert selector:(SEL)selector; {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:tagert action:selector];
    tapGesture.numberOfTapsRequired = num;
    [self addGestureRecognizer:tapGesture];
}

@end
