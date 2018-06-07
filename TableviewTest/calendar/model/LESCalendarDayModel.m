//
//  LESCalendarDayModel.m
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  日历日期模型

#import "LESCalendarDayModel.h"

@implementation LESCalendarDayModel

//公共的方法
+ (LESCalendarDayModel *)calendarDayWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day
{
    LESCalendarDayModel *calendarDay = [[LESCalendarDayModel alloc] init];//初始化自身
    calendarDay.year = year;//年
    calendarDay.month = month;//月
    calendarDay.day = day;//日
    
    return calendarDay;
}

//比较日期是今天之前还是今天之后
+(void)compareToday:(NSDate *)today withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *todayStr = [dateFormatter stringFromDate:today];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:todayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
//        NSLog(@"日期大于今天--");
    }
    else if (result == NSOrderedAscending){
//        NSLog(@"日期小于今天--");
    }
//    NSLog(@"日期等于今天--");
}

//返回当前天的NSDate对象
- (NSDate *)date
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.year = self.year;
    c.month = self.month;
    c.day = self.day;
    return [[NSCalendar currentCalendar] dateFromComponents:c];
}

//返回当前天的NSString对象
- (NSString *)toString
{
    NSDate *date = [self date];
    NSString *string = [date stringFromDate:date];
    return string;
}
-(NSString *)toRightString{
    NSDate *date = [self date];
    NSString *string = [date stringFromDate2:date];
    return string;
}

//返回星期几
- (NSString *)getWeek
{
    
    NSDate *date = [self date];
    
    NSString *week_str = [date compareIfTodayWithDate];
    
    return week_str;
}

//判断是不是同一天
- (BOOL)isEqualTo:(LESCalendarDayModel *)day
{
    BOOL isEqual = (self.year == day.year) && (self.month == day.month) && (self.day == day.day);
    return isEqual;
}

@end
