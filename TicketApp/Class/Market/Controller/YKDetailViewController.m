//
//  YKDetailViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/11.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailViewController.h"

#define HEADERHEIGHT 216
@interface YKDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView *detailTableView;



@end

@implementation YKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"产品详情";
    [self setupUI];
    
    
}
#pragma mark - 搭建界面
- (void)setupUI{
    UITableView *detailTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    detailTableView.backgroundColor = [UIColor whiteColor];
    detailTableView.dataSource = self;
    detailTableView.delegate = self;
    [detailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:detailTableView];
    self.detailTableView = detailTableView;
    [self setupHeaderView];
}

#pragma mark - 搭建头部视图
- (void)setupHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], HEADERHEIGHT)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.detailTableView.tableHeaderView = headerView;
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"detail_adverimage_placehoder"];
    [headerView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(10);
        make.right.equalTo(headerView).offset(-10);
        make.top.equalTo(headerView).offset(20);
        make.bottom.equalTo(headerView);
    }];
}
#pragma mark - 实现代理数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20 + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 两种cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    return cell;
}


@end
