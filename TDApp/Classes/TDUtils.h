//
//  TDUtils.h
//  Pods
//
//  Created by Tun on 4/15/17.
//
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

#define APP_NAME [TDUtils appname]

#define SHOW_HUD(view,ani,message) [TDUtils showHUDAddedTo:view animated:ani msg:message]
#define SHOW_HUD(view,ani) [MBProgressHUD showHUDAddedTo:view animated:ani]
#define HIDE_HUD(view,ani) [MBProgressHUD hideHUDForView:view animated:ani]

#define JOIN(str1, str2) [TDUtils joinString:str1 withString:str2]

@interface TDUtils : NSObject

#pragma mark - MBProgressHUD
+ (MBProgressHUD *)showHUDAddedTo:(UIView *)view animated:(BOOL)animated msg:(NSString *)msg;

#pragma mark - NSString

+ (NSString *)appname;
+ (NSString *)joinString:(NSString *)str1 withString:(NSString *)str2;

@end
