//
//  YKHomeViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/7.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeViewController.h"
#import "YKHomeMeViewController.h"

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
//    [mebutton setBackgroundColor:[UIColor orangeColor]];
    [mebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mebutton addTarget:self action:@selector(meButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mebutton];
//    [mebutton sizeToFit];
    [mebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
    }];
    
}
- (void)meButtonAction{
    
    YKHomeMeViewController *myVC = [[YKHomeMeViewController alloc] init];
    
    [self.navigationController pushViewController:myVC animated:YES];
}

@end
