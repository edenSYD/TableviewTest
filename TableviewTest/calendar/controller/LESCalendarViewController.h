//
//  LESCalendarViewController.h
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  购票日历

#import <UIKit/UIKit.h>
#import "LESCalendarLogic.h"


//回调代码块(单选日期模型)
typedef void (^LESCalendarBlock)(LESCalendarDayModel *model);


@interface LESCalendarViewController : UIViewController

@property (nonatomic, strong) NSString *calendarTitle;//设置导航栏标题

@property(nonatomic ,strong) UICollectionView *collectionView;//网格视图

@property(nonatomic ,strong) NSMutableArray *calendarMonth;//每个月份的中的daymodel容器数组

@property(nonatomic ,strong) LESCalendarLogic *Logic;//日历逻辑

@property (nonatomic, copy) LESCalendarBlock calendarblock;//回调

@property (nonatomic, assign) int daynumber;//天数

@property (nonatomic, assign) int selectDay;//选中的总天数

@property (nonatomic, assign) double selectPrice;//选中的总价格

@property (nonatomic, assign) double dayPrice;//日票单价

@property (nonatomic, strong) NSMutableArray *optiondayArray;//存放选择好的日期对象数组

@property (nonatomic, copy) NSString *blockDays;//选中天数对象

@property (nonatomic, copy) NSString *routeID;//线路ID

@end
