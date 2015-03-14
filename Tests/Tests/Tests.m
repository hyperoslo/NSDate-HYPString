@import XCTest;

#import "NSDate+HYPString.h"

#define ARC4RANDOM_MAX 0x100000000

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testTimeStringFromDate
{
    NSDate *date = [self timeForHour:10 minute:10];
    XCTAssertEqualObjects([date hyp_timeString], @"10:10");
}

- (void)testDateStringFromDate
{
    NSDate *date = [self dateForDay:1 month:1 year:2010];
    XCTAssertEqualObjects([date hyp_dateString], @"2010-01-01");
}

- (void)testDateStringFromDateWithFormat
{
    NSDate *date = [self dateForDay:1 month:1 year:2010];
    XCTAssertEqualObjects([date hyp_dateStringWithFormat:@"dd.MM.yyyy"], @"01.01.2010");
}

- (void)testTimeRangeStringFromStartDateToEndDate
{
    NSDate *startDate = [self timeForHour:10 minute:10];
    NSDate *endDate = [self timeForHour:12 minute:12];
    XCTAssertEqualObjects([startDate hyp_timeRangeStringToEndDate:endDate], @"10:10 - 12:12");
}

- (void)testDateRangeStringFromStartDateToEndDate
{
    NSDate *startDate = [self dateForDay:1 month:1 year:2010];
    NSDate *endDate = [self dateForDay:2 month:2 year:2012];
    XCTAssertEqualObjects([startDate hyp_dateRangeStringToEndDate:endDate], @"2010-01-01 - 2012-02-02");
}

- (void)testDateRangeStringFromStartDateToEndDateWithFormat
{
    NSDate *startDate = [self dateForDay:1 month:1 year:2010];
    NSDate *endDate = [self dateForDay:2 month:2 year:2012];
    XCTAssertEqualObjects([startDate hyp_dateRangeStringToEndDate:endDate withFormat:@"dd.MM.yyyy"], @"01.01.2010 - 02.02.2012");
}

#pragma mark - Helpers

- (NSDate *)dateForDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                               fromDate:[NSDate date]];
    components.day = day;
    components.month = month;
    components.year = year;

    return [calendar dateFromComponents:components];
}

- (NSDate *)timeForHour:(NSInteger)hour minute:(NSInteger)minute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute)
                                               fromDate:[NSDate date]];
    components.hour = hour;
    components.minute = minute;

    return [calendar dateFromComponents:components];
}

@end
