//
//  YKProfitTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKProfitTableViewCell.h"

@interface YKProfitTableViewCell ()
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *profitLabel;

@end

@implementation YKProfitTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupUI];
}
#pragma mark - 搭建界面
- (void)setupUI{
    [self.contentView addSubview:self.bgImageView];
    self.bgImageView.image = self.image;
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(kH(27.0, 110.0));
    }];
    
    
    [self.contentView addSubview:self.profitLabel];
    [self.profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(-kH(26.0, 110.0));
        make.centerX.equalTo(self.contentView);
    }];
}
- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
    }
    return _bgImageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel yk_labelWithText:@"投资宝收益" fontSize:24 textColor:[UIColor yk_colorWithHex:0xffffff]];
        _titleLabel.hidden = YES;
    }
    return _titleLabel;
}
- (UILabel *)profitLabel
{
    if (!_profitLabel) {
        NSString *profitStr = [NSString stringWithFormat:@"昨日：+170元"];
        _profitLabel = [UILabel yk_labelWithText:profitStr fontSize:14 textColor:[UIColor yk_colorWithHex:0xffffff]];
        _profitLabel.hidden = YES;

    }
    return _profitLabel;
}

@end
