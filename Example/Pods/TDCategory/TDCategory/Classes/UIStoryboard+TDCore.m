//
//  UIStoryboard+TDCore.m
//  Pods
//
//  Created by Dao Duy Thuy on 9/30/15.
//
//

#import "UIStoryboard+TDCore.h"
#import <objc/runtime.h>

static const void *familyNameFileVoid = &familyNameFileVoid;

@implementation UIStoryboard (TDCore)

- (NSString *)familyNameFile
{
    return objc_getAssociatedObject(self, familyNameFileVoid);
}

- (void)setFamilyNameFile:(NSString *)familyNameFile
{
    objc_setAssociatedObject(self, familyNameFileVoid, familyNameFile, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (UIViewController *)td_instantiateViewControllerWithIdentifier:(NSString *)identifier
{
    id vc = nil;
    if(self.familyNameFile)
    {
        // hight priority: get with current storyboard
        NSString *currentStoryboardName = [self valueForKey:@"name"];
        vc = [self td_getViewController:currentStoryboardName identifier:identifier];
        if (vc)return vc;
        
        NSString *namefile = [self.familyNameFile stringByReplacingOccurrencesOfString:@".plist" withString:@""];
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:namefile ofType:@"plist"]];
        
        //get family with current storyboard and without oneself
        NSMutableArray *storyboards = [[NSMutableArray alloc] initWithArray:arr];
        [storyboards removeObject:currentStoryboardName];
        
        // loop find viewcontroler in family
        for (NSString *storyboardName in storyboards)
        {
            vc = [self td_getViewController:storyboardName identifier:identifier];
            if (vc)return vc;
        }
        
        return nil;
    }
    else
    {
        return [self instantiateViewControllerWithIdentifier:identifier];
    }
}

- (UIViewController *)td_getViewController:(NSString *)storyboardName identifier:(NSString *)identifier
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    //accept family with current storyboard
    if (!storyBoard.familyNameFile) {
        storyBoard.familyNameFile = self.familyNameFile;
    }
    
    id vc = nil;
    @try {
        vc = [storyBoard instantiateViewControllerWithIdentifier:identifier];
    }
    @catch (NSException *exception) {
    }
    @finally {
        if(vc)
        {
            return vc;
        }
    }
    return nil;
}

#pragma clang diagnostic pop

@end
