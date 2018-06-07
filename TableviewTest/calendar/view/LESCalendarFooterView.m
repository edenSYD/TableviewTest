//
//  LESCalendarFooterView.m
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/2.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  购票日历FooterView

#import "LESCalendarFooterView.h"

@implementation LESCalendarFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.lineView.backgroundColor = SEPARATE_LINE_COLOR;
//    self.lineView.height = SEPARATOR_HEIGHT;
    self.sureBtn.layer.cornerRadius = 5.0f;
//    self.dayLabel.text = [NSString stringWithFormat:@"共%d天",[[YMSaveTool valueForKey:@"CalendarSelectDay"] intValue]];
//    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f元",[[YMSaveTool valueForKey:@"CalendarSelectPrice"]floatValue]];
    
    //NSLog(@"购票日历FooterView显示总天数:%d,总票价:%.2f",[[YMSaveTool valueForKey:@"CalendarSelectDay"] intValue],[[YMSaveTool valueForKey:@"CalendarSelectPrice"]floatValue]);
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
        self.frame = frame;
    }
    return self;
}

- (IBAction)ruleHideBtnClick:(id)sender {
//    NSLog(@"点击了购票,退票规则隐藏按钮");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ticketRules" object:nil];

}

- (IBAction)askBtnClick:(id)sender {
//    NSLog(@"点击了申请加班次按钮");
    //[SVProgressHUD displayErrorWithStatus:@"您的申请我们已收到,请耐心等候"];
}

- (IBAction)sureBtnClick:(id)sender {
//    NSLog(@"点击了确认按钮");
//    if ([[YMSaveTool valueForKey:@"CalendarSelectDay"] intValue] <= 0 || [[YMSaveTool valueForKey:@"CalendarSelectPrice"]floatValue] <= 0) {
//        [SVProgressHUD displayInfoWithStatus:@"日期或票价错误,请重新选择"];
//    }else{
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"sureBtnClick" object:nil];
//    }
}

@end
