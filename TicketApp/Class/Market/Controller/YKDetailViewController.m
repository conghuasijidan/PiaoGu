//
//  YKDetailViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/11.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailViewController.h"
#import "YKDetailHeaderView.h"
#import "YKDetailOneTableViewCell.h"
#import "YKDetailTwoTableViewCell.h"
#import "YKDetailThreeTableViewCell.h"
#import "YKDetailCommentTableViewCell.h"

#define HEADERHEIGHT 216.0

@interface YKDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView *detailTableView;
@property(nonatomic,assign)CGFloat viewHeight;



@end

@implementation YKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"产品详情";
    
    CGRect rectTab = self.tabBarController.tabBar.frame;
    CGRect rectNav = self.navigationController.navigationBar.frame;
    self.viewHeight = [UIScreen yk_screenHeight]- [UIScreen yk_statusHeight] - rectNav.size.height - rectTab.size.height;
    [self setupUI];
    
    
}
#pragma mark - 搭建界面
- (void)setupUI{
    UITableView *detailTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    detailTableView.backgroundColor = [UIColor whiteColor];
    detailTableView.dataSource = self;
    detailTableView.delegate = self;
    [detailTableView registerClass:[YKDetailOneTableViewCell class] forCellReuseIdentifier:YKMARKETDETAILONECELL];
    [detailTableView registerClass:[YKDetailTwoTableViewCell class] forCellReuseIdentifier:YKMARKETDETAILTWOCELL];
    [detailTableView registerClass:[YKDetailThreeTableViewCell class] forCellReuseIdentifier:YKMARKETDETAILTHREECELL];
    [detailTableView registerClass:[YKDetailCommentTableViewCell class] forCellReuseIdentifier:YKMARKETDETAILCOMMENTCELL];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    detailTableView.estimatedRowHeight = 200;
    detailTableView.rowHeight = UITableViewAutomaticDimension;
//    UITableViewCell *cell = [detailTableView cellForRowAtIndexPath:indexPath];
//    if ([cell isKindOfClass:[YKDetailOneTableViewCell class]]) {
//       
//    }
    
    [self.view addSubview:detailTableView];
    self.detailTableView = detailTableView;
    [self setupHeaderView];
}

#pragma mark - 搭建头部视图
- (void)setupHeaderView{
    YKDetailHeaderView *headerView = [[YKDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], HEADERHEIGHT/554.0*self.viewHeight)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.detailTableView.tableHeaderView = headerView;
    
}
#pragma mark - 实现代理数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfsection:(NSInteger)section
{
    return 4;
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
            num = 1;
            break;
        case 3:
            num = 5;
            break;
        default:
            break;
    }
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 两种cell
    if (indexPath.section == 0 && indexPath.row == 0) {
        YKDetailOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETDETAILONECELL forIndexPath:indexPath];
    
        return cell;
    }else if (indexPath.section == 1 && indexPath.row == 0){
     YKDetailTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETDETAILTWOCELL forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 2 && indexPath.row == 0){
        YKDetailThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETDETAILTHREECELL forIndexPath:indexPath];
        return cell;
    }else
    {
        YKDetailCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETDETAILCOMMENTCELL forIndexPath:indexPath];
        return cell;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat rowHeight = 0;
//    if (indexPath.section == 0 ) {
//        tableView.rowHeight = UITableViewAutomaticDimension;
//    }else if (indexPath.section == 1)
//    {
//        rowHeight = UITableViewAutomaticDimension;
//    }else if (indexPath.section == 2)
//    {
//        rowHeight = 130.0;
//    }else
//    {
//        rowHeight = 100.0;
//    }
//    return rowHeight;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat rowHeight = 0;
//    if (indexPath.section == 0) {
//        rowHeight = 213.0;
//    }else if (indexPath.section == 2){
//        rowHeight = 106.0;
//    }
//    
//    return rowHeight;
//}

@end
