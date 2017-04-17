//
//  YKAccountTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKAccountTableViewCell.h"

@implementation YKAccountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.image = [UIImage imageNamed:@"home_account_bg"];
    [self.contentView addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];
    
    UIImageView *circleImageView = [[UIImageView alloc] init];
    circleImageView.image = [UIImage imageNamed:@"home_account_circle_bg"];
    [self.contentView addSubview:circleImageView];
    [circleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(92);
        make.top.equalTo(self.contentView).offset(42);
        make.size.mas_equalTo(CGSizeMake(191, 188));
    }];
    UILabel *accountLabel = [UILabel yk_labelWithText:@"账户余额（元）" fontSize:12 textColor:[UIColor yk_colorWithHex:0xffffff]];
    [self.contentView addSubview:accountLabel];
    [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(2*kSPACING);
        make.top.equalTo(self.contentView).offset(kSPACING);
    }];
    
    NSString *profitStr = [NSString stringWithFormat:@"昨日：+350元"];
    UILabel *profitLabel = [UILabel yk_labelWithText:profitStr fontSize:12 textColor:[UIColor yk_colorWithHex:0xffffff]];
    [self.contentView addSubview:profitLabel];
    [profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(circleImageView);
        make.top.equalTo(circleImageView).offset(58);
    }];
    UILabel *balanceLabel = [UILabel yk_labelWithText:@"666666.66" fontSize:30 textColor:[UIColor yk_colorWithHex:0xffffff]];
    [self.contentView addSubview:balanceLabel];
    [balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(circleImageView);
        make.top.equalTo(profitLabel.mas_bottom).offset(kSPACING);
    }];
    
    UIButton *detailButton = [[UIButton alloc] init];
    [detailButton setTitle:@"查看详情" forState:UIControlStateNormal];
    detailButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [detailButton addTarget:self action:@selector(detailButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:detailButton];
    //    messageButton
    [detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(circleImageView);
        make.top.equalTo(balanceLabel.mas_bottom);
    }];
    

    
}
- (void)detailButtonAction{
    YKLog(@"查看详情");
}

@end
