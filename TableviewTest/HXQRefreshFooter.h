//
//  HXQRefreshFooter.h
//  HXQRefresh
//
//  Created by Tiny on 2017/12/22.
//  Copyright © 2017年 hxq. All rights reserved.
//

#import "MJRefreshAutoGifFooter.h"

@interface HXQRefreshFooter : MJRefreshAutoGifFooter

/**
 快速创建一个FooterRefesh 隐藏时间 刷新状态
 
 @param refreshingBlock MJRefreshComponentRefreshingBlock
 @return HXQRefreshFooter
 */
+(instancetype)hxqFooterWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;


@end
