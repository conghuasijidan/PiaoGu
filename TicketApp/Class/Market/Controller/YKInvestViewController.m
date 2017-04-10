//
//  YKInvestViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/10.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKInvestViewController.h"
#import "YKInvestTableViewCell.h"

#define kHEADERHEIGHT 70

@interface YKInvestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView *investTableView;


@end

@implementation YKInvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"投资宝";
    [self setupUI];
    
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    UITableView *investTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    investTableView.backgroundColor = [UIColor whiteColor];
    investTableView.dataSource = self;
    investTableView.delegate = self;
    [investTableView registerClass:[YKInvestTableViewCell class] forCellReuseIdentifier:YKINVESTCELL];
    investTableView.rowHeight = 135;
    // 去掉表格分割线
//    investTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:investTableView];
    self.investTableView = investTableView;
    
    [self setupHeaderView];
}
#pragma mark - 搭建头部视图
- (void)setupHeaderView{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], kHEADERHEIGHT)];
    headerView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    self.investTableView.tableHeaderView = headerView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"产品介绍";
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = [UIColor yk_colorWithHex:0x666666];
    [titleLabel sizeToFit];
    [headerView addSubview:titleLabel];
    
    UILabel *descLabel = [[UILabel alloc] init];
    NSString *textStr = @"商家以一定定额年息，获取粉丝投资资金，以不同时间段为单位发行不同的产品。投资散户可以选择以现金+代金券的形式保证年化收益保本息。";
    descLabel.font = [UIFont systemFontOfSize:10];
    descLabel.numberOfLines = 0;
    descLabel.textColor = [UIColor yk_colorWithHex:0x999999];
    
    // 调整行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:2];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [textStr length])];
    descLabel.attributedText = attributedString;
    
    [headerView addSubview:descLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(kSPACING);
        make.top.equalTo(headerView).offset(kSPACING);
    }];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel);
        make.top.equalTo(titleLabel.mas_bottom);
        make.right.equalTo(headerView).offset(-kSPACING);
        make.bottom.equalTo(headerView).offset(-kSPACING);
    }];
    
}


#pragma mark -UITableViewDelegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKInvestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKINVESTCELL forIndexPath:indexPath];
    
    return cell;
}




@end
