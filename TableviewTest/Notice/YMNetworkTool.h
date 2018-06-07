//
//  YMNetworkTool.h
//  LantaiyuanBus
//
//  Created by lantaiyuan on 16/8/5.
//  Copyright © 2016年 youmy. All rights reserved.

//  网络

#import <AFNetworking/AFNetworking.h>

@interface YMNetworkTool : AFHTTPSessionManager

/**
 单例入口
 */
+ (instancetype)shareTool;


#pragma mark - shj
/** 消息通知列表模块  */
- (void)getAllNewsWithUserID:(NSString *)userId
                        page:(NSString *)page
                        rows:(NSString *)rows
                             cityCode:(NSString *)cityCode
                              version:(NSString *)version
                              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end

