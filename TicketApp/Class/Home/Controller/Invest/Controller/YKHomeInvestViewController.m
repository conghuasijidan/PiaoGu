//
//  YKHomeInvestViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/19.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeInvestViewController.h"
#import "YKHomeHeaderView.h"


@interface YKHomeInvestViewController ()
@property(nonatomic,assign)CGFloat viewHeight;
@property(nonatomic,weak)UITableView *tableView;


@end

@implementation YKHomeInvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"投资宝收益";

    CGRect rectTab = self.tabBarController.tabBar.frame;
    CGRect rectNav = self.navigationController.navigationBar.frame;
    self.viewHeight = [UIScreen yk_screenHeight]- [UIScreen yk_statusHeight] - rectNav.size.height - rectTab.size.height;
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"记录" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; 
    [button addTarget:self action:@selector(recordButtonAction) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button sizeToFit];
    UIBarButtonItem *recordButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = recordButton;
    
    [self setupUI];
}
#pragma mark - 搭建界面
- (void)setupUI{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:tableView];
    // 200
    YKHomeHeaderView *headerView = [[YKHomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth],237/554.0*self.viewHeight)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    tableView.tableHeaderView = headerView;
    
}

#pragma mark - 记录
- (void)recordButtonAction{
    
}

@end
