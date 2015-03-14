@import XCTest;

#import "NSDate+HYPString.h"

#define ARC4RANDOM_MAX 0x100000000
static NSString * const HYPDateDefaultFormat = @"yyyy-MM-dd";
static NSString * const HYPTimeDefaultFormat = @"HH:mm";
static NSString * const HYPTimeRangeFormat = @"%@ - %@";
static const NSUInteger HYPTestLimit = 50;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testTimeStringFromDate
{
    for (NSDate *date in [self randomDates]) {
        NSString *timeString = [self dateStringFromDate:date
                                             withFormat:HYPTimeDefaultFormat];
        XCTAssertEqualObjects([date hyp_timeString], timeString);
    }
}

- (void)testDateStringFromDate
{
    for (NSDate *date in [self randomDates]) {
        NSString *dateString = [self dateStringFromDate:date
                                             withFormat:HYPDateDefaultFormat];
        XCTAssertEqualObjects([date hyp_dateString], dateString);
    }
}

- (void)testDateStringFromDateWithFormat
{
    for (NSDate *date in [self randomDates]) {
        for (NSString *format in [Tests dateFormats]) {
            NSString *formattedDateString = [self dateStringFromDate:date
                                                          withFormat:format];
            XCTAssertEqualObjects([date hyp_dateStringWithFormat:format], formattedDateString);
        }
    }
}

- (void)testTimeRangeStringFromStartDateToEndDate
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        NSDate *startDate = [self randomDate];
        NSDate *endDate = [self randomDate];
        NSString *timeRange = [startDate hyp_dateRangeStringToEndDate:endDate
                                                           withFormat:HYPTimeDefaultFormat];
        XCTAssertEqualObjects([startDate hyp_timeRangeStringToEndDate:endDate], timeRange);
    }
}

- (void)testDateRangeStringFromStartDateToEndDate
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        NSDate *startDate = [self randomDate];
        NSDate *endDate = [self randomDate];
        NSString *dateRange = [startDate hyp_dateRangeStringToEndDate:endDate
                                                           withFormat:HYPDateDefaultFormat];
        XCTAssertEqualObjects([startDate hyp_dateRangeStringToEndDate:endDate], dateRange);
    }
}

- (void)testDateRangeStringFromStartDateToEndDateWithFormat
{
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        for (NSString *format in [Tests dateFormats]) {
            NSDate *startDate = [self randomDate];
            NSDate *endDate = [self randomDate];
            NSString *formattedDateRange = [startDate hyp_dateRangeStringToEndDate:endDate
                                                                        withFormat:format];
            XCTAssertEqualObjects([startDate hyp_dateRangeStringToEndDate:endDate withFormat:format], formattedDateRange);
        }
    }
}

#pragma mark - Test data generation

- (NSArray *)randomDates
{
    NSMutableArray *dates = [[NSMutableArray alloc] initWithCapacity:HYPTestLimit];
    for (NSInteger i = 0; i < HYPTestLimit; i++) {
        dates[i] = [self randomDate];
    }

    return [dates copy];
}

- (NSDate *)randomDate
{
    NSTimeInterval maxTimeInterval = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval randomInterval = ((NSTimeInterval)arc4random() / ARC4RANDOM_MAX) * maxTimeInterval;

    return [NSDate dateWithTimeIntervalSinceReferenceDate:randomInterval];
}

- (NSString *)dateStringFromDate:(NSDate *)date withFormat:(NSString *)format;
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = format;

    return [dateFormatter stringFromDate:date];
}

#pragma mark - Static test data

+ (NSArray *)dateFormats
{
    return @[@"yyyy-MM-dd",
             @"yyyy-MM-dd HH:mm",
             @"dd-MM-yyyy",
             @"dd-MM-yyyy HH:mm",
             @"MMM dd, yyyy",
             @"MMM dd, yyyy HH:mm",
             @"invalidFormat"];
}

@end
