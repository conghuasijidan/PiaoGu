//
//  YKAccountTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKAccountTableViewCell.h"

@interface YKAccountTableViewCell ()
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UIImageView *circleImageView;
@property(nonatomic,strong)UILabel *accountLabel;
@property(nonatomic,strong)UILabel *profitLabel;
@property(nonatomic,strong)UIButton *detailButton;
@property(nonatomic,strong)UILabel *balanceLabel;



@end

@implementation YKAccountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self setupUI];
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    [self.contentView addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];

    [self.contentView addSubview:self.circleImageView];
    [self.circleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kW(191.0), kW(192.0)));
    }];

    [self.contentView addSubview:self.accountLabel];
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kW(2*kSPACING));
        make.top.equalTo(self.contentView).offset(kH(kSPACING, 274.0));
    }];
    
    [self.contentView addSubview:self.profitLabel];
    [self.profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(kH(100, 274.0));
    }];

    [self.contentView addSubview:self.balanceLabel];
    [self.balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.profitLabel.mas_bottom).offset(kH(kSPACING, 274.0));
    }];
    
    [self.contentView addSubview:self.detailButton];
    [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView).offset(-5);
        make.top.equalTo(self.balanceLabel.mas_bottom);
    }];
    

    
}
- (void)detailButtonAction{
    YKLog(@"查看详情");
    if (self.balanceCallBack != nil) {
        self.balanceCallBack();
    }
}
#pragma mark - 懒加载
- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"home_account_bg"];
    }
    return _bgImageView;
}

- (UIImageView *)circleImageView
{
    if (!_circleImageView) {
        _circleImageView = [[UIImageView alloc] init];
        _circleImageView.image = [UIImage imageNamed:@"home_account_circle_bg"];
    }
    return _circleImageView;
}
- (UILabel *)accountLabel
{
    if (!_accountLabel) {
        _accountLabel = [UILabel yk_labelWithText:@"账户余额（元）" fontSize:12 textColor:[UIColor yk_colorWithHex:0xffffff]];
    }
    return _accountLabel;
}
- (UILabel *)profitLabel
{
    if (!_profitLabel) {
        NSString *profitStr = [NSString stringWithFormat:@"昨日：+350元"];
        _profitLabel = [UILabel yk_labelWithText:profitStr fontSize:12 textColor:[UIColor yk_colorWithHex:0xffffff]];
    }
    return _profitLabel;
}
- (UILabel *)balanceLabel
{
    if (!_balanceLabel) {
        _balanceLabel = [UILabel yk_labelWithText:@"666666.66" fontSize:30 textColor:[UIColor yk_colorWithHex:0xffffff]];
    }
    return _balanceLabel;
}
- (UIButton *)detailButton
{
    if (!_detailButton) {
        _detailButton = [[UIButton alloc] init];
        [_detailButton setTitle:@"查看详情" forState:UIControlStateNormal];
        _detailButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_detailButton addTarget:self action:@selector(detailButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detailButton;
}
@end
