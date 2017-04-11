//
//  YKMeViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/7.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMeViewController.h"
#import "YKMeOneTableViewCell.h"
#import "YKMeTwoTableViewCell.h"
#import "YKMeMessageViewController.h"
#import "YKMeKeFuViewController.h"
#import "YKMeSettingViewController.h"


@interface YKMeViewController ()<UITableViewDataSource,UITableViewDelegate>

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
    UITableView *meTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    meTableView.backgroundColor = [UIColor whiteColor];
    meTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    meTableView.dataSource = self;
    meTableView.delegate = self;
    [meTableView registerClass:[YKMeOneTableViewCell class] forCellReuseIdentifier:YKMEONECELL];
    [meTableView registerClass:[YKMeTwoTableViewCell class] forCellReuseIdentifier:YKMETWOCELL];
    meTableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:meTableView];
}

#pragma mark - 实现数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num;
    switch (section) {
        case 0:
            num = 1;
            break;
        case 1:
            num = 3;
            break;
        default:
            num = 0;
            break;
    }
   return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        YKMeOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMEONECELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        YKMeTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMETWOCELL forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.imgView.image = [UIImage imageNamed:@"me_message"];
            cell.descLabel.text = @"个人信息";
        }else if (indexPath.row == 1){
            cell.imgView.image = [UIImage imageNamed:@"me_kefu"];
            cell.descLabel.text = @"客服";
        }else if (indexPath.row == 2){
            cell.imgView.image = [UIImage imageNamed:@"me_setting"];
            cell.descLabel.text = @"设置";
        }
        
        return cell;
    }
    
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 110;
    }else
    {
        return 50;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1 && indexPath.row == 0) {
        YKMeMessageViewController *messageVC = [[YKMeMessageViewController alloc] init];
        [self.navigationController pushViewController:messageVC animated:YES];
    }else if (indexPath.section == 1 && indexPath.row ==  1){
        YKMeKeFuViewController *kefuVC = [[YKMeKeFuViewController alloc] init];
        [self.navigationController pushViewController:kefuVC animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 2){
        YKMeSettingViewController *setVC = [[YKMeSettingViewController alloc] init];
        [self.navigationController pushViewController:setVC animated:YES];
    }
    
}


@end
