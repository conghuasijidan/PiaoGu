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

#define VIEWHEIGHT [UIScreen yk_screenHeight]

@interface YKHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
//    NSLog(@"%f",[UIScreen yk_screenHeight]);
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

    
    
//    UIButton *mebutton = [[UIButton alloc] init];
//    [mebutton setTitle:@"我的" forState:UIControlStateNormal];
//    mebutton.titleLabel.font = [UIFont systemFontOfSize:17];
//    [mebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [mebutton addTarget:self action:@selector(meButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:mebutton];
//    [mebutton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//    }];
//    
//    UIButton *balancebutton = [[UIButton alloc] init];
//    [balancebutton setTitle:@"余额" forState:UIControlStateNormal];
//    balancebutton.titleLabel.font = [UIFont systemFontOfSize:17];
//    [balancebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [balancebutton addTarget:self action:@selector(balanceBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:balancebutton];
//    [balancebutton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.bottom.equalTo(mebutton).offset(-80);
//    }];
    
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
        return cell;

    }else if (indexPath.section == 1 && indexPath.row == 0){
        YKAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKHOMEACCOUNTCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else
    {
        YKProfitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKHOMEPROFITCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.section == 2 && indexPath.row == 0) {
            // 判断是否投资 隐藏/开启 两个label
            cell.bgImageView.image = [UIImage imageNamed:@"home_invest_bg"];
        }
        else{
            cell.bgImageView.image = [UIImage imageNamed:@"home_income_bg"];
        }
        
        return cell;

    }
    
}
// 圆  191  188
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0;
    if (indexPath.section == 0 && indexPath.row == 0) {
        height = [UIScreen yk_screenHeight]*(60.0/554.0);
    }else if (indexPath.section == 1 && indexPath.row == 0){
        height = [UIScreen yk_screenHeight]*(274.0/554.0);
    }else
    {
        height = [UIScreen yk_screenHeight]*(110.0/554.0);
    }
    return height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 0) {
        YKLog(@"投资宝");
    }else if (indexPath.section == 2 && indexPath.row == 1){
        YKLog(@"收益票");
    }
}


#pragma mark -
- (void)balanceBtnAction{
    YKBalanceViewController *balanceVC = [[YKBalanceViewController alloc] init];
    
    [self.navigationController pushViewController:balanceVC animated:YES];
    
}
- (void)meButtonAction{
    
    YKHomeMeViewController *myVC = [[YKHomeMeViewController alloc] init];
    
    [self.navigationController pushViewController:myVC animated:YES];
}

@end
