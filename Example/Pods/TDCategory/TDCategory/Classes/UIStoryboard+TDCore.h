//
//  UIStoryboard+TDCore.h
//  Pods
//
//  Created by Dao Duy Thuy on 9/30/15.
//
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (TDCore)
@property (nonatomic, retain) NSString *familyNameFile;
- (UIViewController *)td_instantiateViewControllerWithIdentifier:(NSString *)identifier;
@end
