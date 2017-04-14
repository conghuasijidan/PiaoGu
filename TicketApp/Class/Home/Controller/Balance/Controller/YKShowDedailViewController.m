//
//  YKShowDedailViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/14.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKShowDedailViewController.h"
#import "YKShowDetailTableViewCell.h"

@interface YKShowDedailViewController ()<UITableViewDataSource>

@end

@implementation YKShowDedailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"明细";
    [self setupUI];
}
#pragma mark - 搭建界面
- (void)setupUI{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], [UIScreen yk_screenHeight]-64) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.rowHeight = 66;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[YKShowDetailTableViewCell class] forCellReuseIdentifier:YKSHOWDETAILCELL];
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKShowDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKSHOWDETAILCELL forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


@end
