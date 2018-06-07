//
//  SYDRecycleController.m
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/3/20.
//  Copyright © 2018年 MuJin. All rights reserved.
//任务回收详情

#import "SYDRecycleController.h"
#import "SYDRecycleCell.h"
static NSString *RECYCLE = @"SYDRecycleCell";

@interface SYDRecycleController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataList;
@property(nonatomic,strong) UIView *aniView;
@property(nonatomic,assign) NSInteger page;
@end

@implementation SYDRecycleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    //[self setReplicatorLayerType:YUReplicatorLayerRound];
}
#pragma mark -----------------------  各种CAReplicatorLayer的动画

-(void)initUI{
//    self.ContentStyle = UITableViewStylePlain;
//    self.navigationItem.title = @"任务回收详情";
//    self.view.backgroundColor = Mine_INFO_COLOR;
//    self.tableView.backgroundColor = Mine_INFO_COLOR;
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    self.tableView.scrollEnabled = YES;
//    self.tableView.showsVerticalScrollIndicator = false;
//    self.tableView.showsHorizontalScrollIndicator = false;
//    [self.tableView addRoundedCorners:UIRectCornerAllCorners withRadii:CGSizeMake(5, 5)];
//    [self.view addSubview:self.tableView];
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.view.mas_top)
//        .offset(10);
//        make.left.mas_equalTo(self.view.mas_left)
//        .offset(8);
//        make.right.mas_equalTo(self.view.mas_right)
//        .offset(-8);
//        make.bottom.mas_equalTo(self.view.mas_bottom);
//    }];
//    self.tableView.rowHeight = 114;
//    [self.tableView registerClass:[SYDRecycleCell class] forCellReuseIdentifier:RECYCLE];
}
- (void)refreshHeader {
    self.page = 0;
    [self.dataList removeAllObjects];
    [self getRecycleDataFromServer];
}

- (void)refreshFooter {
    [self getRecycleDataFromServer];
}
#pragma 获取信息
////模拟加载数据
//- (void)reloadData {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if (_page < 3) {//模拟加载数据,设置只能加载3页
//            for (NSInteger i = 0; i < 20; i ++) {
//                NSString *testStr = [NSString stringWithFormat:@"第%ld页数据",(long)_page];
//                [_testDatas addObject:testStr];
//            }
//            _page ++;
//        }
//        [self endRefresh];
//    });
//}
-(void)getRecycleDataFromServer{
    
}
- (void)endRefresh {
//    [self.tableView reloadData];
//    [self.tableView.mj_header endRefreshing];
//    [self.tableView.mj_footer endRefreshing];
}
#pragma mark---UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SYDRecycleCell *cell = [tableView
                            dequeueReusableCellWithIdentifier:RECYCLE
                            forIndexPath:indexPath];
    if (!cell) {
        cell = [[SYDRecycleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RECYCLE];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark 此方法加上是为了适配iOS 11出现的问题
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    return nil;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    return nil;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return CGFLOAT_MIN;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return CGFLOAT_MIN;
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end







