//
//  NSUserDefaults+TDCore.h
//  Pods
//
//  Created by Tun on 4/5/17.
//
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (TDCore)

+ (void)td_saveObject:(id)object withKey:(NSString *)key;
+ (id)td_getObjectWithKey:(NSString *)key;

+ (void)td_removeObjectWithKey:(NSString *)key;

@end
