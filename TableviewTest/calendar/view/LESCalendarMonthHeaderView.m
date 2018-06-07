//
//  LESCalendarMonthHeaderView.m
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  购票日历头视图(月份/星期)

#import "LESCalendarMonthHeaderView.h"

#define CATDayLabelWidth  SCREEN_WIDTH / 7
#define CATDayLabelHeight 40.0f

@interface LESCalendarMonthHeaderView ()

@property (weak, nonatomic) UILabel *day1OfTheWeekLabel;
@property (weak, nonatomic) UILabel *day2OfTheWeekLabel;
@property (weak, nonatomic) UILabel *day3OfTheWeekLabel;
@property (weak, nonatomic) UILabel *day4OfTheWeekLabel;
@property (weak, nonatomic) UILabel *day5OfTheWeekLabel;
@property (weak, nonatomic) UILabel *day6OfTheWeekLabel;
@property (weak, nonatomic) UILabel *day7OfTheWeekLabel;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation LESCalendarMonthHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.clipsToBounds = YES;
    
    //月份(每月头视图XXXX年xx月)
    UILabel *masterLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 40.0f, SCREEN_WIDTH, 35.f)];
    [masterLabel setBackgroundColor:[UIColor clearColor]];
    [masterLabel setTextAlignment:NSTextAlignmentLeft];
    [masterLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:12.0f]];
    self.masterLabel = masterLabel;
    self.masterLabel.textColor = TITLE_COLOR;
    [self addSubview:self.masterLabel];
    
    //分隔线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 39, SCREEN_WIDTH,SEPARATOR_HEIGHT)];
    [lineView setBackgroundColor:SEPARATE_LINE_COLOR];
    self.lineView = lineView;
    [self addSubview:self.lineView];
    
    //星期
    CGFloat xOffset = 0.0f;
    CGFloat yOffset = 0.0f;

    //周日
    UILabel *dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setFont:[UIFont systemFontOfSize:14.0f]];
    self.day1OfTheWeekLabel = dayOfTheWeekLabel;
    self.day1OfTheWeekLabel.textAlignment = NSTextAlignmentCenter;
    self.day1OfTheWeekLabel.textColor = TITLE_COLOR;
    [self addSubview:self.day1OfTheWeekLabel];
    
    //周一
    xOffset += CATDayLabelWidth + 0.0f;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setFont:[UIFont systemFontOfSize:14.0f]];
    self.day2OfTheWeekLabel = dayOfTheWeekLabel;
    self.day2OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day2OfTheWeekLabel.textColor = TITLE_COLOR;
    [self addSubview:self.day2OfTheWeekLabel];
    
    //周二
    xOffset += CATDayLabelWidth + 0.0f;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setFont:[UIFont systemFontOfSize:14.0f]];
    self.day3OfTheWeekLabel = dayOfTheWeekLabel;
    self.day3OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day3OfTheWeekLabel.textColor = TITLE_COLOR;
    [self addSubview:self.day3OfTheWeekLabel];
    
    //周三
    xOffset += CATDayLabelWidth + 0.0f;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setFont:[UIFont systemFontOfSize:14.0f]];
    self.day4OfTheWeekLabel = dayOfTheWeekLabel;
    self.day4OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day4OfTheWeekLabel.textColor = TITLE_COLOR;
    [self addSubview:self.day4OfTheWeekLabel];
    
    //周四
    xOffset += CATDayLabelWidth + 0.0f;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setFont:[UIFont systemFontOfSize:14.0f]];
    self.day5OfTheWeekLabel = dayOfTheWeekLabel;
    self.day5OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day5OfTheWeekLabel.textColor = TITLE_COLOR;
    [self addSubview:self.day5OfTheWeekLabel];
    
    //周五
    xOffset += CATDayLabelWidth + 0.0f;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setFont:[UIFont systemFontOfSize:14.0f]];
    self.day6OfTheWeekLabel = dayOfTheWeekLabel;
    self.day6OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day6OfTheWeekLabel.textColor = TITLE_COLOR;
    [self addSubview:self.day6OfTheWeekLabel];
    
    //周六
    xOffset += CATDayLabelWidth + 0.0f;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setFont:[UIFont systemFontOfSize:14.0f]];
    self.day7OfTheWeekLabel = dayOfTheWeekLabel;
    self.day7OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day7OfTheWeekLabel.textColor = TITLE_COLOR;
    [self addSubview:self.day7OfTheWeekLabel];
    
    [self updateWithDayNames:@[@"日", @"一", @"二", @"三", @"四", @"五", @"六"]];
    
}


//设置 @"日", @"一", @"二", @"三", @"四", @"五", @"六"
- (void)updateWithDayNames:(NSArray *)dayNames
{
    for (int i = 0 ; i < dayNames.count; i++) {
        switch (i) {
            case 0:
                self.day1OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 1:
                self.day2OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 2:
                self.day3OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 3:
                self.day4OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 4:
                self.day5OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 5:
                self.day6OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 6:
                self.day7OfTheWeekLabel.text = dayNames[i];
                break;
                
            default:
                break;
        }
    }
}



@end
