//
//  SYDNoticeModel.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/3/20.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYDNoticeModel : NSObject

@property(nonatomic,copy) NSString *ID;//外访id
@property (nonatomic, copy) NSString *distanceRange;//通知时间
@property (nonatomic, copy) NSString *noticeRange;
@property (nonatomic, copy) NSString *news_status;//通知类型(1-签到通知 2-数据上传 3-任务回收 4-任务分配)
@property (nonatomic, copy) NSString *content;//通知内容
@property (nonatomic, copy) NSString *cityCode;//通知状态(0-未读，1-已读)
@property(nonatomic,copy) NSString *createTime;
@property(nonatomic,copy) NSString *notice_type;
@property(nonatomic,copy) NSString *name;

@end
