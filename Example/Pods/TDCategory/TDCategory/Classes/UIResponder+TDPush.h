//
//  UIResponder+TDPush.h
//  Pods
//
//  Created by Dao Duy Thuy on 7/28/15.
//
//

#import <UIKit/UIKit.h>

@interface UIResponder (TDPush)


- (void)td_configureAPNS;
+ (NSString *)TD_APNSToken;
@end
