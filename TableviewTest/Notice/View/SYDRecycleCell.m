//
//  SYDRecycleCell.m
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/3/20.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#import "SYDRecycleCell.h"
#import "UILabel+LXLabel.h"
@interface SYDRecycleCell()
@property (strong, nonatomic)  UILabel *nameLabel;
@property (strong, nonatomic)  UIImageView *circleImage;
@property (strong, nonatomic)  UILabel *ageLabel;
@property (strong, nonatomic)  UILabel *sexLabel;
@property (strong, nonatomic)  UILabel *arrearsLabel;

@property (strong, nonatomic)  UILabel *overdueLabel;
@property (strong, nonatomic)  UILabel *addressLabel;
@property (strong, nonatomic)  UILabel *releationshipLbl;
@property (strong, nonatomic)  UILabel *distributionLbl;

@property (strong, nonatomic)  UILabel *collectStatusLbl;
@property (strong, nonatomic)  UILabel *overDayLbl;
@end
@implementation SYDRecycleCell
//1.初始化子视图
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configRecycleCell];
    }
    return self;
}
-(void)configRecycleCell{
    
    if (!self.nameLabel) {
        // title描述
        UILabel *nameLabel = [UILabel LXLabelWithTextNoFrame:@"高晓松" textColor:RESER_COLOR backgroundColor:ClearColor font:FONT16 textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
    }
    if (!self.circleImage) {
        
        UIImageView *circleImage = [[UIImageView alloc] initWithImage:IMAGE_NAMED(@"reddot")];
        [self.contentView addSubview:circleImage];
        self.circleImage = circleImage;
    }
    if (!self.ageLabel) {
        //
        UILabel *ageLabel = [UILabel LXLabelWithTextNoFrame:@"本人" textColor:RECYCLE_TITLE_COLOR backgroundColor:ClearColor font:FONT13 textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:ageLabel];
        self.ageLabel = ageLabel;
    }
    if (!self.sexLabel) {
        UILabel *sexLabel = [UILabel LXLabelWithTextNoFrame:@"男" textColor:RECYCLE_TITLE_COLOR backgroundColor:ClearColor font:FONT13 textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:sexLabel];
        self.sexLabel = sexLabel;
        self.sexLabel.hidden = YES;
    }
    if (!self.arrearsLabel) {
        UILabel *arrearsLabel = [UILabel LXLabelWithTextNoFrame:@"最新欠款额：2300000.00" textColor:VISIT_TITLE_COLOR backgroundColor:ClearColor font:FONT12 textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:arrearsLabel];
        self.arrearsLabel = arrearsLabel;
    }
    if (!self.overdueLabel) {
        UILabel *overdueLabel = [UILabel LXLabelWithTextNoFrame:@"逾期：156天" textColor:VISIT_TITLE_COLOR backgroundColor:RECYCLE_BACK_COLOR font:FONT10 textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:overdueLabel];
        self.overdueLabel = overdueLabel;
    }
    if (!self.addressLabel) {
        UILabel *addressLabel = [UILabel LXLabelWithTextNoFrame:@"深圳 南山" textColor:VISIT_TITLE_COLOR backgroundColor:RECYCLE_BACK_COLOR font:FONT10 textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:addressLabel];
        self.addressLabel = addressLabel;
    }
    if (!self.releationshipLbl) {
        UILabel *releationshipLbl = [UILabel LXLabelWithTextNoFrame:@"本人" textColor:VISIT_TITLE_COLOR backgroundColor:RECYCLE_BACK_COLOR font:FONT10 textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:releationshipLbl];
        self.releationshipLbl = releationshipLbl;
        self.releationshipLbl.hidden = YES;
    }
    if (!self.distributionLbl) {
        // title描述
        UILabel *distributionLbl = [UILabel LXLabelWithTextNoFrame:@"分配时间： 20190809 12:30" textColor:DEBIT_COLOR backgroundColor:ClearColor font:FONT12 textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:distributionLbl];
        self.distributionLbl = distributionLbl;
    }
    if (!self.collectStatusLbl) {
        // title描述
        UILabel *collectStatusLbl = [UILabel LXLabelWithTextNoFrame:@"/ 回收前状态" textColor:ORANGE_SUB_COLOR backgroundColor:ClearColor font:FONT10 textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:collectStatusLbl];
        self.collectStatusLbl = collectStatusLbl;
    }
    if (!self.overDayLbl) {
        // title描述
        NSArray *array = @[@"待外访",@"外访中"];
        UILabel *overDayLbl = [UILabel LXLabelWithTextNoFrame:array[arc4random()%2] textColor:ORANGE_SUB_COLOR backgroundColor:ClearColor font:FONT12 textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:overDayLbl];
        self.overDayLbl = overDayLbl;
    }
}
// 2. 布局子视图
-(void)layoutSubviews{
    [super layoutSubviews];
    [self makeConstraintFrom];
}
-(void)makeConstraintFrom{
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top)
        .offset(10);
        make.left.mas_equalTo(self.contentView.mas_left)
        .offset(10*Iphone6ScaleWidth);
        make.height.mas_equalTo(23);
    }];
    [self.circleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(6*Iphone6ScaleWidth);
        make.left.mas_equalTo(self.nameLabel.mas_right)
        .offset(14*Iphone6ScaleWidth);
        make.centerY.mas_equalTo(self.nameLabel.mas_centerY);
    }];

    [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nameLabel.mas_centerY);
        make.height.mas_equalTo(19);
        make.left.mas_equalTo(self.circleImage.mas_right)
        .offset(7*Iphone6ScaleWidth);
    }];
    [self.sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.ageLabel.mas_centerY);
        make.height.mas_equalTo(17);
        make.left.mas_equalTo(self.ageLabel.mas_right)
        .offset(11*Iphone6ScaleWidth);
    }];
    [self.arrearsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom)
        .offset(2);
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.height.mas_equalTo(17);
    }];
    [self.overdueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.top.mas_equalTo(self.arrearsLabel.mas_bottom)
        .offset(12);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(67*Iphone6ScaleWidth);
    }];
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        CGSize titleSize = [self.addressLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:FONT10} context:nil].size;
        make.centerY.mas_equalTo(self.overdueLabel.mas_centerY);
        make.left.mas_equalTo(self.overdueLabel.mas_right)
        .offset(12);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo((titleSize.width +24)*Iphone6ScaleWidth);
    }];
    [self.releationshipLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        CGSize titleSize = [self.releationshipLbl.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:FONT10} context:nil].size;
        make.centerY.mas_equalTo(self.addressLabel.mas_centerY);
        make.left.mas_equalTo(self.addressLabel.mas_right)
        .offset(12);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo((titleSize.width +24)*Iphone6ScaleWidth);
    }];
    [self.distributionLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.top.mas_equalTo(self.overdueLabel.mas_bottom)
        .offset(6);
        make.height.mas_equalTo(17);
        make.right.mas_equalTo(self.contentView.mas_right)
        .offset(-12);
    }];
    [self.collectStatusLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right)
        .offset(-6);
        make.top.mas_equalTo(self.contentView.mas_top)
        .offset(18);
        make.height.mas_equalTo(13);
    }];
    [self.overDayLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.collectStatusLbl.mas_left)
        .offset(-1);
        make.top.mas_equalTo(self.contentView.mas_top)
        .offset(14);
        make.height.mas_equalTo(17);
    }];
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
