//
//  YKHomeInvestTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/19.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeInvestTableViewCell.h"

@interface YKHomeInvestTableViewCell ()
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *storeLabel;
@property(nonatomic,strong)UILabel *buyDateLabel;
@property(nonatomic,strong)UIButton *detailButton;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *totalProfitLabel;


@end

@implementation YKHomeInvestTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupUI];
}
#pragma mark - 搭建界面
- (void)setupUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.storeLabel];
    [self.contentView addSubview:self.buyDateLabel];
    [self.contentView addSubview:self.totalProfitLabel];
    [self.contentView addSubview:self.detailButton];
    [self.contentView addSubview:self.lineView];

    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kW(kSPACING));
        make.top.equalTo(self.contentView).offset(kH(20, 135.0));
        make.right.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.contentView).offset(-kH(20, 135.0));
    }];
    [self.storeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(kW(kSPACING));
        make.top.equalTo(self.imgView);
    }];
    [self.buyDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeLabel);
        make.top.equalTo(self.storeLabel.mas_bottom).offset(kH(5.0, 135.0));
    }];
    [self.totalProfitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeLabel);
        make.top.equalTo(self.buyDateLabel.mas_bottom).offset(kH(5.0, 135.0));
    }];
    [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kW(20));
        make.bottom.equalTo(self.imgView);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];

}
- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.image = [UIImage imageNamed:@"investcell_img_placehoder"];

    }
    return _imgView;
}
- (UILabel *)storeLabel
{
    if (!_storeLabel) {
        _storeLabel = [UILabel yk_labelWithText:@"新白鹿餐厅" fontSize:14 textColor:[UIColor blackColor]];
    }
    return _storeLabel;
}
- (UILabel *)buyDateLabel
{
    if (!_buyDateLabel) {
        NSString *textStr = @"购入日期：2017年4月10日";
        _buyDateLabel = [UILabel yk_labelWithText:textStr fontSize:12 textColor:[UIColor yk_colorWithHex:0x999999]];
    }
    return _buyDateLabel;
}
- (UILabel *)totalProfitLabel
{
    if (!_totalProfitLabel) {
        _totalProfitLabel = [UILabel yk_labelWithText:@"+178元" fontSize:20 textColor:[UIColor redColor]];
    }
    return _totalProfitLabel;
}

- (UIButton *)detailButton
{
    if (!_detailButton) {
        _detailButton = [[UIButton alloc] init];
        [_detailButton setTitle:@"查看详情" forState:UIControlStateNormal];
        _detailButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_detailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"invest_detal_rightArrow"];
        [_detailButton addTarget:self action:@selector(detailButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [_detailButton setImage:image forState:UIControlStateNormal];
        float labelWidth = 55;
        [_detailButton setImageEdgeInsets:UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth)];
        [_detailButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -image.size.width, 0, image.size.width)];
        [_detailButton sizeToFit];

    }
    return _detailButton;
}
- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    }
    return _lineView;
}
#pragma mark - button Action
- (void)detailButtonAction
{
    if (self.detailBlock != nil) {
        NSString *model = @"我是model";
        self.detailBlock(model);
    }
}

@end
