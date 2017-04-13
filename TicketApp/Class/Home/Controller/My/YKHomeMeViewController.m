//
//  YKHomeMeViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeMeViewController.h"
#import "YKHomeMeTableViewCell.h"
#import "YKHomeKefuViewController.h"
#import "YKHomeSettingViewController.h"
#import "YKHomeInformationViewController.h"
#define HEADERHEIGHT 100

@interface YKHomeMeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)UITableView *meTableView;
@property(nonatomic,weak)UIButton *exitButton;


@end

@implementation YKHomeMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的";
    [self.tabBarController.tabBar setHidden:YES];
    [self setupUI];
 
}

#pragma mark - 搭建界面
- (void)setupUI{
    UITableView *meTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    meTableView.backgroundColor = [UIColor whiteColor];
    meTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    meTableView.dataSource = self;
    meTableView.delegate = self;
    [meTableView registerClass:[YKHomeMeTableViewCell class] forCellReuseIdentifier:YKHOMEMECELL];
    self.meTableView = meTableView;
    [self.view addSubview:meTableView];
    [self setupHeaderView];
    
}
#pragma mark - 搭建头部视图
- (void)setupHeaderView{

    // 设置tableview的HEADER
    UIView *headerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen yk_screenWidth] ,HEADERHEIGHT)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.meTableView.tableHeaderView = headerView;
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"me_name_placehoder"];
    [headerView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(kSPACING);
        make.top.equalTo(headerView).offset(kSPACING*2);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:18];
    nameLabel.textColor = [UIColor yk_colorWithHex:0x333333];
    nameLabel.text = @"章梦菲";
    [headerView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(kSPACING);
        make.bottom.equalTo(imgView.mas_centerY);
        make.right.equalTo(headerView).offset(2*kSPACING);
    }];
    
    UILabel *accountLabel = [[UILabel alloc] init];
    accountLabel.text = @"账号:";
    accountLabel.font = [UIFont systemFontOfSize:12];
    accountLabel.textColor = [UIColor yk_colorWithHex:0x666666];
    [headerView addSubview:accountLabel];
    
    [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.width.mas_equalTo(30);
        make.top.equalTo(nameLabel.mas_bottom).offset(kSPACING*0.2);
    }];
    
    UILabel *accountIDLabel = [[UILabel alloc] init];
    accountLabel.textAlignment = NSTextAlignmentLeft;
    accountIDLabel.text = @"192u3973029";
    accountIDLabel.font = [UIFont systemFontOfSize:12];
    accountIDLabel.textColor = [UIColor yk_colorWithHex:0x666666];
    [headerView addSubview:accountIDLabel];
    [accountIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(accountLabel.mas_right);
        make.top.equalTo(accountLabel);
        make.right.equalTo(headerView).offset(-kSPACING*2);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [headerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(headerView);
        make.height.mas_equalTo(kSPACING);
    }];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.exitButton removeFromSuperview];
    
}
#pragma mark - 添加退出按钮
- (void)viewWillAppear:(BOOL)animated
{

    UIButton *exitButton = [[UIButton alloc] init];
    [exitButton setTitle:@"退出" forState:UIControlStateNormal];
    exitButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [exitButton setTitleColor:[UIColor yk_colorWithHex:0x666666] forState:UIControlStateNormal];
    [exitButton setBackgroundImage:[UIImage imageNamed:@"me_exit_bg"] forState:UIControlStateNormal];
    [exitButton setBackgroundColor:[UIColor whiteColor]];
    [exitButton addTarget:self action:@selector(exitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    [window addSubview:exitButton];
    self.exitButton = exitButton;
    [exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(window);
        make.bottom.equalTo(window);
        make.height.mas_equalTo(49);
    }];

}

- (void)exitButtonAction{
    YKLog(@"退出登录");
    
    
}

#pragma mark - 实现数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        YKHomeMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKHOMEMECELL forIndexPath:indexPath];
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

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ( indexPath.row == 0) {
        YKHomeInformationViewController *messageVC = [[YKHomeInformationViewController alloc] init];
        [self.navigationController pushViewController:messageVC animated:YES];
    }else if (indexPath.row ==  1){
        YKHomeKefuViewController *kefuVC = [[YKHomeKefuViewController alloc] init];
        [self.navigationController pushViewController:kefuVC animated:YES];
    }else if (indexPath.row == 2){
        YKHomeSettingViewController *setVC = [[YKHomeSettingViewController alloc] init];
        [self.navigationController pushViewController:setVC animated:YES];
    }
}

@end
