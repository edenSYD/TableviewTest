//
//  HXQRefreshHeader.m
//  HXQRefresh
//
//  Created by Tiny on 2017/12/22.
//  Copyright © 2017年 hxq. All rights reserved.
//

#import "HXQRefreshHeader.h"


@implementation HXQRefreshHeader

#pragma mark - Private
+(instancetype)hxqHeaderWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    HXQRefreshHeader *header = [HXQRefreshHeader headerWithRefreshingBlock:refreshingBlock];
    header.stateLabel.hidden = NO;
    header.lastUpdatedTimeLabel.hidden = NO;
    return header;
}


#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSInteger i = 0; i<=18; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_one_000%02zd", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 19; i<=63; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_two_000%02zd", i]];
        [refreshingImages addObject:image];
    }
//    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages duration:0.04*refreshingImages.count forState:MJRefreshStateRefreshing];
}

@end
