//
//  LESCalendarDayCell.m
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  购票日历cell

#import "LESCalendarDayCell.h"

@implementation LESCalendarDayCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if (selected) {
        //选中时
        
        self.day_lab.textColor = KWhiteColor;
        
        self.backgroundColor = ORANGE_COLOR;
        
        self.priceLabel.textColor = KWhiteColor;
        
        self.ticketLabel.textColor = KWhiteColor;
        
    }else{
        //非选中
        
        self.day_lab.textColor = SUB_TITLE_COLOR;
        
        self.backgroundColor = KWhiteColor;
        
        self.priceLabel.textColor = Mine_INFOSUBTITLE_COLOR;
        
        self.ticketLabel.textColor = ORANGE_COLOR;

    }
}

- (void)initView{

    //日期
    self.day_lab = [[UILabel alloc]init];
    self.day_lab.textAlignment = NSTextAlignmentLeft;
    self.day_lab.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.day_lab];
    [self.day_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(4);
        make.top.equalTo(self.mas_top).offset(4);
        make.height.equalTo(@(12));
    }];
    
    //有票标签
    self.ticketLabel = [[UILabel alloc]init];
    self.ticketLabel.textAlignment = NSTextAlignmentRight;
    self.ticketLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.ticketLabel];
    [self.ticketLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-4);
        make.centerY.equalTo(self.day_lab.mas_centerY);
        make.width.equalTo(@(22));
        make.height.equalTo(@(10));
    }];
    
    //票价
    self.priceLabel = [[UILabel alloc]init];
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.priceLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.priceLabel];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-4);
        make.top.equalTo(self.ticketLabel.mas_bottom).offset(6);
        make.width.equalTo(@(self.frame.size.width - 8));
        make.height.equalTo(@(10));
    }];
    
}

- (void)setModel:(LESCalendarDayModel *)model
{

    switch (model.style) {
            
        case CellDayTypeEmpty://不显示(当月不存在的日期)
            [self hidden_YES];
            self.backgroundColor = NAV_BAR_COLOR;
            self.userInteractionEnabled = NO;
            break;
            
        case CellDayTypePast://过去的日期
            [self hidden_NO];
            self.backgroundColor = NAV_BAR_COLOR;
            self.day_lab.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
            self.day_lab.textColor = NAV_BAR_COLOR;
            self.priceLabel.hidden = YES;
            self.ticketLabel.hidden = YES;

            self.userInteractionEnabled = NO;
            break;
            
        case CellDayTypeFutur://将来的日期
            self.backgroundColor = KWhiteColor;
            self.day_lab.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
            self.day_lab.textColor = SUB_TITLE_COLOR;
            [self hidden_NO];
            self.priceLabel.hidden = NO;
            self.ticketLabel.hidden = NO;
            self.priceLabel.textColor = ORANGE_COLOR;
            self.ticketLabel.textColor = ORANGE_COLOR;

            break;
            
        default:
            
            break;
    }
    
    
}

//隐藏
- (void)hidden_YES{
    
    self.day_lab.hidden = YES;
    self.priceLabel.hidden = YES;
    self.ticketLabel.hidden = YES;
    
}

//显示
- (void)hidden_NO{
    
    self.day_lab.hidden = NO;
    self.priceLabel.hidden = NO;
    self.ticketLabel.hidden = NO;
    
}


@end
