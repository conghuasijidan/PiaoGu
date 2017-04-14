//
//  YKBalanceViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/13.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKBalanceViewController.h"
#import "YKBalanceTableViewCell.h"
#import "YKCashViewController.h"
#import "YKTopupViewController.h"
#import "YKShowDedailViewController.h"

#define HEADERHEIGHT 119

@interface YKBalanceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView *balanceTableView;


@end

@implementation YKBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"余额";
    [self.tabBarController.tabBar setHidden:YES];
    [self setupRightItem];
    [self setupUI];
}
- (void)setupRightItem{
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton setTitle:@"明细" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightButton addTarget:self action:@selector(rightItemAction) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton sizeToFit];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)rightItemAction{
    YKShowDedailViewController *vc = [[YKShowDedailViewController alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    UITableView *balanceTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    balanceTableView.backgroundColor = [UIColor whiteColor];
    balanceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    balanceTableView.dataSource = self;
    balanceTableView.delegate = self;
    [balanceTableView registerClass:[YKBalanceTableViewCell class] forCellReuseIdentifier:YKBALANCECELL];
    self.balanceTableView = balanceTableView;
    [self.view addSubview:balanceTableView];
    [self setupHeaderView];
    balanceTableView.tableFooterView = [[UIView alloc] init];
    
}
#pragma mark - 搭建头部视图
- (void)setupHeaderView{
    
    // 设置tableview的HEADER
    UIView *headerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen yk_screenWidth] ,HEADERHEIGHT)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.balanceTableView.tableHeaderView = headerView;
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_balance_bg"]];
    [headerView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(headerView);
        make.bottom.equalTo(headerView).offset(-kSPACING);
    }];
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.textColor = [UIColor yk_colorWithHex:0xfcd9d5];
    nameLabel.text = @"账户余额（元）";
    [headerView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(2*kSPACING);
        make.top.equalTo(headerView).offset(2*kSPACING);
    }];
    
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.text = @"9999.99";
    numberLabel.font = [UIFont systemFontOfSize:36];
    numberLabel.textColor = [UIColor yk_colorWithHex:0xffffff];
    [headerView addSubview:numberLabel];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.right.equalTo(headerView).offset(2*kSPACING);
        make.top.equalTo(nameLabel.mas_bottom).offset(kSPACING);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [headerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(headerView);
        make.height.mas_equalTo(kSPACING);
    }];
    
}
#pragma mark - 数据源 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YKBalanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKBALANCECELL forIndexPath:indexPath ];
    if (indexPath.row == 0) {
        cell.iconImageView.image = [UIImage imageNamed:@"home_balance_topup_icon"];
        cell.descLabel.text = @"充值";
    }else if (indexPath.row == 1){
        cell.iconImageView.image = [UIImage imageNamed:@"home_balance_cash_icon"];
        cell.descLabel.text = @"提现";

    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        YKTopupViewController *topupVC = [[YKTopupViewController alloc] init];
        [self.navigationController pushViewController:topupVC animated:YES];
    }else if (indexPath.row == 1){
        YKCashViewController *cashVC = [[YKCashViewController alloc] init];
        [self.navigationController pushViewController:cashVC animated:YES];
    }
    
}

@end
