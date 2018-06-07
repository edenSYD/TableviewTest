//
//  Macros.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/2/7.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#import "ColorMacros.h"
#import "DeviceMacros.h"
#import "EnumMacros.h"
#import "NotificationMacros.h"
#import "UtilsMacros.h"
#define ReplaceRootViewController(vc) [[AppDelegate shareAppDelegate] replaceRootViewController:vc]
#define FONT10 FONT(@"PingFangSC-Regular", 10)
#define FONT11 FONT(@"PingFangSC-Regular", 11)
#define FONT12 FONT(@"PingFangSC-Regular", 12)
#define FONT13 FONT(@"PingFangSC-Regular", 13)
#define FONT14 FONT(@"PingFangSC-Regular", 14)
#define FONT15 FONT(@"PingFangSC-Regular", 15)
#define FONT16 FONT(@"PingFangSC-Regular", 16)
#define FONT17 FONT(@"PingFangSC-Regular", 17)
#define FONT18 FONT(@"PingFangSC-Regular", 18)
#define FONT19 FONT(@"PingFangSC-Regular", 19)
#define FONT20 FONT(@"PingFangSC-Regular", 20)
#pragma mark - ——————— 用户相关 ————————

#define kDefaultLocationZoomLevel       18
#define kDefaultControlMargin           22
#define LocationTimeout 10  //   定位超时时间，可修改，最小2s
#define ReGeocodeTimeout 5 //   逆地理请求超时时间，可修改，最小2s
const static NSString *kAMapKey = @"4d70abc3571bcbe8b2ad256095870735";
#define ISPOSITIONING  @"isPositioning"
#define LOCATION_CITY @"location_city"// 定位城市名称
#define LOCATION_ADCODE @"location_adCode"//定位城市code
#define SelectCity @"select_City"//选择城市
//唯一标示
#define Device_uuid @"uuid"
#define Current_Device @"current_device"
// 用户经度
#define USER_LONGITUDE @"user_logitude"
// 用户纬度
#define USER_LATITUDE @"user_latitude"

#endif /* Macros_h */
