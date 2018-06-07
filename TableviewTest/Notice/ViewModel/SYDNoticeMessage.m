//
//  SYDNoticeMessage.m
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/3/20.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#import "SYDNoticeMessage.h"

@interface SYDNoticeMessage()

@property(nonatomic,assign) BOOL indexIsSelect;

@end
@implementation SYDNoticeMessage
#pragma mark  =============Getting=================
-(void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
}
-(void)setNoticeModel:(SYDNoticeModel *)noticeModel{
    _noticeModel = noticeModel;
}
#pragma mark---UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SYDMessageNoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:NOTICEID];
    if (!cell) {
        cell = [[SYDMessageNoticeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NOTICEID];
    }
    SYDNoticeModel *model = self.dataSource[indexPath.section];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark - UITable View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.indexIsSelect == NO) {
        
        self.indexIsSelect = YES;
        [self performSelector:@selector(didSelectRowChangeStatus) withObject:nil afterDelay:1.5f];
    }
    SYDNoticeModel *model = self.dataSource[indexPath.section];
    if (self.selectedBlock) {
        self.selectedBlock(indexPath, model);
    }
}
-(void)didSelectRowChangeStatus{
    self.indexIsSelect = NO;
}
//段头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
//段尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section{
    
    view.tintColor = [UIColor clearColor];
}
@end

