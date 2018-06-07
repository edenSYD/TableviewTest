//
//  HXQRefreshHeader.h
//  HXQRefresh
//
//  Created by Tiny on 2017/12/22.
//  Copyright © 2017年 hxq. All rights reserved.
//

#import "MJRefreshGifHeader.h"

@interface HXQRefreshHeader : MJRefreshGifHeader


/**
 快速创建一个HeaderRefesh 隐藏时间 刷新状态

 @param refreshingBlock MJRefreshComponentRefreshingBlock
 @return HXQRefreshHeader
 */
+(instancetype)hxqHeaderWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;

@end
