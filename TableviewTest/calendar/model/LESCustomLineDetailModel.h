//
//  LESCustomLineDetailModel.h
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/10.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  公交专线线路详情模型

#import <Foundation/Foundation.h>

@interface LESCustomLineDetailModel : NSObject

@property (nonatomic, copy) NSString *routeId;//线路id

@property (nonatomic, copy) NSString *stationId;//站点id

@property (nonatomic, copy) NSString *stationFlag;//

@property (nonatomic, copy) NSString *longitudeOut;//出站经度

@property (nonatomic, copy) NSString *longitude;//经度

@property (nonatomic, copy) NSString *stationStatus;//

@property (nonatomic, copy) NSString *latitude;//纬度

@property (nonatomic, copy) NSString *cityCode;//城市编码

@property (nonatomic, copy) NSString *stationNo;//站点序号

@property (nonatomic, copy) NSString *latitudeIn;//进站纬度

@property (nonatomic, copy) NSString *latitudeOut;//出站纬度

@property (nonatomic, copy) NSString *longitudeIn;//进站经度

@property (nonatomic, copy) NSString *distance;//距离

@property (nonatomic, copy) NSString *name;//站点名称
@end
