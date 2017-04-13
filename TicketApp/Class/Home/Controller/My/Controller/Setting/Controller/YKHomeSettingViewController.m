//
//  YKHomeSettingViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeSettingViewController.h"
#import "YKSettingTableViewCell.h"
#import "YKMaskViewController.h"
#import "YKAbutViewController.h"


@interface YKHomeSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YKHomeSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
    [self setupUI];
}

#pragma mark - 搭建界面
- (void)setupUI{
    UITableView *settingTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    settingTableView.backgroundColor = [UIColor whiteColor];
    settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    settingTableView.dataSource = self;
    settingTableView.delegate = self;
    [settingTableView registerClass:[YKSettingTableViewCell class] forCellReuseIdentifier:YKSETTINGCELL];
    settingTableView.rowHeight = 50;
    [self.view addSubview:settingTableView];
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    settingTableView.tableFooterView = bgView;
    settingTableView.contentInset = UIEdgeInsetsMake(kSPACING, 0, 0, 0);
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(10);
    }];
    
    
}

#pragma mark - 设置数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKSETTINGCELL forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLab.text = @"消息设置";
        
    }else if (indexPath.row == 1){
        cell.titleLab.text = @"行情刷新频率";
        
    }else if (indexPath.row == 2){
        cell.titleLab.text = @"意见反馈";
        
    }else if (indexPath.row == 3){
        cell.titleLab.text = @"关于";
    }
    
    return cell;
}
#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        YKLog(@"消息设置");
    }else if (indexPath.row == 1){
        YKMaskViewController *maskVC = [[YKMaskViewController alloc] init];
        // 不用适配iOS8 一下
        maskVC.modalPresentationStyle=UIModalPresentationOverCurrentContext;
        
        [self presentViewController:maskVC animated:YES completion:nil];
        
    }else if (indexPath.row == 2){
        
        
    }else if (indexPath.row == 3){
        
        YKAbutViewController *aboutVC = [[YKAbutViewController alloc] init];
        
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
    
}

@end
