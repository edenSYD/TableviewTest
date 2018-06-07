//
//  SYDNoticeMessage.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/3/20.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYDMessageNoticeCell.h"
#import "SYDNoticeModel.h"
static NSString *NOTICEID = @"SYDMessageNoticeCell";

typedef void(^SelectedBlock)(NSIndexPath * indexPath,SYDNoticeModel *noticeModel);

@interface SYDNoticeMessage : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, copy) SelectedBlock selectedBlock;

@property (nonatomic, strong) SYDNoticeModel *noticeModel;

@end
