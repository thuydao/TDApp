//
//  UILabel+TDCore.h
//  ReadMoreLabel
//
//  Created by Dao Duy Thuy on 11/2/15.
//  Copyright © 2015 Moboco. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TD_TRIM(string) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]

@interface UILabel (TDCore)

- (NSUInteger)td_fitString:(NSString *)string;
- (NSString *)td_StringFitString:(NSString *)string;


//NSFontAttributeName
- (void)td_setMultiText:(NSArray *)texts withMultiStyle:(NSArray *)styles StyleName:(NSString *)styleName;
- (void)td_setMultiText:(NSArray *)texts withMultiStyle:(NSArray *)styles;


- (NSString *)td_getTextDisplayForReadMoreOfText:(NSString *)text topText:(NSString *)topText moreTitle:(NSString *)moreTitle;

- (CGFloat)td_heightToFitText;
- (NSInteger)td_numberLineToFitText;

@end
