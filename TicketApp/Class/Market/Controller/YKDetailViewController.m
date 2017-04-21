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
@property(nonatomic,weak)UIView *bottomView;

@end

@implementation YKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"产品详情";
    self.tabBarController.tabBar.hidden = YES;
    
    CGRect rectTab = self.tabBarController.tabBar.frame;
    CGRect rectNav = self.navigationController.navigationBar.frame;
    self.viewHeight = [UIScreen yk_screenHeight]- [UIScreen yk_statusHeight] - rectNav.size.height - rectTab.size.height;
    [self setupUI];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [self setupBottomView];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.bottomView removeFromSuperview];
    self.tabBarController.tabBar.hidden = NO;
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
    detailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    detailTableView.estimatedRowHeight = 200;
    detailTableView.rowHeight = UITableViewAutomaticDimension;

    [self.view addSubview:detailTableView];
    self.detailTableView = detailTableView;
    [self setupHeaderView];
//    [self setupFooderView];
}

#pragma mark - 搭建头部视图
- (void)setupHeaderView{
    YKDetailHeaderView *headerView = [[YKDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], HEADERHEIGHT/554.0*self.viewHeight)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.detailTableView.tableHeaderView = headerView;
    
}
#pragma mark - 搭建底部视图
- (void)setupBottomView{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    [window addSubview:bottomView];
    self.bottomView = bottomView;
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(window);
        make.height.mas_equalTo(49);
    }];
    
    UIButton *commentButton = [[UIButton alloc] init];
    [commentButton setBackgroundImage:[UIImage imageNamed:@"market_comment_btn_normal"] forState:UIControlStateNormal];
    [bottomView addSubview:commentButton];
    [commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bottomView);
        make.right.equalTo(bottomView).multipliedBy(0.32);
    }];
    
    UIButton *investButton = [[UIButton alloc] init];
    [investButton setBackgroundImage:[UIImage imageNamed:@"market_detail_invest_btn"] forState:UIControlStateNormal];
    [bottomView addSubview:investButton];
    
    [investButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(commentButton.mas_right);
        make.bottom.top.right.equalTo(bottomView);
    }];
    
}

#pragma mark - 实现代理数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
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
    
  return num;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 两种cell
    if (indexPath.section == 0 && indexPath.row == 0) {
        YKDetailOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETDETAILONECELL forIndexPath:indexPath];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1 && indexPath.row == 0){
     YKDetailTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETDETAILTWOCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 2 && indexPath.row == 0){
        YKDetailThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETDETAILTHREECELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }else
    {
        YKDetailCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETDETAILCOMMENTCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
}




@end
