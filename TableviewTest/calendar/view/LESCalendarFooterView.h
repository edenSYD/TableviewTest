//
//  LESCalendarFooterView.h
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/2.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  购票日历FooterView

#import <UIKit/UIKit.h>

@interface LESCalendarFooterView : UIView

@property (weak, nonatomic) IBOutlet UIButton *askBtn;//申请加班次按钮

@property (weak, nonatomic) IBOutlet UIButton *ruleHideBtn;//购票规则隐藏按钮

@property (weak, nonatomic) IBOutlet UIView *lineView;//分隔线

@property (weak, nonatomic) IBOutlet UIButton *sureBtn;//确认按钮

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;//天数

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;//钱款

@end
