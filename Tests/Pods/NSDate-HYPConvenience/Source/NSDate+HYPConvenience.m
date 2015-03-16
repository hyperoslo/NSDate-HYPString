#import "NSDate+HYPConvenience.h"

@implementation NSDate (HYPConvenience)

#pragma mark - Helpers

+ (NSDate *)hyp_dateForDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                               fromDate:[NSDate date]];
    components.day = day;
    components.month = month;
    components.year = year;

    return [calendar dateFromComponents:components];
}

+ (NSDate *)hyp_timeForHour:(NSInteger)hour minute:(NSInteger)minute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute)
                                               fromDate:[NSDate date]];
    components.minute = minute;
    components.hour = hour;
    components.month = 1;

    // Workaround: converting date to local timezone doesn't work well
    // with the default year, which is 0001
    components.year = 2000;

    return [calendar dateFromComponents:components];
}

@end
