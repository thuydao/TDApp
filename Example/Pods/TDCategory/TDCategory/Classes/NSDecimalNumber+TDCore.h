//
//  NSDecimalNumber+TDCore.h
//  Pods
//
//  Created by Tun on 4/5/17.
//
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (TDCore)

/** Get the NSDecimal absoluteValue. */
- (NSDecimalNumber *)td_absoluteValue;

/** Check if an NSDecimalNumber is greater than (or not less or equal to) another NSDecimalNumber. */
- (BOOL)td_isGreaterThan:(NSDecimalNumber *)anotherNumber;

/** Check if an NSDecimalNumber is equal to another NSDecimalNumber. */
- (BOOL)td_isEqualTo:(NSDecimalNumber *)anotherNumber;

/** Check if an NSDecimalNumber is less than (or not greater or equal to) another NSDecimalNumber. */
- (BOOL)td_isLessThan:(NSDecimalNumber *)anotherNumber;

/** Check if self is an odd number (0; 2; 4; 6; 8; 10...) */
- (BOOL)td_isEven;

/** Turn around positive / negative. (E.g. 100 will become -100) */
- (NSDecimalNumber *)td_reverseValue;

/** Modulo operators (103 % 2 => 1) */
- (NSDecimalNumber *)td_decimalNumberByModuloFor:(NSDecimalNumber *)divisor;

/** Equal to MATH.CEIL() */
- (NSDecimalNumber *)td_decimalNumberByRoundingUp;

/** Equal to MATH.FLOOR() */
- (NSDecimalNumber *)td_decimalNumberByRoundingDown;

/** Equal to MATH.Round() */
- (NSDecimalNumber *)td_decimalNumberByRoundingHalfUp;

/** For percentage. */
- (NSDecimalNumber *)td_decimalDividing100;

/** For percentage. */
- (NSDecimalNumber *)td_decimalMultiplying100;

#pragma mark - Initializer
/** Convert basic NSNumber to NSDecimalNumber. */
+ (NSDecimalNumber *)td_decimalNumberWithNumber:(NSNumber *)val;

/** Convert primative type to NSDecimalNumber. */
+ (NSDecimalNumber *)td_decimalNumberWithDouble:(long double)val;

/** Convert basic NSNumber to NSDecimalNumber with custom rounding option. */
+ (NSDecimalNumber *)td_decimalNumberWithNumber:(NSNumber *)val rounding:(NSDecimalNumberHandler *)roundingOption;

/** Convert primative type to NSDecimalNumber with custom rounding option. */
+ (NSDecimalNumber *)td_decimalNumberWithDouble:(long double)val rounding:(NSDecimalNumberHandler *)roundingOption;

/** XPOS default decimal rounding option (half up, rounding by 2). */
+ (NSDecimalNumberHandler *)td_defaultRoundingOption;

/** Shorter way to init handler. (NSRoundModePlain = Rounding Half Up). scale = number of decimal digit. */
+ (NSDecimalNumberHandler *)td_handlerForRoundingMode:(NSRoundingMode)roundingMode scale:(short)scale;



@end
