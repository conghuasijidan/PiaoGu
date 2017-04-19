//
//  YKRecordViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/19.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKRecordViewController.h"
#import "YKRecordTableViewCell.h"

@interface YKRecordViewController ()<UITableViewDataSource>


@end
@implementation YKRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"记录";
    
    [self setupUI];
    
}

#pragma mark - 搭建界面
- (void)setupUI{
    CGRect rectTab = self.tabBarController.tabBar.frame;
    CGRect rectNav = self.navigationController.navigationBar.frame;
    CGFloat viewHeight = [UIScreen yk_screenHeight]- [UIScreen yk_statusHeight] - rectNav.size.height - rectTab.size.height;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.dataSource = self;
    tableView.rowHeight = 80.0/554.0*viewHeight;
    [tableView registerClass:[YKRecordTableViewCell class] forCellReuseIdentifier:YKRECORDCELL];
    [self.view addSubview:tableView];
    

}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKRECORDCELL forIndexPath:indexPath];
    cell.isInvest = self.isInvest;
    
    return cell;
}
@end
