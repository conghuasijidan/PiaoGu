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
#define BGVIEWHEIGHT 104
@interface YKMarketViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
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
    marketTableView.delegate = self;
    [marketTableView registerClass:[YKMarketTableViewCell class] forCellReuseIdentifier:YKMARKETCELL];
    marketTableView.estimatedRowHeight = 162;
    marketTableView.rowHeight = UITableViewAutomaticDimension;
    // 去掉表格分割线
    marketTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:marketTableView];
    self.marketTabView = marketTableView;
    [self setupHeaderView];
}


#pragma mark - 设置头部视图 未适配屏幕
- (void)setupHeaderView{
    // 设置tableview的HEADER
    UIView *headerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,SCROLLHEIGHT + 124)];
    headerView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    self.marketTabView.tableHeaderView = headerView;

    // 设置轮播器
    UIView *cycleBgView = [[UIView alloc] init];
    cycleBgView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [headerView addSubview:cycleBgView];
    [cycleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(headerView);
        make.right.equalTo(headerView);
        make.height.mas_equalTo(SCROLLHEIGHT+kSPACING);
    }];

    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"market_advertisement_placeholder"]];
    cycleScrollView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.currentPageDotColor = [UIColor colorWithWhite:1.0 alpha:0.9]; // 自定义分页控件小圆标颜色
    cycleScrollView.pageDotColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    cycleScrollView.pageControlDotSize = CGSizeMake(3.0, 3.0);
    // 设置分页指示器的位置
    cycleScrollView.pageControlBottomOffset = kSPACING*0.5;
    // _imgLists 设置网络数据 必须有值
    // cycleScrollView.imageURLStringsGroup = _imgLists;
    // 设置本地数据
    cycleScrollView.localizationImageNamesGroup = _scrollImageList;
    [cycleBgView addSubview:cycleScrollView];
    // 需要适配高度
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(cycleBgView).offset(kSPACING*0.5);
        make.right.equalTo(cycleBgView).offset(-kSPACING*0.5);
        make.bottom.equalTo(cycleBgView).offset(-kSPACING*0.5);
    }];
    
    
    UIView *bgview = [[UIView alloc] init];
    bgview.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headerView);
        make.top.equalTo(cycleBgView.mas_bottom);
        make.bottom.equalTo(headerView);
    }];
    
    UIButton *investBtn = [[UIButton alloc] init];
    [investBtn addTarget:self action:@selector(investBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [investBtn setImage:[UIImage imageNamed:@"market_investBtn_normal"] forState:UIControlStateNormal];
    [bgview addSubview:investBtn];
    
    [investBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgview).offset(kSPACING);
        make.top.equalTo(bgview).offset(kSPACING);
        make.right.equalTo(bgview.mas_centerX).offset(-kSPACING*0.5);
        make.height.mas_equalTo(64);
    }];
    
    UIButton *incomeBtn = [[UIButton alloc] init];
    [incomeBtn setImage:[UIImage imageNamed:@"market_incomeBtn_normal"] forState:UIControlStateNormal];
    [incomeBtn addTarget:self action:@selector(incomeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:incomeBtn];
    
    [incomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgview.mas_centerX).offset(kSPACING*0.5);
        make.top.equalTo(investBtn);
        make.height.equalTo(investBtn);
        make.right.equalTo(bgview).offset(-kSPACING);
    }];

    UIView *lineBgView = [[UIView alloc] init];
    lineBgView.backgroundColor = [UIColor whiteColor];
    [bgview addSubview:lineBgView];
    [lineBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(investBtn.mas_bottom);
        make.left.right.equalTo(bgview);
        make.bottom.equalTo(bgview);
    }];

    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"推荐产品";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor yk_colorWithHex:0x979797];
    [lineBgView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(lineBgView);
//        make.top.equalTo(lineBgView).offset(10);
        make.centerY.equalTo(lineBgView);
    }];
    
    UIView *leftLineView = [[UIView alloc] init];
    leftLineView.backgroundColor = [UIColor yk_colorWithHex:0x979797];
    leftLineView.alpha = 0.3;
    [lineBgView addSubview:leftLineView];
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(titleLabel.mas_left).offset(-5);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(10, 1));
        
    }];
    
    UIView *rightLineView = [[UIView alloc] init];
    rightLineView.backgroundColor = [UIColor yk_colorWithHex:0x979797];
    rightLineView.alpha = 0.3;
    [lineBgView addSubview:rightLineView];
    [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(5);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(10, 1));
        
    }];
 
}
#pragma mark - 投资宝和收益票
- (void)investBtnAction{
    
    YKLog(@"跳转投资宝页面");
    
    
}

- (void)incomeBtnAction{
    YKLog(@"跳转收益票页面");
}


#pragma mark - 实现UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKMarketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMARKETCELL forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark - 实现UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKLog(@"跳转详情页");
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
