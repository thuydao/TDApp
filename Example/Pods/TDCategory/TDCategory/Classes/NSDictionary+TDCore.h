//
//  NSDictionary+TDCore.h
//  tdUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TDCore)

@end

#pragma mark - Accessors
@interface NSDictionary (Accessors)

- (id)td_objectForKey:(NSString *)key;
- (BOOL)td_containsObjectForKey:(id )key;
- (NSDictionary *)td_dictionaryForKey:(NSString *)key;
- (NSMutableDictionary *)td_mutableDictionaryForKey:(NSString *)key;
- (NSArray *)td_arrayForKey:(NSString *)key;
- (NSMutableArray *)td_mutableArrayForKey:(NSString *)key;
- (NSString *)td_stringForKey:(NSString *)key;
- (NSInteger)td_intForKey:(NSString *)key;
- (float)td_floatForKey:(NSString *)key;
- (double)td_doubleForKey:(NSString *)key;
- (BOOL)td_boolForKey:(NSString *)key;
- (NSNumber *)td_numberForKey:(NSString *)key;
- (NSDecimalNumber *)td_decimalNumberForKey:(NSString *)key;
- (NSDate *)td_dateForKey:(NSString *)key;

@end
