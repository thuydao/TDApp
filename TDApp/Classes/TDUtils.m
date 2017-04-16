//
//  TDUtils.m
//  Pods
//
//  Created by Tun on 4/15/17.
//
//

#import "TDUtils.h"

@implementation TDUtils


#pragma mark - MBProgressHUD
+ (MBProgressHUD *)showHUDAddedTo:(UIView *)view animated:(BOOL)animated msg:(NSString *)msg
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = msg;
    return hud;
}

#pragma mark - NSString 

+ (NSString *)appname
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

+ (NSString *)joinString:(NSString *)str1 withString:(NSString *)str2
{
    return [NSString stringWithFormat:@"%@%@",str1, str2];
}

@end
