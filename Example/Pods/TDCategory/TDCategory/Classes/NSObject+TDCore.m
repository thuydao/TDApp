//
//  NSObject+TDCore.m
//  Pods
//
//  Created by Dao Duy Thuy on 9/28/15.
//
//

#import "NSObject+TDCore.h"

@implementation NSObject (TDCore)

#pragma mark - BLOCK
+ (void)td_mainThread:(void (^)())block
{
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}

+ (void)td_backgroundThread:(void (^)())block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block();
    });
}

+ (void)td_mainThread:(void (^)())block afterDelay:(double)secs
{
    double delayInSeconds = secs;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //code to be executed on the main queue after delay
        block();
    });
}


@end
