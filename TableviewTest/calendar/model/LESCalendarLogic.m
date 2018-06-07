//
//  LESCalendarLogic.m
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  日历逻辑模型

#import "LESCalendarLogic.h"

@interface LESCalendarLogic ()

{
    NSDate *today;//今天的日期
    NSDate *before;//之后的日期
    NSDate *select;//选择的日期
    LESCalendarDayModel *selectcalendarDay;
}

@end

@implementation LESCalendarLogic

//计算当前日期之前几天或者是之后的几天（负数是之前几天，正数是之后的几天）
- (NSMutableArray *)reloadCalendarView:(NSDate *)date  selectDate:(NSDate *)selectdate needDays:(int)days_number
{
    //如果为空就从当天的日期开始
    if(date == nil){
        date = [NSDate date];
    }
    
    //默认选择中的时间
    if (selectdate == nil) {
        selectdate = date;
    }
    
    today = date;//起始日期
    
    before = [date dayInTheFollowingDay:days_number];//计算它days天以后的时间
    
    select = selectdate;//选择的日期
    
    NSDateComponents *todayDC= [today YMDComponents];
    
    NSDateComponents *beforeDC= [before YMDComponents];
    
    NSInteger todayYear = todayDC.year;
    
    NSInteger todayMonth = todayDC.month;
    
    NSInteger beforeYear = beforeDC.year;
    
    NSInteger beforeMonth = beforeDC.month;
    
    NSInteger months = (beforeYear-todayYear) * 12 + (beforeMonth - todayMonth);
    
    NSMutableArray *calendarMonth = [[NSMutableArray alloc]init];//每个月的dayModel数组
    
    for (int i = 0; i <= months; i++) {
        
        NSDate *month = [today dayInTheFollowingMonth:i];
        NSMutableArray *calendarDays = [[NSMutableArray alloc]init];
        [self calculateDaysInPreviousMonthWithDate:month andArray:calendarDays];
        [self calculateDaysInCurrentMonthWithDate:month andArray:calendarDays];
        [self calculateDaysInFollowingMonthWithDate:month andArray:calendarDays];//计算下月份的天数
        
        [calendarMonth insertObject:calendarDays atIndex:i];
    }
    
    return calendarMonth;
    
}



#pragma mark - 日历上+当前+下月份的天数

//计算上月份的天数

- (NSMutableArray *)calculateDaysInPreviousMonthWithDate:(NSDate *)date andArray:(NSMutableArray *)array
{
    NSUInteger weeklyOrdinality = [[date firstDayOfCurrentMonth] weeklyOrdinality];//计算这个的第一天是礼拜几,并转为int型
    NSDate *dayInThePreviousMonth = [date dayInThePreviousMonth];//上一个月的NSDate对象
    NSUInteger daysCount = [dayInThePreviousMonth numberOfDaysInCurrentMonth];//计算上个月有多少天
    NSUInteger partialDaysCount = weeklyOrdinality - 1;//获取上月在这个月的日历上显示的天数
    NSDateComponents *components = [dayInThePreviousMonth YMDComponents];//获取年月日对象
    
    for (NSUInteger i = daysCount - partialDaysCount + 1; i < daysCount + 1; ++i) {
        
        LESCalendarDayModel *calendarDay = [LESCalendarDayModel calendarDayWithYear:components.year month:components.month day:i];
        calendarDay.style = CellDayTypeEmpty;//不显示
        [array addObject:calendarDay];
    }
    
    
    return NULL;
}



//计算下月份的天数

- (void)calculateDaysInFollowingMonthWithDate:(NSDate *)date andArray:(NSMutableArray *)array
{
    NSUInteger weeklyOrdinality = [[date lastDayOfCurrentMonth] weeklyOrdinality];
    if (weeklyOrdinality == 7) return ;
    
    NSUInteger partialDaysCount = 7 - weeklyOrdinality;
    NSDateComponents *components = [[date dayInTheFollowingMonth] YMDComponents];
    
    for (int i = 1; i < partialDaysCount + 1; ++i) {
        LESCalendarDayModel *calendarDay = [LESCalendarDayModel calendarDayWithYear:components.year month:components.month day:i];
        calendarDay.style = CellDayTypeEmpty;
        [array addObject:calendarDay];
    }
}


//计算当月的天数

- (void)calculateDaysInCurrentMonthWithDate:(NSDate *)date andArray:(NSMutableArray *)array
{
    
    NSUInteger daysCount = [date numberOfDaysInCurrentMonth];//计算这个月有多少天
    NSDateComponents *components = [date YMDComponents];//今天日期的年月日
    
    for (int i = 1; i < daysCount + 1; ++i) {
        LESCalendarDayModel *calendarDay = [LESCalendarDayModel calendarDayWithYear:components.year month:components.month day:i];
    
        
        calendarDay.week = [[calendarDay date]getWeekIntValueWithDate];

        [self changStyle:calendarDay];
        [array addObject:calendarDay];
    }
}

- (void)changStyle:(LESCalendarDayModel *)calendarDay
{
    
    NSDateComponents *calendarToDay  = [today YMDComponents];//今天
    NSDateComponents *calendarbefore = [before YMDComponents];//最后一天
    NSDateComponents *calendarSelect = [select YMDComponents];//默认选择的那一天
    
    //被点击选中
    if(calendarSelect.year == calendarDay.year &
       calendarSelect.month == calendarDay.month &
       calendarSelect.day == calendarDay.day){

        calendarDay.style = CellDayTypeFutur;
            selectcalendarDay = calendarDay;
        
    }else{
        //没被点击选中
        
        //昨天乃至过去的时间设置一个灰度
        if (calendarToDay.year >= calendarDay.year &
            calendarToDay.month >= calendarDay.month &
            calendarToDay.day > calendarDay.day) {
            
            calendarDay.style = CellDayTypePast;
            
            //之后的时间时间段
        }else if (calendarbefore.year <= calendarDay.year &
                  calendarbefore.month <= calendarDay.month &
                  calendarbefore.day <= calendarDay.day) {
            
            calendarDay.style = CellDayTypePast;
            
            //需要正常显示的时间段
        }else{

                calendarDay.style = CellDayTypeFutur;
            
        }
    }
}

//点击选中逻辑
- (void)selectLogic:(LESCalendarDayModel *)day
{

    selectcalendarDay.style = CellDayTypeFutur;
    
    selectcalendarDay = day;
    //NSLog(@"%@",day);
    
}

@end
