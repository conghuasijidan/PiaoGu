//
//  YKInforTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKInforTableViewCell.h"

@implementation YKInforTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textColor = [UIColor yk_colorWithHex:0x000000];
    titleLab.text = @"头像";
    [self.contentView addSubview:titleLab];
    self.titleLab = titleLab;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"me_rightArrow"];
    [self.contentView addSubview:arrowImageView];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    [iconImageView setHidden:YES];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.textAlignment = NSTextAlignmentRight;
    contentLabel.textColor = [UIColor yk_colorWithHex:0x666666];
    contentLabel.font = [UIFont systemFontOfSize:12];
//    contentLabel.text = @"";
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING+5);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(30);
    }];
    
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kSPACING);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(8, 14));
    }];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(arrowImageView.mas_left).offset(-kSPACING+2);
        make.centerY.equalTo(arrowImageView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(arrowImageView.mas_left).offset(-kSPACING+2);
        make.centerY.equalTo(arrowImageView);
        make.left.equalTo(titleLab.mas_right).offset(2*kSPACING);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    
}



@end
