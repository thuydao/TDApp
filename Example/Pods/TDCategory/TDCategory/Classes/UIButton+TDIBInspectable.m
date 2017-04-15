//
//  UIButton+IBInspectable.m
//  Pods
//
//  Created by Tun on 4/5/17.
//
//

#import "UIButton+TDIBInspectable.h"

@implementation UIButton (TDIBInspectable)

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
  self.titleLabel.numberOfLines = numberOfLines;
}

- (NSInteger)numberOfLines
{
  return self.titleLabel.numberOfLines;
}



@end
