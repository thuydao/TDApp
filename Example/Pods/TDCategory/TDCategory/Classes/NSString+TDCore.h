//
//  NSString+tdCore.h
//  tdUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TDCore)

@end

#pragma mark - Document

@interface NSString (Document)

@end

#pragma mark - Validate
@interface NSString (Validate)

- (BOOL)td_isEmpty;
- (BOOL)td_isValidEmail;
- (BOOL)td_isValidPassword;
- (BOOL)td_isValidTelephone;
- (BOOL)td_validateUrl;
- (BOOL)td_isValidWithRegex:(NSString *)regex;

@end

#pragma mark - URL
@interface NSString (URL)


- (NSString *)td_stringByUrlEncoded;

@end

#pragma mark - Utilities
@interface NSString (Utilities)

- (NSString *)td_removeWhitespace;

+ (NSString *)td_stringFromInteger:(NSInteger)anInteger;

+ (NSString *)td_stringFromFloat:(float)aFloat;


+ (NSString*)td_stringFromDouble:(double)aDouble;

+ (NSString *)td_stringWithUUID;

- (BOOL)td_isEqualString:(NSString *)aString;


- (BOOL)td_containsString:(NSString *)aString;


- (BOOL)td_containsCaseInsensitiveString:(NSString *)aString;

- (BOOL)td_caseInsensitiveHasPrefix:(NSString *)aString;

- (BOOL)td_caseInsensitiveHasSuffix:(NSString *)aString;

- (BOOL)td_isCaseInsensitiveEqual:(NSString *)aString;

- (BOOL)td_isEqualToStringInsensitive:(NSString *)strNeedEqual;

@end
