//
//  YKHomeMessageViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/18.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeMessageViewController.h"
#import "YKHomeMessageTableViewCell.h"
@interface YKHomeMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YKHomeMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"消息";
    [self.tabBarController.tabBar setHidden:YES];
    [self setupUI];
}
#pragma mark - 搭建界面
- (void)setupUI{
    CGRect rectTab = self.tabBarController.tabBar.frame;
    CGRect rectNav = self.navigationController.navigationBar.frame;
    CGFloat viewHeight = [UIScreen yk_screenHeight]- [UIScreen yk_statusHeight] - rectNav.size.height - rectTab.size.height;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[YKHomeMessageTableViewCell class] forCellReuseIdentifier:YKHOMEMESSAGECELL];
    tableView.rowHeight = 82.0/554.0*viewHeight;

    [self.view addSubview:tableView];
    
    
}
#pragma mark - 数据源和代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKHomeMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKHOMEMESSAGECELL forIndexPath:indexPath];
    
    return cell;
}

@end
