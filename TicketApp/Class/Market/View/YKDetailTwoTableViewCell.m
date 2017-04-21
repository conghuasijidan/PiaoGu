//
//  YKDetailTwoTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/20.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKDetailTwoTableViewCell.h"

@interface YKDetailTwoTableViewCell ()

@property(nonatomic,strong)UILabel *profitPercentLabel;
@property(nonatomic,strong)UILabel *profitLabel;
@property(nonatomic,strong)UILabel *singleMoneyLabel;
@property(nonatomic,strong)UILabel *singleLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *verticalView;

@end
@implementation YKDetailTwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    [self.contentView addSubview:self.verticalView];
    [self.contentView addSubview:self.lineView];
    
    [self.contentView addSubview:self.profitPercentLabel];
    [self.contentView addSubview:self.profitLabel];
    [self.contentView addSubview:self.singleMoneyLabel];
    [self.contentView addSubview:self.singleLabel];
   
    // 竖线
    [self.verticalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(1);
    }];
    [self.profitPercentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX).multipliedBy(0.5);
        make.top.equalTo(self.contentView).offset(20);
    }];
    [self.profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.profitPercentLabel);
        make.top.equalTo(self.profitPercentLabel.mas_bottom);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];
    [self.singleMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX).multipliedBy(1.5);
        make.top.equalTo(self.profitPercentLabel);
    }];
    [self.singleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.singleMoneyLabel);
        make.top.equalTo(self.profitLabel);
    }];
    // 分割线
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
}

#pragma mark - 控件
- (UIView *)verticalView
{
    if (!_verticalView) {
        _verticalView = [[UIView alloc] init];
        _verticalView.backgroundColor = [UIColor yk_colorWithRed:153 green:153 blue:153 alpha:.2];
    }
    return _verticalView;
}
- (UILabel *)profitPercentLabel
{
    if (!_profitPercentLabel) {
        _profitPercentLabel = [UILabel yk_labelWithText:@"4.65%" fontSize:36 textColor:[UIColor yk_colorWithRed:234 green:23 blue:63 alpha:1]];
    }
    return _profitPercentLabel;
}
- (UILabel *)profitLabel
{
    if (!_profitLabel) {
        _profitLabel = [UILabel yk_labelWithText:@"收益率" fontSize:14 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _profitLabel;
}
- (UILabel *)singleMoneyLabel
{
    if (!_singleMoneyLabel) {
        _singleMoneyLabel = [UILabel yk_labelWithText:@"100元" fontSize:36 textColor:[UIColor yk_colorWithRed:234 green:23 blue:63 alpha:1]];
    }
    return _singleMoneyLabel;
}
- (UILabel *)singleLabel
{
    if (!_singleLabel) {
        _singleLabel = [UILabel yk_labelWithText:@"每份金额" fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _singleLabel;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor yk_colorWithRed:153 green:153 blue:153 alpha:.2];
    }
    return _lineView;
}
@end
