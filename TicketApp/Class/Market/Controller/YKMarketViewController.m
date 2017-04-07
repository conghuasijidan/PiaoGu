//
//  YKMarketViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/7.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMarketViewController.h"
#import "YKMarketTableViewCell.h"

#define SCROLLHEIGHT 196

@interface YKMarketViewController ()<UITableViewDataSource,SDCycleScrollViewDelegate>
@property(nonatomic,weak)UITableView *marketTabView;


@end

@implementation YKMarketViewController{
    NSArray *_scrollImageList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    [self setupUI];
}


#pragma mark - 搭建界面
- (void)setupUI{
    
    UITableView *marketTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    marketTableView.backgroundColor = [UIColor whiteColor];
    marketTableView.dataSource = self;
    [marketTableView registerClass:[YKMarketTableViewCell class] forCellReuseIdentifier:YKMARKETCELL];
    [self.view addSubview:marketTableView];
    self.marketTabView = marketTableView;
    [self setupHeaderView];
}

#pragma mark - 设置头部视图
- (void)setupHeaderView{
    // 设置tableview的HEADER
    UIView *headerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,SCROLLHEIGHT + 20)];
    headerView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    // 设置轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(5,5,self.view.bounds.size.width - 10, SCROLLHEIGHT) delegate:self placeholderImage:[UIImage imageNamed:@"market_advertisement_placeholder"]];
    cycleScrollView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    // _imgLists 设置网络数据 必须有值
    // cycleScrollView.imageURLStringsGroup = _imgLists;
    // 设置本地数据
    cycleScrollView.localizationImageNamesGroup = _scrollImageList;
    
    [headerView addSubview:cycleScrollView];
    
    self.marketTabView.tableHeaderView = headerView;
    
    
}


#pragma mark - 实现UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKMarketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETCELL forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

#pragma mark - 实现SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    YKLog(@"---点击了第%ld张图片", (long)index);
}

#pragma mark - 加载数据

- (void)loadData{
    _scrollImageList = @[@"market_advertisement_placeholder",
                         @"market_advertisement_placeholder",
                         @"market_advertisement_placeholder"
                         ];
    
}

@end
