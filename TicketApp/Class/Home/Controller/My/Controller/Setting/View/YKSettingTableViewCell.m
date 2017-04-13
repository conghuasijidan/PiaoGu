//
//  YKSettingTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKSettingTableViewCell.h"

@implementation YKSettingTableViewCell

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
    titleLab.textColor = [UIColor yk_colorWithHex:0x333333];
    titleLab.text = @"消息设置";
    [self.contentView addSubview:titleLab];
    self.titleLab = titleLab;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"me_rightArrow"];
    [self.contentView addSubview:arrowImageView];

    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSPACING+5);
        make.centerY.equalTo(self.contentView);
    }];
    
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kSPACING);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(8, 14));
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
