//
//  SYDMessageNoticeCell.m
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/3/20.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#import "SYDMessageNoticeCell.h"
#import "UILabel+LXLabel.h"
#import "ColorMacros.h"
@interface SYDMessageNoticeCell()

@property (strong, nonatomic)  UIImageView *leftImageView;
@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UILabel *noticeTimeLabel;
@property (strong, nonatomic)  UIImageView *jumpImage;
@property (strong, nonatomic)  UILabel *detailMessageLabel;

@end
@implementation SYDMessageNoticeCell
-(void)setModel:(SYDNoticeModel *)model{
    _model = model;
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:@"https://192.168.10.5:2061/mobile/data/download?path=img_path/119/98172dd4-633c-4dd1-bfb4-7cf29dcc0897.jpg"] placeholderImage:IMAGE_NAMED(@"notice")];
    //通知类型(1-签到通知 2-数据上传 3-任务回收 4-任务分配)
    if ([model.notice_type isEqualToString:@"4"]) {
//        self.leftImageView.image = IMAGE_NAMED(@"notice");
        self.titleLabel.text = @"任务分配";
    }else if ([model.notice_type isEqualToString:@"3"]){
//        self.leftImageView.image = IMAGE_NAMED(@"notice");
        self.titleLabel.text = @"任务回收";
    }else if ([model.notice_type isEqualToString:@"2"]){
//        self.leftImageView.image = IMAGE_NAMED(@"notice");
        self.titleLabel.text = @"数据上传";
    }else if ([model.notice_type isEqualToString:@"1"]){
//        self.leftImageView.image = IMAGE_NAMED(@"notice");
        self.titleLabel.text = @"签到通知";
    }
    self.noticeTimeLabel.text = model.createTime;
    
    self.detailMessageLabel.text = model.content;
}
//1.初始化子视图
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configMessageNoticeCell];
    }
    return self;
}
-(void)configMessageNoticeCell{
    if (!self.leftImageView) {
        // 头像
        UIImageView *leftImageView = [[UIImageView alloc] initWithImage:IMAGE_NAMED(@"notice")];
        [self.contentView addSubview:leftImageView];
        self.leftImageView = leftImageView;
    }
    if (!self.titleLabel) {
        // title描述
        UILabel *titleLabel = [UILabel LXLabelWithTextNoFrame:@"任务分配" textColor:TITLE_COLOR backgroundColor:ClearColor font:FONT14 textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    if (!self.noticeTimeLabel) {
        // title描述
        UILabel *noticeTimeLabel = [UILabel LXLabelWithTextNoFrame:@"2019-09-23 12:30" textColor:SUB_TITLE_COLOR backgroundColor:ClearColor font:FONT12 textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:noticeTimeLabel];
        self.noticeTimeLabel = noticeTimeLabel;
    }
    if (!self.detailMessageLabel) {
        // title描述
        UILabel *detailMessageLabel = [UILabel LXLabelWithTextNoFrame:@"您被分配十单外访任务，外访地区为深圳市南山区…" textColor:SUB_TITLE_COLOR backgroundColor:ClearColor font:FONT12 textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:detailMessageLabel];
        self.detailMessageLabel = detailMessageLabel;
    }
    if (!self.jumpImage) {
        // 头像
        UIImageView *jumpImage = [[UIImageView alloc] initWithImage:IMAGE_NAMED(@"upload_arrow")];
        [self.contentView addSubview:jumpImage];
        self.jumpImage = jumpImage;
    }
}
// 2. 布局子视图
-(void)layoutSubviews{
    [super layoutSubviews];
    [self makeConstraintFrom];
}
-(void)makeConstraintFrom{
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(45);
        make.left.mas_equalTo(self.contentView.mas_left)
        .offset(17);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top)
        .offset(8);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(self.leftImageView.mas_right)
        .offset(14*Iphone6ScaleWidth);
        make.width.mas_equalTo(58*Iphone6ScaleWidth);
    }];
    [self.noticeTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom)
        .offset(4);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(self.leftImageView.mas_right)
        .offset(13*Iphone6ScaleWidth);
    }];
    [self.jumpImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(10);
        make.right.mas_equalTo(self.contentView.mas_right)
        .offset(-12);
    }];
    [self.detailMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.noticeTimeLabel.mas_bottom)
        .offset(1);
        make.left.mas_equalTo(self.leftImageView.mas_right)
        .offset(13*Iphone6ScaleWidth);
        make.right.mas_equalTo(self.contentView.mas_right)
        .offset(-12);
        make.height.mas_equalTo(20);
    }];
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
