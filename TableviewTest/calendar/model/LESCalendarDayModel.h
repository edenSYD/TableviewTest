//
//  LESCalendarDayModel.h
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  日历日期模型


//#define CAN_SHOW 1    //可以被点击
//#define CANNOT_SHOW 0//不能被点击

#import <Foundation/Foundation.h>
#import "NSDate+LESCalendarLogic.h"

typedef NS_ENUM(NSInteger, CollectionViewCellDayType) {
    
    CellDayTypeEmpty,   //不显示
    CellDayTypePast,    //过去的日期
    CellDayTypeFutur,   //将来的日期
//    CellDayTypeClick    //被点击的日期

};


@interface LESCalendarDayModel : NSObject

@property (assign, nonatomic) CollectionViewCellDayType style;//显示的样式

@property (nonatomic, assign) NSUInteger day;//天
@property (nonatomic, assign) NSUInteger month;//月
@property (nonatomic, assign) NSUInteger year;//年
@property (nonatomic, assign) NSUInteger week;//周

//后台数据
@property (nonatomic, copy) NSString *routeid;//线路id

@property (nonatomic, copy) NSString *servertime;//服务时间

@property (nonatomic, copy) NSString *serverdate;//服务日期

@property (nonatomic, copy) NSString *remainticketnum;//剩余票数

@property (nonatomic, copy) NSString *price;//票价

@property (nonatomic, copy) NSString *isbooked;//是否已经购买当天票(0-未购买,1-已购买)

@property (nonatomic, assign) BOOL isSelected;//是否已经被选中

//我的订单界面

@property (nonatomic, copy) NSString *cityCode;//城市code

@property (nonatomic, copy) NSString *takeDate;//乘车日期

@property (nonatomic, copy) NSString *ticketId;//车票编号

@property (nonatomic, copy) NSString *ticketStatus;//车票状态：0-未生效 1-有效 2-已使用 3-已过期 4-已退款

@property (nonatomic, copy) NSString *orderNo;//订单号

+ (LESCalendarDayModel *)calendarDayWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;

+(void)compareToday:(NSDate *)today withAnotherDay:(NSDate *)anotherDay;
- (NSDate *)date;//返回当前天的NSDate对象
- (NSString *)toString;//返回当前天的NSString对象
- (NSString *)getWeek; //返回星期
-(NSString *)toRightString;
- (BOOL)isEqualTo:(LESCalendarDayModel *)day;//判断是不是同一天

@end
