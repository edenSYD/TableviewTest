//
//  YMNetworkTool.m
//  LantaiyuanBus
//
//  Created by lantaiyuan on 16/8/5.
//  Copyright © 2016年 youmy. All rights reserved.

//  网络

#import "YMNetworkTool.h"


@implementation YMNetworkTool
static YMNetworkTool *_manager;
+ (instancetype)shareTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [YMNetworkTool manager];
        // 设置超时时间
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", @"application/javascript", @"text/js", nil];
        
        [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _manager.requestSerializer.timeoutInterval = 5.0f;
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    });
    return _manager;
}

#pragma mark---一期请求增加参数 (Status)
- (void)kGET:(NSString *)URLString
  parameters:(nullable id)parameters
      status:(BOOL)status
     success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
     failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure{
    
    NSLog(@"-->链接:%@?%@",URLString,parameters);
    NSString *urlStr = [NSString stringWithFormat:@"%@?%@",URLString,parameters];
    [self GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"status"] integerValue] == 200||responseObject[@"success"]) {
            success(task,responseObject);
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
            });
            failure(task, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error:%@",error.description);
        
        if (error.code == -1001) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
            });
        }
        failure(task, error);
    }];
}


#pragma mark - shj
/** 消息通知列表模块  */
- (void)getAllNewsWithUserID:(NSString *)userId
                        page:(NSString *)page
                        rows:(NSString *)rows
                    cityCode:(NSString *)cityCode
                     version:(NSString *)version
                     success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    NSString *urlStr = @"http://39.108.114.11/ebus-custom/news/getAllNews";
    //设置请求体
    NSString *params = [NSString stringWithFormat:@"userId=%@&page=%@&rows=%@&cityCode=%@&version=%@",userId,page,rows,cityCode,version];
    [self kGET:urlStr parameters:params status:YES success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
        failure(task,error);
    }];
}

@end


