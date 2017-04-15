//
//  UILabel+TDCore.m
//  ReadMoreLabel
//
//  Created by Dao Duy Thuy on 11/2/15.
//  Copyright © 2015 Moboco. All rights reserved.
//

#import "UILabel+TDCore.h"

@implementation UILabel (TDCore)

- (NSUInteger)td_fitString:(NSString *)string
{
    UIFont *font           = self.font;
    NSLineBreakMode mode   = self.lineBreakMode;
    
    CGFloat labelWidth     = self.frame.size.width;
    CGFloat labelHeight    = self.frame.size.height;
    CGSize  sizeConstraint = CGSizeMake(labelWidth, CGFLOAT_MAX);
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending)
    {
        NSDictionary *attributes = @{ NSFontAttributeName : font };
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:string attributes:attributes];
        CGRect boundingRect = [attributedText boundingRectWithSize:sizeConstraint options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        {
            if (boundingRect.size.height > labelHeight)
            {
                NSUInteger index = 0;
                NSUInteger prev;
                NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
                
                do
                {
                    prev = index;
                    if (mode == NSLineBreakByCharWrapping)
                        index++;
                    else
                        index = [string rangeOfCharacterFromSet:characterSet options:0 range:NSMakeRange(index + 1, [string length] - index - 1)].location;
                }
                
                while (index != NSNotFound && index < [string length] && [[string substringToIndex:index] boundingRectWithSize:sizeConstraint options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.height <= labelHeight);
                
                return prev;
            }
        }
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        if ([string sizeWithFont:font constrainedToSize:sizeConstraint lineBreakMode:mode].height > labelHeight)
        {
            NSUInteger index = 0;
            NSUInteger prev;
            NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
            
            do
            {
                prev = index;
                if (mode == NSLineBreakByCharWrapping)
                    index++;
                else
                    index = [string rangeOfCharacterFromSet:characterSet options:0 range:NSMakeRange(index + 1, [string length] - index - 1)].location;
            }
            
            while (index != NSNotFound && index < [string length] && [[string substringToIndex:index] sizeWithFont:font constrainedToSize:sizeConstraint lineBreakMode:mode].height <= labelHeight);
            
            return prev;
        }
#pragma clang diagnostic pop
    }
    
    return [string length];
}

- (void)td_setMultiText:(NSArray *)texts withMultiStyle:(NSArray *)styles StyleName:(NSString *)styleName
{
    @try {
        NSString *string = [texts componentsJoinedByString:@""];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
        
        NSInteger start = 0;
        
        for (NSInteger i = 0; i < texts.count; i ++) {
            NSString *aStr = [texts objectAtIndex:i];
            id value = [styles objectAtIndex:i];
            [str addAttribute:styleName value:value range:NSMakeRange(start, aStr.length)];
            start = start + aStr.length;
        }
        
        self.attributedText = str;
    }
    @catch (NSException *exception) {
        
        NSLog(@"td_setMultiText Exception : %@", exception.description);
    }
}

- (NSString *)td_StringFitString:(NSString *)string
{
    NSInteger ii = [self td_fitString:string];
    return [string substringWithRange:NSMakeRange(0, ii)];
}

/*
 * [self.lbTest td_setMultiText:@[@"Thuỷ ",@"Đào"] withMultiStyle:@[@{NSForegroundColorAttributeName : [UIColor redColor], NSFontAttributeName : font1 }, @{NSForegroundColorAttributeName : [UIColor blueColor], NSFontAttributeName : font2 }]];
 *
 */
- (void)td_setMultiText:(NSArray *)texts withMultiStyle:(NSArray *)styles
{
    @try {
        NSString *string = [texts componentsJoinedByString:@""];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
        
        NSInteger start = 0;
        
        for (NSInteger i = 0; i < texts.count; i ++) {
            NSString *aStr = [texts objectAtIndex:i];
            id value = [styles objectAtIndex:i];
            [str addAttributes:value range:NSMakeRange(start, aStr.length)];
            start = start + aStr.length;
        }
        
        self.attributedText = str;
    }
    @catch (NSException *exception) {
        
        NSLog(@"td_setMultiText Exception : %@", exception.description);
    }
}


- (NSString *)td_getTextDisplayForReadMoreOfText:(NSString *)text topText:(NSString *)topText moreTitle:(NSString *)moreTitle
{
    NSString *str = [NSString stringWithFormat:@"... %@ %@ %@", topText, moreTitle, text];
    
    NSString *strDisplay = [self td_StringFitString:str];
    strDisplay = [strDisplay stringByReplacingOccurrencesOfString:topText withString:@""];
    strDisplay = [strDisplay stringByReplacingOccurrencesOfString:moreTitle withString:@""];
    strDisplay = [strDisplay stringByReplacingOccurrencesOfString:@"..." withString:@""];
    
    return TD_TRIM(strDisplay);
}


- (CGFloat)td_heightToFitText
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        NSDictionary *stringAttributes = [NSDictionary dictionaryWithObject:self.font forKey: NSFontAttributeName];
        
        CGSize adjustedLabelSize = [self.text boundingRectWithSize:self.frame.size
                                    options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                    attributes:stringAttributes context:nil].size;
        return adjustedLabelSize.height;
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGSize adjustedLabelSize = [self.text sizeWithFont:self.font constrainedToSize:self.frame.size lineBreakMode:NSLineBreakByWordWrapping];
        
        return adjustedLabelSize.height;
#pragma clang diagnostic pop
    }
}

- (NSInteger)td_numberLineToFitText
{
    return (NSInteger)([self td_heightToFitText]/self.font.pointSize + 0.5);
}

@end
