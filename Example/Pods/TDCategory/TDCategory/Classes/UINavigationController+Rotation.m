//
//  UINavigationController+Rotation.m
//  MevaChart
//
//  Created by Dao Duy Thuy on 10/22/15.
//  Copyright © 2015 Moboco. All rights reserved.
//

#import "UINavigationController+Rotation.h"

@implementation UINavigationController (Rotation)

-(BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

@end
