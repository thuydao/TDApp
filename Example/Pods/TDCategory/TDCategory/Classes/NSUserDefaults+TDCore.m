//
//  NSUserDefaults+TDCore.m
//  Pods
//
//  Created by Tun on 4/5/17.
//
//

#import "NSUserDefaults+TDCore.h"

@implementation NSUserDefaults (TDCore)

+ (void)td_saveObject:(id)object withKey:(NSString *)key
{
  // archive
  NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:object];
  
  // Save
  NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
  [userDefault setObject:dataSave forKey:key];
  [userDefault synchronize];
}

+ (id)td_getObjectWithKey:(NSString *)key
{
  NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
  
  if ( [[userDefault dictionaryRepresentation].allKeys containsObject:key] )
  {
    //un archive
    NSData *dataGet = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefault objectForKey:key]];
    
    return dataGet;
  }
  
  return nil;
}

+ (void)td_removeObjectWithKey:(NSString *)key
{
  [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
