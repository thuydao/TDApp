//
//  NSDate+Core.h
//  test
//
//  Created by Dao Duy Thuy on 4/14/14.
//  Copyright BunLV 2014. All rights reserved.
//  Provider : Dao Duy Thuy
//

#import <Foundation/Foundation.h>

@interface NSDate (TDCore)

// Relative dates from the current date
+ (NSDate *)td_dateTomorrow;
+ (NSDate *)td_dateYesterday;
+ (NSDate *)td_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)td_dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)td_dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate *)td_dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate *)td_dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate *)td_dateWithMinutesBeforeNow:(NSInteger)dMinutes;

// Comparing dates
- (BOOL)td_isEqualToDateIgnoringTime:(NSDate *)aDate;
- (BOOL)td_isToday;
- (BOOL)td_isTomorrow;
- (BOOL)td_isYesterday;
- (BOOL)td_isSameWeekAsDate:(NSDate *)aDate;
- (BOOL)td_isThisWeek;
- (BOOL)td_isNextWeek;
- (BOOL)td_isLastWeek;
- (BOOL)td_isSameMonthAsDate:(NSDate *)aDate;
- (BOOL)td_isThisMonth;
- (BOOL)td_isSameYearAsDate:(NSDate *)aDate;
- (BOOL)td_isThisYear;
- (BOOL)td_isNextYear;
- (BOOL)td_isLastYear;
- (BOOL)td_isEarlierThanDate:(NSDate *)aDate;
- (BOOL)td_isLaterThanDate:(NSDate *)aDate;
- (BOOL)td_isInFuture;
- (BOOL)td_isInPast;

// Date roles
- (BOOL)td_isTypicallyWorkday;
- (BOOL)td_isTypicallyWeekend;

// Adjusting dates
- (NSDate *)td_dateByAddingDays:(NSInteger)dDays;
- (NSDate *)td_dateBySubtractingDays:(NSInteger)dDays;
- (NSDate *)td_dateByAddingHours:(NSInteger)dHours;
- (NSDate *)td_dateBySubtractingHours:(NSInteger)dHours;
- (NSDate *)td_dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate *)td_dateBySubtractingMinutes:(NSInteger)dMinutes;
- (NSDate *)td_dateAtStartOfDay;

// Retrieving intervals
- (NSInteger)td_minutesAfterDate:(NSDate *)aDate;
- (NSInteger)td_minutesBeforeDate:(NSDate *)aDate;
- (NSInteger)td_hoursAfterDate:(NSDate *)aDate;
- (NSInteger)td_hoursBeforeDate:(NSDate *)aDate;
- (NSInteger)td_daysAfterDate:(NSDate *)aDate;
- (NSInteger)td_daysBeforeDate:(NSDate *)aDate;
- (NSInteger)td_distanceInDaysToDate:(NSDate *)anotherDate;

- (NSString*)td_stringFromDate:(NSDate*)aDate;
- (NSString *)td_stringFromFormat:(NSString *)format;
- (NSString*)td_stringFromDateToServer;
- (NSString*)td_stringFromDatePickerToDislay:(NSDate*)aDate;
- (NSString*)td_stringDateFromServerToDislay:(NSString*)sServerDate;
- (NSString*)td_stringDateFromDislayToServer:(NSString*)sDislayDate;
- (NSString*)td_stringDateFromFacebookToDislay:(NSString*)sFaceDate;
- (NSString *)td_stringDateFromRegisterToDisplayTarget:(NSString *)sDisplayDate;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Convert date to: yyyy-MM-dd
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+
+ (NSString *)td_stringDateFromDisplayToServerMyProfile:(NSString *)strDisplay;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Convert date to: MM-dd-yyyy hh:mm aaa
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
- (NSString *)td_stringDateFromCalendarToServer_Trainee;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Convert date to: dd-MMMM-yyyy
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
- (NSString *)td_stringDateFromCalendarToDisplayMyProfile;

+ (NSDate *)td_dateFromString:(NSString *)str format:(NSString *)format;

// Decomposing dates
@property (readonly) NSInteger td_nearestHour;
@property (readonly) NSInteger td_hour;
@property (readonly) NSInteger td_minute;
@property (readonly) NSInteger td_seconds;
@property (readonly) NSInteger td_day;
@property (readonly) NSInteger td_month;
@property (readonly) NSInteger td_week;
@property (readonly) NSInteger td_weekday;
@property (readonly) NSInteger td_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger td_year;

@end
