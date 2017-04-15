//
//  NSString+tdCore.m
//  tdUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import "NSString+TDCore.h"

@implementation NSString (TDCore)

@end


#pragma mark - Document

@implementation NSString (Document)

@end

#pragma mark - Validate
@implementation NSString (Validate)

- (BOOL)td_isEmpty
{
    return [[self td_removeWhitespace] isEqualToString:@""];
}

- (BOOL)td_isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

- (BOOL)td_isValidPassword
{
    
    return [self length] >= 6;
}

- (BOOL)td_isValidTelephone
{
    NSString *phoneRegex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [test evaluateWithObject:self];
}

- (BOOL)td_validateUrl
{
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:self];
}

- (BOOL)td_isValidWithRegex:(NSString *)regex
{
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [emailTest evaluateWithObject:self];
}

@end

#pragma mark - URL
@implementation NSString (URL)

- (NSString *)td_stringByUrlEncoded
{
    CFStringRef urlString = CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                    (CFStringRef)self,
                                                                    NULL,
                                                                    (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                    kCFStringEncodingUTF8);
    return (__bridge NSString *)urlString;
}

@end

#pragma mark - Utilities
@implementation NSString (Utilities)

+ (NSString *)td_stringFromInteger:(NSInteger)anInteger
{
    return [NSString stringWithFormat:@"%ld", (long)anInteger];
}

+ (NSString *)td_stringFromFloat:(float)aFloat
{
    return [NSNumber numberWithFloat:aFloat].stringValue;
}


+ (NSString*)td_stringFromDouble:(double)aDouble
{
    return [NSNumber numberWithDouble:aDouble].stringValue;
}


+ (NSString *)td_stringWithUUID
{
    NSString* uuidString = nil;
    CFUUIDRef newUUID = CFUUIDCreate(kCFAllocatorDefault);
    
    if (newUUID)
    {
        uuidString = (__bridge NSString *)CFUUIDCreateString(kCFAllocatorDefault, newUUID);
        CFRelease(newUUID);
    }
    
    return uuidString;
}


- (NSString *)td_removeWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


- (BOOL)td_isEqualString:(NSString *)aString
{
    return [[self uppercaseString] isEqualToString:[aString uppercaseString]];
}

- (BOOL)td_containsString:(NSString *)aString
{
    NSRange range = [self rangeOfString:aString];
    
    return range.location != NSNotFound;
}


- (BOOL)td_containsCaseInsensitiveString:(NSString *)aString
{
    NSRange range = [self rangeOfString:aString options:NSCaseInsensitiveSearch];
    
    return range.location != NSNotFound;
}


- (BOOL)td_caseInsensitiveHasPrefix:(NSString *)aString
{
    return [[self lowercaseString] hasPrefix:[aString lowercaseString]];
}

- (BOOL)td_caseInsensitiveHasSuffix:(NSString *)aString
{
    return [[self lowercaseString] hasSuffix:[aString lowercaseString]];
}


- (BOOL)td_isCaseInsensitiveEqual:(NSString *)aString
{
    return [self compare:aString options:NSCaseInsensitiveSearch] == NSOrderedSame;
}


- (BOOL)td_isEqualToStringInsensitive:(NSString *)strNeedEqual
{
    return [[self lowercaseString] isEqualToString:[strNeedEqual lowercaseString]];
}

@end
