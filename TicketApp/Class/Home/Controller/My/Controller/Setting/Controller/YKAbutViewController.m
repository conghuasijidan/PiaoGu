//
//  YKAbutViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKAbutViewController.h"
#import "YKAboutTableViewCell.h"
#define HEADERHEIGHT 164
@interface YKAbutViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView *aboutTableView;


@end

@implementation YKAbutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}
- (void)setupUI{
    UITableView *aboutTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    aboutTableView.backgroundColor = [UIColor whiteColor];
    aboutTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    aboutTableView.dataSource = self;
    aboutTableView.delegate = self;
    aboutTableView.rowHeight = 50;
    [aboutTableView registerClass:[YKAboutTableViewCell class] forCellReuseIdentifier:YKABOUTCELL];
    self.aboutTableView = aboutTableView;
    [self.view addSubview:aboutTableView];
    [self setupHeaderView];
    [self setupFooderView];
}
- (void)setupHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], HEADERHEIGHT)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.aboutTableView.tableHeaderView = headerView;
    UIImageView *logoImageView = [[UIImageView alloc] init];
    logoImageView.image = [UIImage imageNamed:@"setting_about_logo"];
    [headerView addSubview:logoImageView];
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.top.equalTo(headerView).offset(2*kSPACING);
        make.size.mas_equalTo(CGSizeMake(kSPACING*9, kSPACING*9));
    }];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = [UIColor yk_colorWithHex:0x333333];
    textLabel.text = @"票谷网 1.0.0";
    textLabel.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.top.equalTo(logoImageView.mas_bottom).offset(10);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [headerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headerView);
        make.bottom.equalTo(headerView);
        make.height.mas_equalTo(10);
    }];
    
}

- (void)setupFooderView{
    UIView *fooderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], [UIScreen yk_screenHeight]-HEADERHEIGHT-3*50 -64)];
    fooderView.backgroundColor = [UIColor whiteColor];
    self.aboutTableView.tableFooterView = fooderView;
    
    UILabel *copyRightLabel = [[UILabel alloc] init];
    copyRightLabel.text = @"2017 piaoguwang.com All rights reserved";
    copyRightLabel.textColor = [UIColor yk_colorWithHex:0x999999];
    copyRightLabel.font = [UIFont systemFontOfSize:12];
    [fooderView addSubview:copyRightLabel];
    [copyRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(fooderView).offset(-2*kSPACING);
        make.centerX.equalTo(fooderView);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"票谷网";
    titleLabel.textColor = [UIColor yk_colorWithHex:0x999999];
    titleLabel.font = [UIFont systemFontOfSize:14];
    [fooderView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(copyRightLabel).offset(-2*kSPACING);
        make.centerX.equalTo(fooderView);
    }];

}

#pragma mark - 数据源 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YKAboutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKABOUTCELL forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLab.text = @"欢迎页面";
        
    }else if (indexPath.row == 1){
        cell.titleLab.text = @"服务与协议";
        
    }else if (indexPath.row == 2){
        cell.titleLab.text = @"评价";
        
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            YKLog(@"欢迎页面");
            break;
        case 1:
            YKLog(@"服务与协议");
            break;
        case 2:
            YKLog(@"评价");
            break;
        default:
            break;
    }
    
    
}

@end
