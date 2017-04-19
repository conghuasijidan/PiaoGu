//
//  YKHomeViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/7.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeViewController.h"
#import "YKHomeMeViewController.h"
#import "YKBalanceViewController.h"
#import "YKUserTableViewCell.h"
#import "YKAccountTableViewCell.h"
#import "YKProfitTableViewCell.h"
#import "YKHomeMessageViewController.h"
#import "YKHomeIncomeViewController.h"
#import "YKHomeInvestViewController.h"

@interface YKHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)CGFloat viewHeight;
@end

@implementation YKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    
    CGRect rectTab = self.tabBarController.tabBar.frame;
    CGRect rectNav = self.navigationController.navigationBar.frame;
    self.viewHeight = [UIScreen yk_screenHeight]- [UIScreen yk_statusHeight] - rectNav.size.height - rectTab.size.height;
    [self setupUI];
    
}

#pragma mark - 显示tabBar
- (void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:NO];
}

#pragma mark - 搭建界面
- (void)setupUI{
   
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[YKUserTableViewCell class] forCellReuseIdentifier:YKHOMEUSERCELL];
    [tableView registerClass:[YKAccountTableViewCell class] forCellReuseIdentifier:YKHOMEACCOUNTCELL];
    [tableView registerClass:[YKProfitTableViewCell class] forCellReuseIdentifier:YKHOMEPROFITCELL];
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];

}
#pragma mark - 数据源 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num = 0;
    switch (section) {
        case 0:
            num = 1;
            break;
        case 1:
            num = 1;
            break;
        case 2:
            num = 2;
            break;
        default:
            break;
    }
    return num;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        YKUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKHOMEUSERCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.meCallBack = ^{
            
            YKHomeMeViewController *myVC = [[YKHomeMeViewController alloc] init];
    
            [self.navigationController pushViewController:myVC animated:YES];
        };
        cell.messageCallBack = ^{
            YKHomeMessageViewController *vc = [[YKHomeMessageViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        };
        return cell;

    }else if (indexPath.section == 1 && indexPath.row == 0){
        YKAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKHOMEACCOUNTCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.balanceCallBack = ^{
            YKBalanceViewController *balanceVC = [[YKBalanceViewController alloc] init];
            [self.navigationController pushViewController:balanceVC animated:YES];
        };
        
        return cell;

    }else
    {
        YKProfitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKHOMEPROFITCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.section == 2 && indexPath.row == 0) {
            // 判断是否投资 隐藏/开启 两个label
            cell.image = [UIImage imageNamed:@"home_invest_bg"];

        }
        else{
            cell.image = [UIImage imageNamed:@"home_income_bg"];
        }
        
        return cell;

    }
    
}
// 圆  191  188
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0;
    if (indexPath.section == 0 && indexPath.row == 0) {
        height = self.viewHeight*(60.0/554.0);
    }else if (indexPath.section == 1 && indexPath.row == 0){
        height = self.viewHeight*(274.0/554.0);
    }else
    {
        height = self.viewHeight*(110.0/554.0);
    }
    return height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 0) {
        
        YKHomeInvestViewController *vc = [[YKHomeInvestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section == 2 && indexPath.row == 1){
        
        YKHomeIncomeViewController *vc = [[YKHomeIncomeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
