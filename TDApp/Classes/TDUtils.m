//
//  TDUtils.m
//  Pods
//
//  Created by Tun on 4/15/17.
//
//

#import "TDUtils.h"

@implementation TDUtils

+ (NSString *)appname
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

@end
