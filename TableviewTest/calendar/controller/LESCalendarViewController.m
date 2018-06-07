//
//  LESCalendarViewController.m
//  LantaiyuanBus
//
//  Created by Leslie on 16/11/1.
//  Copyright © 2016年 lantaiyuan. All rights reserved.

//  购票日历

#import "LESCalendarViewController.h"

#import "LESCalendarMonthLayout.h"
#import "LESCalendarMonthHeaderView.h"
#import "LESCalendarDayCell.h"
#import "LESCalendarFooterView.h"

#import "LESCalendarDayModel.h"

@interface LESCalendarViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *cellDict;//cell字典

@property (nonatomic, strong) NSMutableArray *dateBookArr;//已订票数组

@property (nonatomic, strong) NSMutableArray *soldArr;//票已售完(无票)日期数组

@property (nonatomic, strong) NSMutableArray *dateArr;//可买票(有票且未订)日期数组

@property (nonatomic, strong) NSMutableArray *modelArr;//可买票的模型数组

@property (nonatomic, strong) NSMutableArray *dateModelArr;//有票日期模型数组

@property (nonatomic, copy) NSString *dateString;//日期

@property (nonatomic, copy) NSString *orderNo;//后台返回订单号

@property (nonatomic, assign) BOOL isPass;//是否已通过(得到订单号)

@end

@implementation LESCalendarViewController

static NSString *MonthHeader = @"MonthHeaderView";

static NSString *DayCell = @"DayCell";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self initData];
        [self initView];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //    self.selectDay = 0;
    
    //    self.selectPrice = 0;
    
    //查询某专线可购票数的基本信息接口
    [self queryCustomLineBusTicket];
    
    [self initFooterView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    //    self.selectDay = 0;
    
    //    self.selectPrice = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = ORANGE_COLOR;
    
    [self navigationBarHandle];
    
    [self initFooterView];
    
    //    self.selectDay = 0;
    
    //    self.selectPrice = 0;
    
    self.isPass = NO;
    
    //设置日历天数62天(当月日期后两个月)
    [self setToDay:62 ToDateforString:nil];
    
    //通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(pushPay) name:@"sureBtnClick" object:nil];
    
    [center addObserver:self selector:@selector(pushToTicketRules) name:@"ticketRules" object:nil];
}

#pragma mark - 导航栏

- (void)navigationBarHandle{
    // 导航栏返回按钮
}

#pragma mark - 购票/退票规则
- (void)pushToTicketRules{
}

#pragma mark - 初始化UI
- (void)initView{
    
    [self setTitle:@"选择日期"];
    
    LESCalendarMonthLayout *layout = [[LESCalendarMonthLayout alloc]init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SYDTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - 100 - SYDTopHeight) collectionViewLayout:layout]; //初始化网格视图大小
    
    [self.collectionView registerClass:[LESCalendarDayCell class] forCellWithReuseIdentifier:DayCell];//cell重用设置ID
    
    [self.collectionView registerClass:[LESCalendarMonthHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MonthHeader];
    
    self.collectionView.allowsMultipleSelection =YES;//允许多选
    
    self.collectionView.bounces = NO;//将网格视图的下拉弹簧效果关闭
    
    self.collectionView.delegate = self;//实现网格视图的delegate
    
    self.collectionView.dataSource = self;//实现网格视图的dataSource
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - 设置FooterView
- (void)initFooterView{
    LESCalendarFooterView *footerView = [[LESCalendarFooterView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100)];
    footerView.backgroundColor = BG_COLOR;
    
    [self.view addSubview:footerView];
}

#pragma mark - 查询某专线可购票数的基本信息接口
- (void)queryCustomLineBusTicket{
    

//
//                         [weakSelf.dateModelArr addObject:dateModel];
//
//                         if ([dateModel.isbooked isEqualToString:@"0"]) {
//                             //没有预订过
//                             if ([dateModel.remainticketnum intValue] > 0) {
//                                 //剩余票数大于0的(没卖完,有票剩余,可买)
//                                 [weakSelf.modelArr addObject:dateModel];
//
//                                 [weakSelf.dateArr addObject:dateModel.serverdate];
//                             }else{
//                                 //剩余票数小于等于0的(卖完的,无票剩余,不可买)
//                                 [weakSelf.soldArr addObject:dateModel];
//                             }
//
//                         }else{
//                             //预订过
//                             [weakSelf.dateBookArr addObject:dateModel.serverdate];
//                         }
//                     }];
//
//                     //                                                                                NSLog(@"可买票的日期数组:%@",weakSelf.dateArr);
//                     [weakSelf.dateArr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                         //                                                                                    NSLog(@"遍历可买票日期数组得到的日期:%@",obj);
//                     }];
//
//                     [weakSelf.dateBookArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                         //                                                                                    NSLog(@"遍历已购票日期数组得到的日期:%@",obj);
//                     }];
//
//                     [weakSelf.modelArr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(LESCalendarDayModel *dateModel, NSUInteger idx, BOOL * _Nonnull stop) {
//                         //                                                                                    NSLog(@"遍历可买票的模型属性-日期:%@,时间:%@,价格:%@,剩余票数:%@,是否已买过:%@",dateModel.serverdate,dateModel.servertime,dateModel.price,dateModel.remainticketnum, dateModel.isbooked);
//                     }];
//
//                 }
//
//             }else{
//                 NSLog(@"查询某专线可购票数的基本信息接口返回数据错误");
//             }
//
//             [self.collectionView reloadData];
//         } @catch (NSException *exception) {
//             NSLog(@"exception:%@_%@",exception.reason,exception.userInfo);
//         } @finally {
//
//         }
//
//     } failure:^(NSURLSessionDataTask *task, NSError *error) {
//         NSLog(@"查询某专线可购票数的基本信息接口失败的error:%@",error);
//
//     }];
}

#pragma mark - CollectionView代理方法
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.calendarMonth.count;
}


//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *monthArray = [self.calendarMonth objectAtIndex:section];
    
    return monthArray.count;
}


//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 每次先从字典中根据IndexPath取出唯一标识符
    NSString *identifier = [self.cellDict objectForKey:[NSString stringWithFormat:@"%@", indexPath]];
    // 如果取出的唯一标示符不存在，则初始化唯一标示符，并将其存入字典中，对应唯一标示符注册Cell
    if (identifier == nil) {
        identifier = [NSString stringWithFormat:@"%@%@", DayCell, [NSString stringWithFormat:@"%@", indexPath]];
        [self.cellDict setValue:identifier forKey:[NSString stringWithFormat:@"%@", indexPath]];
        // 注册Cell
        [self.collectionView registerClass:[LESCalendarDayCell class]  forCellWithReuseIdentifier:identifier];
    }
    
    LESCalendarDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //防止cell复用带来的控件重叠
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    NSMutableArray *monthArray = [self.calendarMonth objectAtIndex:indexPath.section];
    
    LESCalendarDayModel *model = [monthArray objectAtIndex:indexPath.row];

    
    cell.model = model;
    
    //    NSLog(@"每个cell的日期:%@ -- 每个cell的indexPath:%@ -- 每个cell是否被选中:%d",[model toString],indexPath,model.isSelected);
    
    //    if (self.optiondayArray.count > 0 && [self.optiondayArray containsObject:[model toString]] && model.style == 2) {
    //说明有选中数组,应该有选中状态的cell与之对应
    if (model.isSelected == YES && model.style == 2) {
        
        cell.day_lab.textColor =  KWhiteColor;
        
        cell.backgroundColor =  ORANGE_COLOR;
        
        cell.priceLabel.textColor =  KWhiteColor;
        
        cell.ticketLabel.textColor =  KWhiteColor;
        
    }else{
        
        if ([self.dateArr containsObject:[model toString]] ) {
            
            for (int i = 0; i < self.dateArr.count; ++i) {
                
                if ([self.dateArr[i] isEqualToString:[model toString]] && model.style == 2) {
                    //日期有票
                    if (self.modelArr.count > 0 ) {
                        //有可买票数组
                        
                        LESCalendarDayModel *dayModel = self.modelArr[i];
                        
                        cell.price = dayModel.price;
                        cell.priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[dayModel.price floatValue]];
                        
                        //                    self.dayPrice = [dayModel.price floatValue];
                        cell.ticketLabel.text = @"有票";
                        cell.ticketLabel.textColor = ORANGE_COLOR;
                        cell.backgroundColor = KWhiteColor;
                        cell.userInteractionEnabled = YES;
                        //                    NSLog(@"一一对应模型数组的序号:%d,日期:%@,票价:%@,indexPath:%@",i,dayModel.serverdate,cell.priceLabel.text,indexPath);
                    }
                    //                NSLog(@"有票的日期:%@,票价:%@,indexPath:%@",[model toString],cell.priceLabel.text,indexPath);
                }
            }
        }else if ([self.dateBookArr containsObject:[model toString]] && model.style == 2 ){
            //已订票
            cell.ticketLabel.text = @"已购";
            cell.ticketLabel.textColor = ORANGE_COLOR;
            cell.priceLabel.text = nil;
            cell.backgroundColor = KWhiteColor;
            cell.userInteractionEnabled = NO;
            //        NSLog(@"已购票的日期:%@,indexPath:%@",[model toString],indexPath);
            
        }else{
            //日期无票
            if (model.style == 2) {
                //未来日期
                cell.ticketLabel.text = @"无票";
                cell.ticketLabel.textColor = Mine_INFOSUBTITLE_COLOR;
                cell.priceLabel.text = nil;
                cell.backgroundColor = BG_COLOR;
                cell.userInteractionEnabled = NO;
                //            NSLog(@"无票的日期:%@,indexPath:%@",[model toString],indexPath);
            }
        }
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        NSMutableArray *month_Array = [self.calendarMonth objectAtIndex:indexPath.section];
        LESCalendarDayModel *model = [month_Array objectAtIndex:15];
        
        LESCalendarMonthHeaderView *monthHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MonthHeader forIndexPath:indexPath];
        monthHeader.masterLabel.text = [NSString stringWithFormat:@"%lu年 %lu月",(unsigned long)model.year,(unsigned long)model.month];//@"日期";
        monthHeader.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
        reusableview = monthHeader;
    }
    return reusableview;
    
}


- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSMutableArray *month_Array = [self.calendarMonth objectAtIndex:indexPath.section];
    
    LESCalendarDayModel *model = [month_Array objectAtIndex:indexPath.row];
    
    LESCalendarDayCell *cell = (LESCalendarDayCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (model.isSelected == YES) {
        
//        NSLog(@"此cell之前已被选中");
        
        model.isSelected = NO;
        
        [self initBlock];
        
        self.calendarblock(model);//传递模型到block
        
        [self removeArray];
        
        self.selectDay --;
        
        self.dayPrice = [cell.price floatValue];
        NSLog(@"转换后的当日票价:%f",self.dayPrice);
        self.selectPrice = self.selectPrice - self.dayPrice;
        NSLog(@"选中的总价格:%f",self.selectPrice);
        
        NSLog(@"显示的保存选中状态下的取消选中后选中的总天数:%d,选中的总价:%.2f",self.selectDay,self.selectPrice);
        //保存选中的总的天数
        //[YMSaveTool setInteger:self.selectDay forKey:@"CalendarSelectDay"];
        //保存选中的总价格
        //[YMSaveTool setFloat:self.selectPrice forKey:@"CalendarSelectPrice"];
        
        [self initFooterView];
        
        [self.collectionView reloadData];
        
    }else{
        
        model.isSelected = YES;
        
        [self.Logic selectLogic:model];
        
        [self initBlock];
        
        self.calendarblock(model);//传递模型到block
        
        [self addArray];
        
        //    NSLog(@"选中cell的indexPath:%@ == 选中状态:%d",indexPath,model.isSelected);
        
        [self updateCellStatus:cell selected:YES];
        
        self.selectDay ++;
        
        self.dayPrice = [cell.price floatValue];
        NSLog(@"转换后的当日票价:%f",self.dayPrice);
        self.selectPrice = self.selectPrice + self.dayPrice;
        NSLog(@"选中的总价格:%f",self.selectPrice);
        
        NSLog(@"显示的选中后选中的总天数:%d,选中的总价:%.2f",self.selectDay,self.selectPrice);
        //保存选中的总的天数
        //[YMSaveTool setInteger:self.selectDay forKey:@"CalendarSelectDay"];
        //保存选中的总价格
        //[YMSaveTool setFloat:self.selectPrice forKey:@"CalendarSelectPrice"];
        //刷新footerView
        [self initFooterView];
    }
}

//UICollectionView取消选中的方法
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray *month_Array = [self.calendarMonth objectAtIndex:indexPath.section];
    
    LESCalendarDayCell *cell = (LESCalendarDayCell *)[collectionView cellForItemAtIndexPath:indexPath ];
    
    LESCalendarDayModel *model = [month_Array objectAtIndex:indexPath.row];
    
    model.isSelected = NO;
    
    //    NSLog(@"取消选中cell的indexPath:%@ == 选中状态:%d",indexPath,model.isSelected);
    
    [self.Logic selectLogic:model];
    
    [self initBlock];
    
    self.calendarblock(model);//传递模型到block
    
    [self removeArray];
    
    [self updateCellStatus:cell selected:NO];
    
    self.selectDay --;
    
    self.dayPrice = [cell.price floatValue];
    NSLog(@"转换后的当日票价:%f",self.dayPrice);
    
    self.selectPrice = self.selectPrice - self.dayPrice;
    NSLog(@"选中的总价格:%f",self.selectPrice);
    
    NSLog(@"显示的取消选中后选中的总天数:%d,选中的总价:%.2f",self.selectDay,self.selectPrice);
    //保存选中的总的天数
    //[YMSaveTool setInteger:self.selectDay forKey:@"CalendarSelectDay"];
    //保存选中的总价格
    //[YMSaveTool setFloat:self.selectPrice forKey:@"CalendarSelectPrice"];
    
    [self initFooterView];
}

#pragma mark - 根据选中状态修改cell
-(void)updateCellStatus:(LESCalendarDayCell *)cell selected:(BOOL)selected
{
    
    
    cell.day_lab.textColor = selected ? KWhiteColor:SUB_TITLE_COLOR;
    
    cell.backgroundColor = selected ? ORANGE_COLOR:KWhiteColor;
    
    cell.priceLabel.textColor = selected ? KWhiteColor:ORANGE_COLOR;
    
    cell.ticketLabel.textColor = selected ? KWhiteColor:ORANGE_COLOR;
}

#pragma mark - 添加选中日期到日期数组
- (void)addArray{
    
    if(self.blockDays){
        [self.optiondayArray addObject:self.blockDays];
//        NSLog(@"存放日历选中日期数组:%@",self.optiondayArray);
    }
}

#pragma mark - 从日期数组中移除取消选中的日期
- (void)removeArray{
    
    if (self.blockDays) {
        [self.optiondayArray removeObject:self.blockDays];
//        NSLog(@"存放日历选中日期数组:%@",self.optiondayArray);
    }
}

#pragma mark - 初始化Block
- (void)initBlock{
    WEAKSELF
    self.calendarblock = ^(LESCalendarDayModel *model){
        NSLog(@"初始化block在日历上选择了:%@,字符串日期:%@",[model getWeek],[model toString]);
        weakSelf.blockDays = [model toString];
        
    };
}

#pragma mark - 日历逻辑代码
//获取时间段内的天数数组
- (NSMutableArray *)getMonthArrayOfDayNumber:(int)day ToDateforString:(NSString *)todate
{
    
    NSDate *date = [NSDate date];
    
    NSDate *selectdate  = [NSDate date];
    
    if (todate) {
        
        selectdate = [selectdate dateFromString:todate];
        
    }
    
    self.Logic = [[LESCalendarLogic alloc]init];
    
    return [self.Logic reloadCalendarView:date selectDate:selectdate  needDays:day];
}

#pragma mark - 根据天数设置日历
- (void)setToDay:(int)day ToDateforString:(NSString *)todate
{
    self.daynumber = day;
    
    self.calendarMonth = [self getMonthArrayOfDayNumber:self.daynumber ToDateforString:todate];
    [self.collectionView reloadData];//刷新
    
}

#pragma mark - 设置日历月份数组
-(void)initData{
    
    self.calendarMonth = [[NSMutableArray alloc]init];//每个月份的数组
    
}

#pragma mark - 设置标题

- (void)setCalendartitle:(NSString *)calendartitle
{
    
    [self.navigationItem setTitle:calendartitle];
    
}



#pragma mark - 跳转到支付页面
- (void)pushPay{
    
    //提交买票订单接口
    [self buyCustomLineBusTicket];
    
}

#pragma mark - 提交买票订单接口

- (void)buyCustomLineBusTicket{
    

//             
//             NSDictionary *dict = responseObject;
////             NSLog(@"提交买票订单接口成功的responseObject:%@",responseObject);
//             
//                 if ([responseObject[@"success"] isEqualToString:@"0000"]) {
//                     
//                     [YMSaveTool setValue:[NSString stringWithFormat:@"%.2f",self.selectPrice] forKey:@"specialLinePrice"];
//                     
//                     NSLog(@"%@",responseObject[@"msg"]);
//                     self.orderNo = [dict valueForKey:@"orderno"];
//                     NSLog(@"提交买票订单接口返回的订单号是:%@",self.orderNo);
//                     
//                     [YMSaveTool setValue:self.orderNo forKey:@"specialLineOrderNum"];
//                     self.isPass = YES;
//                     
//                     YMPayViewController *ymVC = [[YMPayViewController alloc]init];
//                     //                                                                       ymVC.selectDayArray = self.optiondayArray;
//                     ymVC.orderNum = self.orderNo;
//                     ymVC.isPass = self.isPass;
//                     
//                     [self.navigationController pushViewController:ymVC animated:YES];
//                     
//                 }else{
//                     NSLog(@"提交买票订单接口返回数据错误:%@",responseObject[@"msg"]);
//                    
////                         [SVProgressHUD displayErrorWithStatus:responseObject[@"msg"]];
//
//                     [SVProgressHUD displayInfoWithStatus:responseObject[@"msg"] time:2.0];
//                 }
//             
//         } @catch (NSException *exception) {
//             NSLog(@"exception:%@_%@",exception.reason,exception.userInfo);
//         } @finally {
//             
//         }
//     } failure:^(NSURLSessionDataTask *task, NSError *error) {
//         NSLog(@"提交买票订单接口的error:%@",error);
//         
//     }];
//    }else{
//        NSLog(@"提交买票订单接口有参数为空");
//        [SVProgressHUD displayErrorWithStatus:@"提交买票订单参数不正常,请稍后重试"];
//    }
}

#pragma mark - 移除通知
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - lazy
-(NSMutableArray *)dateBookArr{
    if (_dateBookArr == nil) {
        _dateBookArr = [NSMutableArray array];
    }
    return _dateBookArr;
}

-(NSMutableArray *)dateArr{
    if (_dateArr == nil) {
        _dateArr = [NSMutableArray array];
    }
    return _dateArr;
}

-(NSMutableArray *)optiondayArray{
    if (_optiondayArray == nil) {
        _optiondayArray = [NSMutableArray array];
    }
    return _optiondayArray;
}

-(NSMutableArray *)soldArr{
    if (_soldArr == nil) {
        _soldArr = [NSMutableArray array];
    }
    return _soldArr;
}

-(NSMutableArray *)modelArr{
    if (_modelArr == nil) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

-(NSMutableArray *)dateModelArr{
    if (_dateModelArr == nil) {
        _dateModelArr = [NSMutableArray array];
    }
    return _dateModelArr;
}

-(NSMutableDictionary *)cellDict{
    if (_cellDict == nil) {
        _cellDict = [[NSMutableDictionary alloc]init];
    }
    return _cellDict;
}

@end
