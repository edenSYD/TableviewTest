//
//  ColorMacros.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/2/7.
//  Copyright © 2018年 MuJin. All rights reserved.
//  颜色设置

#ifndef ColorMacros_h
#define ColorMacros_h
#import "UIColor+Extension.h"
//获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define ClearColor [UIColor clearColor]
#define RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define KClearColor [UIColor clearColor]
#define KWhiteColor [UIColor whiteColor]
#define KBlackColor [UIColor blackColor]
#define KGrayColor [UIColor grayColor]
#define KGray2Color [UIColor lightGrayColor]
#define KBlueColor [UIColor blueColor]
#define KRedColor [UIColor redColor]
//导航栏颜色
#define NAV_BAR_COLOR [UIColor colorWithHexString:@"#53CAC3"]
// 导航栏标题颜色
#define NAV_TITLE_COLOR [UIColor colorWithHexString:@"#FFFFFF"]
// 背景色
#define BG_COLOR [UIColor colorWithHexString:@"#F5F5F6"]
#define VISIT_SEP_COLOR [UIColor colorWithHexString:@"#E5E5E5"]
// 标题颜色
#define TITLE_COLOR [UIColor colorWithHexString:@"#454545"]
// 副标题颜色
#define SUB_TITLE_COLOR [UIColor colorWithHexString:@"#818181"]
//userinfoColor
#define Mine_SUBTITLE_COLOR [UIColor colorWithHexString:@"#BCBCBC"]
//个人资料
#define Mine_INFO_COLOR [UIColor colorWithHexString:@"#E9EFEF"]
#define Mine_INFOTITLE_COLOR [UIColor colorWithHexString:@"#0F0F0F"]
#define Mine_INFOSUBTITLE_COLOR [UIColor colorWithHexString:@"#AAAAAA"]
#define PLACEHOLD_COLOR [UIColor colorWithHexString:@"#8E8E93"]
// 分隔线颜色
#define SEPARATE_LINE_COLOR [UIColor colorWithHexString:@"#DFDFE4"]
//orange
#define ORANGE_COLOR [UIColor colorWithHexString:@"#FD887D"]
#define ORANGE_SUB_COLOR [UIColor colorWithHexString:@"#FFA42F"]
//主标题
#define REMINDER_TIME_COLOR [UIColor colorWithHexString:@"#222222"]
#define RESER_COLOR [UIColor colorWithHexString:@"#333333"]
#define DEBIT_COLOR [UIColor colorWithHexString:@"#666666"]
#define VISIT_TITLE_COLOR [UIColor colorWithHexString:@"#999999"]
#define RECYCLE_TITLE_COLOR [UIColor colorWithHexString:@"#9A9A9A"]
#define RECYCLE_BACK_COLOR [UIColor colorWithHexString:@"#EFEEEB"]
#define NOTICE_TITLE_COLOR [UIColor colorWithHexString:@"#CFCFCF"]
#define RESER_SUB_COLOR [UIColor colorWithHexString:@"#585C64"]
//上传按钮颜色
#define RESET_SEP_COLOR [UIColor colorWithHexString:@"#D7D9DB"]
//segment color
#define SUPPORT_COLOR [UIColor colorWithHexString:@"#797979"]
#define C_COLOR [UIColor hexStringToColor:@"#8C8C8C"]

#define RED_COLOR [UIColor colorWithHexString:@"#E51C23"]
#define REMAIND_BACK_COLOR [UIColor colorWithHexString:@"#FAFAFC"]
#define CF_COLOR [UIColor hexStringToColor:@"#CFCFCF"]
#define B_FIVE_COLOR [UIColor hexStringToColor:@"#B5B5B5"]

#define OUTBORDER_UNSELECTCOLOR [UIColor colorWithHexString:@"#BBBBBD"]
#endif /* ColorMacros_h */
