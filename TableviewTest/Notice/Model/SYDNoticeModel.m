

//
//  SYDNoticeModel.m
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/3/20.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#import "SYDNoticeModel.h"

@implementation SYDNoticeModel
// 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ID" : @"id"
             };
}
@end
