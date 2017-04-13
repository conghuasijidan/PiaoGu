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
@interface YKHomeViewController ()

@end

@implementation YKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    [self setupUI];
    
}

#pragma mark - 显示tabBar
- (void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:NO];
}

#pragma mark - 搭建界面
- (void)setupUI{
   
    UIButton *mebutton = [[UIButton alloc] init];
    [mebutton setTitle:@"我的" forState:UIControlStateNormal];
    mebutton.titleLabel.font = [UIFont systemFontOfSize:17];
    [mebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mebutton addTarget:self action:@selector(meButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mebutton];
    [mebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    UIButton *balancebutton = [[UIButton alloc] init];
    [balancebutton setTitle:@"余额" forState:UIControlStateNormal];
    balancebutton.titleLabel.font = [UIFont systemFontOfSize:17];
    [balancebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [balancebutton addTarget:self action:@selector(balanceBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:balancebutton];
    [balancebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(mebutton).offset(-80);
    }];
    
}
- (void)balanceBtnAction{
    YKBalanceViewController *balanceVC = [[YKBalanceViewController alloc] init];
    [self.navigationController pushViewController:balanceVC animated:YES];
    
}
- (void)meButtonAction{
    
    YKHomeMeViewController *myVC = [[YKHomeMeViewController alloc] init];
    
    [self.navigationController pushViewController:myVC animated:YES];
}

@end
