//
//  YKShowDetailTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/14.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKShowDetailTableViewCell.h"

@interface YKShowDetailTableViewCell ()
@property(nonatomic,weak)UILabel *profitLabel;
@property(nonatomic,weak)UIImageView *iconImageView;
@property(nonatomic,weak)UILabel *timeLabel;
@property(nonatomic,weak)UILabel *balanceLabel;
@property(nonatomic,weak)UILabel *storeLabel;
@property(nonatomic,weak)UILabel *typeLabel;



@end

@implementation YKShowDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"balance_showdetail_icon"];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING);
        make.top.equalTo(self.contentView).offset(kSPACING+5);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    
    UILabel *profitLabel = [UILabel yk_labelWithText:@"+666" fontSize:14 textColor:[UIColor yk_colorWithHex:0x333333]];
    [self.contentView addSubview:profitLabel];
    self.profitLabel = profitLabel;
    [profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_right).offset(kSPACING);
        make.top.equalTo(iconImageView);
    }];
    UILabel *timeLabel = [UILabel yk_labelWithText:@"2017-3-6" fontSize:10 textColor:[UIColor yk_colorWithHex:0x999999]];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(profitLabel);
        make.top.equalTo(profitLabel.mas_bottom).offset(2);
    }];
    
    UILabel * titleLabel = [UILabel yk_labelWithText:@"余额:" fontSize:12 textColor:[UIColor yk_colorWithHex:0x666666]];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kSPACING*6);
        make.top.equalTo(self.contentView).offset(kSPACING+5);
    }];
    
    UILabel *balanceLabel = [UILabel yk_labelWithText:@"666" fontSize:12 textColor:[UIColor yk_colorWithHex:0x666666]];
    [self.contentView addSubview:balanceLabel];
    self.balanceLabel = balanceLabel;
    [balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(kSPACING*0.5);
        make.top.equalTo(titleLabel);
        make.right.equalTo(self.contentView).offset(-kSPACING);
    }];
    
    UILabel *typeLabel = [UILabel yk_labelWithText:@"收益票收入" fontSize:10 textColor:[UIColor yk_colorWithHex:0x999999]];
    [typeLabel sizeToFit];
    [self.contentView addSubview:typeLabel];
    self.typeLabel = typeLabel;
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(balanceLabel);
        make.top.equalTo(balanceLabel.mas_bottom).offset(kSPACING);
    }];
    
    UILabel *storeLabel = [UILabel yk_labelWithText:@"外婆家（湖滨店）" fontSize:10 textColor:[UIColor yk_colorWithHex:0x999999]];
    [self.contentView addSubview:storeLabel];
    self.storeLabel = storeLabel;
    [storeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(typeLabel.mas_left);
        make.top.equalTo(typeLabel);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];

    
}


@end
