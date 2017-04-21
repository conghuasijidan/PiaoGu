//
//  YKMeViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/7.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMeViewController.h"

@interface YKMeViewController ()

///<,UITableViewDelegate>

@property(nonatomic,weak)UIButton *exitButton;
@property(nonatomic,weak)UITableView *meTableView;


@end

@implementation YKMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的门店";
    
    [self setupUI];

}
#pragma mark - 搭建界面
- (void)setupUI{
    
    
    
}




@end
