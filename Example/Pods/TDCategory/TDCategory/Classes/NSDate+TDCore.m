//
//  NSDate+Core.m
//  test
//
//  Created by Dao Duy Thuy on 4/14/14.
//  Copyright BunLV 2014. All rights reserved.
//  Provider : Dao Duy Thuy
//

#import "NSDate+TDCore.h"

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

#define DATE_COMPONENTS (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@implementation NSDate (TDCore)

#pragma mark Relative Dates

+ (NSDate *)td_dateWithDaysFromNow:(NSInteger)days
{
    // Thanks, Jim Morrison
    return [[NSDate date] td_dateByAddingDays:days];
}

+ (NSDate *)td_dateWithDaysBeforeNow:(NSInteger)days
{
    // Thanks, Jim Morrison
    return [[NSDate date] td_dateBySubtractingDays:days];
}

+ (NSDate *)td_dateTomorrow
{
    return [NSDate td_dateWithDaysFromNow:1];
}

+ (NSDate *)td_dateYesterday
{
    return [NSDate td_dateWithDaysBeforeNow:1];
}

+ (NSDate *)td_dateWithHoursFromNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)td_dateWithHoursBeforeNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)td_dateWithMinutesFromNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)td_dateWithMinutesBeforeNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark Comparing Dates

- (BOOL)td_isEqualToDateIgnoringTime:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate];
    return ((components1.year == components2.year)&&
            (components1.month == components2.month)&&
            (components1.day == components2.day));
}

- (BOOL)td_isToday
{
    return [self td_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)td_isTomorrow
{
    return [self td_isEqualToDateIgnoringTime:[NSDate td_dateTomorrow]];
}

- (BOOL)td_isYesterday
{
    return [self td_isEqualToDateIgnoringTime:[NSDate td_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL)td_isSameWeekAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate];
    
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekOfMonth != components2.weekOfMonth)return NO;
    
    // Must have a time interval under 1 week. Thanks @aclark
    int values = fabs([self timeIntervalSinceDate:aDate]);
    return (values < D_WEEK );
}

- (BOOL)td_isThisWeek
{
    return [self td_isSameWeekAsDate:[NSDate date]];
}

- (BOOL)td_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self td_isSameWeekAsDate:newDate];
}

- (BOOL)td_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self td_isSameWeekAsDate:newDate];
}

// Thanks, mspasov
- (BOOL)td_isSameMonthAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month)&&
            (components1.year == components2.year));
}

- (BOOL)td_isThisMonth
{
    return [self td_isSameMonthAsDate:[NSDate date]];
}

- (BOOL)td_isSameYearAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

- (BOOL)td_isThisYear
{
    // Thanks, baspellis
    return [self td_isSameYearAsDate:[NSDate date]];
}

- (BOOL)td_isNextYear
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year + 1));
}

- (BOOL)td_isLastYear
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year - 1));
}

- (BOOL)td_isEarlierThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL)td_isLaterThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

// Thanks, markrickert
- (BOOL)td_isInFuture
{
    return ([self td_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL)td_isInPast
{
    return ([self td_isEarlierThanDate:[NSDate date]]);
}


#pragma mark Roles
- (BOOL)td_isTypicallyWeekend
{
    NSDateComponents *components = [CURRENT_CALENDAR components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1)||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL)td_isTypicallyWorkday
{
    return ![self td_isTypicallyWeekend];
}

#pragma mark Adjusting Dates

- (NSDate *)td_dateByAddingDays:(NSInteger)dDays
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_DAY * dDays;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)td_dateBySubtractingDays:(NSInteger)dDays
{
    return [self td_dateByAddingDays:(dDays * -1)];
}

- (NSDate *)td_dateByAddingHours:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)td_dateBySubtractingHours:(NSInteger)dHours
{
    return [self td_dateByAddingHours:(dHours * -1)];
}

- (NSDate *)td_dateByAddingMinutes:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)td_dateBySubtractingMinutes:(NSInteger)dMinutes
{
    return [self td_dateByAddingMinutes:(dMinutes * -1)];
}

- (NSDate *)td_dateAtStartOfDay
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [CURRENT_CALENDAR dateFromComponents:components];
}

- (NSDateComponents *)td_componentsWithOffsetFromDate:(NSDate *)aDate
{
    NSDateComponents *dTime = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark Retrieving Intervals

- (NSInteger)td_minutesAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_MINUTE);
}

- (NSInteger)td_minutesBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_MINUTE);
}

- (NSInteger)td_hoursAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_HOUR);
}

- (NSInteger)td_hoursBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_HOUR);
}

- (NSInteger)td_daysAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_DAY);
}

- (NSInteger)td_daysBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)td_distanceInDaysToDate:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}

#pragma mark Decomposing Dates

- (NSInteger)td_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [CURRENT_CALENDAR components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

- (NSInteger)td_hour
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.hour;
}

- (NSInteger)td_minute
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.minute;
}

- (NSInteger)td_seconds
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.second;
}

- (NSInteger)td_day
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.day;
}

- (NSInteger)td_month
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.month;
}

- (NSInteger)td_week
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekOfMonth;
}

- (NSInteger)td_weekday
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekday;
}

- (NSInteger)td_nthWeekday // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger)td_year
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.year;
}

- (NSString*)td_stringFromDate:(NSDate*)aDate
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *dateString = [dateFormat stringFromDate:aDate];
    
    return (dateString);
}

- (NSString *)td_stringFromFormat:(NSString *)format
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *dateString = [dateFormat stringFromDate:self];
    
    return (dateString);
}

- (NSString*)td_stringFromDateToServer
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *dateString = [dateFormat stringFromDate:[NSDate date]];
    
    return (dateString);
}


- (NSString*)td_stringFromDatePickerToDislay:(NSDate*)aDate
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MMMM-yyyy"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *dateString = [dateFormat stringFromDate:aDate];
    
    return (dateString);
}

- (NSString*)td_stringDateFromServerToDislay:(NSString*)sServerDate {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *serverDate = [dateFormatter dateFromString:sServerDate];
    
    [dateFormatter setDateFormat:@"dd-MMMM-yyyy"];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *sDislayDate = [dateFormatter stringFromDate:serverDate];
    
    return sDislayDate;
}

- (NSString*)td_stringDateFromDislayToServer:(NSString*)sDislayDate
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd-MMMM-yyyy";
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *dislayDate = [dateFormatter dateFromString:sDislayDate];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *sServerDate = [dateFormatter stringFromDate:dislayDate];
    
    return sServerDate;
}

- (NSString*)td_stringDateFromFacebookToDislay:(NSString*)sFaceDate {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd/yyyy";
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *faceDate = [dateFormatter dateFromString:sFaceDate];
    
    [dateFormatter setDateFormat:@"dd-MMMM-yyyy"];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *sDislayDate = [dateFormatter stringFromDate:faceDate];
    
    return sDislayDate;
}

- (NSString *)td_stringDateFromRegisterToDisplayTarget:(NSString *)sDisplayDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"dd-MM-yyyy";
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *displayDate = [dateFormatter dateFromString:sDisplayDate];
    
    [dateFormatter setDateFormat:@"mm-dd-yyyy"];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [dateFormatter stringFromDate:displayDate];
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Convert date to: yyyy-MM-dd
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+
+ (NSString *)td_stringDateFromDisplayToServerMyProfile:(NSString *)strDisplay
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    // Format display
    [dateFormat setDateFormat:@"dd-MMMM-yyyy"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    
    // Convert string to date display
    NSDate *dateDisplay = [dateFormat dateFromString:strDisplay];
    
    // Format send to server
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [dateFormat stringFromDate:dateDisplay];
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Convert date to: MM-dd-yyyy hh:mm aaa
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
- (NSString *)td_stringDateFromCalendarToServer_Trainee
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM-dd-yyyy hh:mm aaa"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [dateFormat stringFromDate:self];
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Convert date to: dd-MMMM-yyyy
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
- (NSString *)td_stringDateFromCalendarToDisplayMyProfile
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MMMM-yyyy"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [dateFormat stringFromDate:self];
}


+ (NSDate *)td_dateFromString:(NSString *)str format:(NSString *)format
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [dateFormat dateFromString:str];
}

@end
