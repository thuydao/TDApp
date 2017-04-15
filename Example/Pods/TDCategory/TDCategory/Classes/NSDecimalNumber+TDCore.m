//
//  NSDecimalNumber+TDCore.m
//  Pods
//
//  Created by Tun on 4/5/17.
//
//

#import "NSDecimalNumber+TDCore.h"

@implementation NSDecimalNumber (TDCore)
- (NSDecimalNumber *)td_absoluteValue
{
  return [self td_isLessThan:[NSDecimalNumber zero]] ? self.td_reverseValue : self;
}

- (BOOL)td_isGreaterThan:(NSDecimalNumber *)anotherNumber
{
  return [self compare:anotherNumber] == NSOrderedDescending;
}

- (BOOL)td_isEqualTo:(NSDecimalNumber *)anotherNumber
{
  return [self compare:anotherNumber] == NSOrderedSame;
}

- (BOOL)td_isLessThan:(NSDecimalNumber *)anotherNumber
{
  return [self compare:anotherNumber] == NSOrderedAscending;
}

- (BOOL)td_isEven
{
  return [[self td_decimalNumberByModuloFor:[NSDecimalNumber td_decimalNumberWithDouble:2]] td_isEqualTo:[NSDecimalNumber zero]];
}

- (NSDecimalNumber *)td_reverseValue
{
  return [self decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithMantissa:1 exponent:0 isNegative:YES]];
}

- (NSDecimalNumber *)td_decimalNumberByModuloFor:(NSDecimalNumber *)divisor
{
  @try
  {
    NSRoundingMode roundingMode = (([self intValue] < 0) ^ ([self intValue] < 0)) ? NSRoundUp : NSRoundDown;
    
    // divide and get the remainder
    NSDecimalNumber *quotient = [self decimalNumberByDividingBy:divisor
                                                   withBehavior:[NSDecimalNumber td_handlerForRoundingMode:roundingMode scale:0]];
    NSDecimalNumber *subtract = [quotient decimalNumberByMultiplyingBy:divisor];
    return [self decimalNumberBySubtracting:subtract];
  }
  @catch (NSException *exception)
  {
    return [NSDecimalNumber zero];
  }
  
}

- (NSDecimalNumber *)td_decimalNumberByRoundingUp
{
  return [self decimalNumberByRoundingAccordingToBehavior:[NSDecimalNumber td_handlerForRoundingMode:NSRoundUp scale:0]];
}

- (NSDecimalNumber *)td_decimalNumberByRoundingDown
{
  return [self decimalNumberByRoundingAccordingToBehavior:[NSDecimalNumber td_handlerForRoundingMode:NSRoundDown scale:0]];
}

- (NSDecimalNumber *)td_decimalNumberByRoundingHalfUp
{
  return [self decimalNumberByRoundingAccordingToBehavior:[NSDecimalNumber td_handlerForRoundingMode:NSRoundPlain scale:0]];
}

- (NSDecimalNumber *)td_decimalDividing100 {
  return [self decimalNumberByDividingBy:[NSDecimalNumber td_decimalNumberWithNumber:@100]];
}

- (NSDecimalNumber *)td_decimalMultiplying100 {
  return [self decimalNumberByMultiplyingBy:[NSDecimalNumber td_decimalNumberWithNumber:@100]];
}

#pragma mark - Initializer

+ (NSDecimalNumber *)td_decimalNumberWithNumber:(NSNumber *)val
{
  return [self td_decimalNumberWithNumber:val rounding:[self td_defaultRoundingOption]];
}

+ (NSDecimalNumber *)td_decimalNumberWithDouble:(long double)val
{
  return [self td_decimalNumberWithDouble:val rounding:[self td_defaultRoundingOption]];
}

+ (NSDecimalNumber *)td_decimalNumberWithNumber:(NSNumber *)val rounding:(NSDecimalNumberHandler *)roundingOption
{
  return [self td_decimalNumberWithDouble:val.doubleValue rounding:roundingOption];
}

+ (NSDecimalNumber *)td_decimalNumberWithDouble:(long double)val rounding:(NSDecimalNumberHandler *)roundingOption
{
  NSDecimalNumber *number = [[NSDecimalNumber alloc] initWithDouble:val];
  number = [number decimalNumberByRoundingAccordingToBehavior:roundingOption];
  return number;
}

+ (NSDecimalNumberHandler *)td_defaultRoundingOption
{
  return [self td_handlerForRoundingMode:NSRoundPlain scale:2];
}

+ (NSDecimalNumberHandler *)td_handlerForRoundingMode:(NSRoundingMode)roundingMode scale:(short)scale
{
  return [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingMode
                                                                scale:scale
                                                     raiseOnExactness:NO
                                                      raiseOnOverflow:NO
                                                     raiseOnUnderflow:NO
                                                  raiseOnDivideByZero:NO];
}


@end
