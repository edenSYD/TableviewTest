//
//  LESCalendarLogic.h
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  日历逻辑模型

#import <Foundation/Foundation.h>
#import "LESCalendarDayModel.h"
#import "NSDate+LESCalendarLogic.h"

@interface LESCalendarLogic : NSObject

- (NSMutableArray *)reloadCalendarView:(NSDate *)date  selectDate:(NSDate *)date1 needDays:(int)days_number;

- (void)selectLogic:(LESCalendarDayModel *)day;

@end
