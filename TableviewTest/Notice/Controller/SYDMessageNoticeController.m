//
//  SYDMessageNoticeController.m
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/3/20.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#import "SYDMessageNoticeController.h"
#import "SYDNoticeMessage.h" //viewModel
#import "SYDMessageNoticeCell.h"
static NSString *NOTICE = @"SYDMessageNoticeCell";
#import "SYDNoticeModel.h"

#import "SYDRecycleController.h"//任务回收
#import "HXQRefreshFooter.h"
#import "HXQRefreshHeader.h"
#import <AFNetworking.h>
#import "YMNetworkTool.h"
#import "LESCalendarViewController.h"
@interface SYDMessageNoticeController ()

@property(nonatomic,strong)SYDNoticeMessage *noticeViewModel;
@property (nonatomic, strong) UITableView * tableView;
@property (assign, nonatomic) int page;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation SYDMessageNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self noticeUI];
    //header refresh
    WEAKSELF
    self.tableView.mj_header  = [HXQRefreshHeader hxqHeaderWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf loadData:NO];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [HXQRefreshFooter hxqFooterWithRefreshingBlock:^{
        [weakSelf loadData:YES];
    }];
}

#pragma mark - Refresh
-(void)loadData:(BOOL)isMore{
    if (isMore) {
        self.page++;
    }else{//头部刷新
        self.page = 1;
        [self.dataArray removeAllObjects];//清空数据员
    }
    [[YMNetworkTool shareTool]getAllNewsWithUserID:@"3944" page:[NSString stringWithFormat:@"%d",self.page] rows:@"5" cityCode:@"130400" version:@"1.4.6" success:^(NSURLSessionDataTask *task, id responseObject) {
        //NSLog(@"----%@",responseObject);
        if (isMore) {
            [self.tableView.mj_footer endRefreshing];
        }else{
            [self.tableView.mj_header endRefreshing];
        }
        NSDictionary *dict = responseObject[@"obj"];
        if ([responseObject[@"statusCode"]integerValue] == 200) {
            NSArray *listArr = [SYDNoticeModel mj_objectArrayWithKeyValuesArray:dict[@"rows"]];
           // NSLog(@"---%@",[arr mj_JSONString]);
            if (!isMore) {
                [self.dataArray removeAllObjects];
            }
            if (listArr.count < 5) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
            [self.dataArray addObjectsFromArray:listArr];
            self.noticeViewModel.dataSource = self.dataArray;
            [self.tableView reloadData];
        }else{
            [self.tableView reloadData];
        }
        NSLog(@"---------");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (isMore) {
            [self.tableView.mj_footer endRefreshing];
        }else{
            [self.tableView.mj_header endRefreshing];
        }
        [self.tableView reloadData];
    }];

}

-(void)noticeUI{
    self.navigationItem.title = @"消息通知";
    self.view.backgroundColor = Mine_INFO_COLOR;
    self.tableView.delegate = self.noticeViewModel;
    self.tableView.dataSource = self.noticeViewModel;
    self.noticeViewModel.tableView = self.tableView;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 80;
    //1.iOS 11上面废除了automaticallyAdjustsScrollViewInsets，以前的代码有的会下滑64
    [self.tableView registerClass:[SYDMessageNoticeCell class] forCellReuseIdentifier:NOTICEID];
    WEAKSELF
    self.noticeViewModel.selectedBlock = ^(NSIndexPath *indexPath, SYDNoticeModel *noticeModel) {
        LESCalendarViewController *vc = [[LESCalendarViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
}
#pragma mark  =============LAZY=================
-(SYDNoticeMessage *)noticeViewModel{
    if (!_noticeViewModel) {
        _noticeViewModel = [[SYDNoticeMessage alloc]init];
    }
    return _noticeViewModel;
}
/**
 *  懒加载UITableView
 *
 *  @return UITableView
 */
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        _tableView.backgroundColor = Mine_INFO_COLOR;
        _tableView.scrollEnabled = YES;
#ifdef __IPHONE_11_0
        if ([_tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            if (@available(iOS 11.0, *)) {
                _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            } else {
                // Fallback on earlier versions
            }
        }
#endif
    }
    return _tableView;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

    








