@import XCTest;

#import "NSDate+HYPString.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testTimeString
{
    NSDate *date = [self timeForHour:10 minute:10];
    XCTAssertEqualObjects([date hyp_timeString], @"10:10");
}

- (void)testDateString
{
    NSDate *date = [self dateForDay:1 month:1 year:2010];
    XCTAssertEqualObjects([date hyp_dateString], @"2010-01-01");
}

- (void)testDateStringWithFormat
{
    NSDate *date = [self dateForDay:1 month:1 year:2010];
    XCTAssertEqualObjects([date hyp_dateStringWithFormat:@"dd.MM.yyyy"], @"01.01.2010");
}

- (void)testTimeRangeStringToEndDate
{
    NSDate *startDate = [self timeForHour:10 minute:10];
    NSDate *endDate = [self timeForHour:12 minute:12];
    XCTAssertEqualObjects([startDate hyp_timeRangeStringToEndDate:endDate], @"10:10 - 12:12");
}

- (void)testDateRangeStringToEndDate
{
    NSDate *startDate = [self dateForDay:1 month:1 year:2010];
    NSDate *endDate = [self dateForDay:2 month:2 year:2012];
    XCTAssertEqualObjects([startDate hyp_dateRangeStringToEndDate:endDate], @"2010-01-01 - 2012-02-02");
}

- (void)testDateRangeStringToEndDateWithFormat
{
    NSDate *startDate = [self dateForDay:1 month:1 year:2010];
    NSDate *endDate = [self dateForDay:2 month:2 year:2012];
    XCTAssertEqualObjects([startDate hyp_dateRangeStringToEndDate:endDate withFormat:@"dd.MM.yyyy"], @"01.01.2010 - 02.02.2012");
}

@end
