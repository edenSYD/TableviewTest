//
//  HXQRefreshFooter.m
//  HXQRefresh
//
//  Created by Tiny on 2017/12/22.
//  Copyright © 2017年 hxq. All rights reserved.
//

#import "HXQRefreshFooter.h"

@implementation HXQRefreshFooter

+(instancetype)hxqFooterWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    HXQRefreshFooter *footer = [HXQRefreshFooter footerWithRefreshingBlock:refreshingBlock];
    footer.refreshingTitleHidden = YES;
    //[footer setTitle:@"下拉花去数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"哥这下真没了！" forState:MJRefreshStateNoMoreData];
    return footer;
}

#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 19; i<=63; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_two_000%02zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages duration:refreshingImages.count*0.04 forState:MJRefreshStateRefreshing];
}

@end
