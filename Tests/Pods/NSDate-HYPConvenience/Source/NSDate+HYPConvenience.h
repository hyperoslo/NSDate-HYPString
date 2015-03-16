@import Foundation;

@interface NSDate (HYPConvenience)

+ (NSDate *)hyp_dateForDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;

+ (NSDate *)hyp_timeForHour:(NSInteger)hour minute:(NSInteger)minute;

@end
