//
//  LESCalendarDayCell.h
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  购票日历cell

#import <UIKit/UIKit.h>
#import "LESCalendarDayModel.h"

@interface LESCalendarDayCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *day_lab;//日期

@property (nonatomic, strong) UILabel *priceLabel;//票价

@property (nonatomic, strong) UILabel *ticketLabel;//标签(有票/无票)

@property (nonatomic, strong) UILabel *countLabel;//折扣

@property (nonatomic, copy) NSString *price;//票价

@property(nonatomic , strong)LESCalendarDayModel *model;

@property (nonatomic, copy) NSString *ticketID;//车票ID



//@property (nonatomic, assign) BOOL isSelected;

@end
