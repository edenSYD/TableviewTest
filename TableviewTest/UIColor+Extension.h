//
//  UIColor+Extension.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/2/7.
//  Copyright © 2018年 MuJin. All rights reserved.
//   16进制颜色设置

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 16进制颜色设置
 @param stringToConvert 颜色字符串
 @return UIClor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
+(UIColor *) hexStringToColor: (NSString *) stringToConvert andAlpha:(CGFloat)alpha;

+(UIColor *)defaultBackGroundColor;
+(UIColor *)commonBackGroundColor;
+(UIColor *)defaultTitleWordColor;
+(UIColor *)defaultContentWordColor;
@end
