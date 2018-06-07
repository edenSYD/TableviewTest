//
//  LESCustomLineDetailModel.m
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/10.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  公交专线线路详情模型

#import "LESCustomLineDetailModel.h"

@implementation LESCustomLineDetailModel
// 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{
             @"IncrementId": @"id",
             @"startStation":@"startstation"
             };
}

@end
