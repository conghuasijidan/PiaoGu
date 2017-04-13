//
//  YKHomeMeTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKHomeMeTableViewCell.h"

@implementation YKHomeMeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"me_kefu"];
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING);
        make.top.equalTo(self.contentView).offset(kSPACING+5);
        make.size.mas_equalTo(CGSizeMake(kSPACING*2, kSPACING*2));
    }];
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.text = @"个人信息";
    descLabel.font = [UIFont systemFontOfSize:14];
    descLabel.textColor = [UIColor yk_colorWithHex:0x333333];
    [self.contentView addSubview:descLabel];
    self.descLabel = descLabel;
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(kSPACING);
        make.centerY.equalTo(imgView);
        make.width.mas_equalTo(kSPACING*10);
    }];
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"me_rightArrow"];
    [self.contentView addSubview:arrowImageView];
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(imgView);
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
