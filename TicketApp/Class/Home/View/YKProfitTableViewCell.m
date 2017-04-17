//
//  YKProfitTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKProfitTableViewCell.h"

@implementation YKProfitTableViewCell

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
    bgImageView.image = [UIImage imageNamed:@"home_income_bg"];
    [self.contentView addSubview:bgImageView];
    self.bgImageView = bgImageView;
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];
    
    UILabel *titleLabel = [UILabel yk_labelWithText:@"投资宝收益" fontSize:24 textColor:[UIColor yk_colorWithHex:0xffffff]];
    titleLabel.hidden = YES;
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(27);
    }];
    
    NSString *profitStr = [NSString stringWithFormat:@"昨日：+170元"];
    UILabel *profitLabel = [UILabel yk_labelWithText:profitStr fontSize:14 textColor:[UIColor yk_colorWithHex:0xffffff]];
    profitLabel.hidden = YES;
    [self.contentView addSubview:profitLabel];
    [profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(-26);
        make.centerX.equalTo(self.contentView);
    }];
    
}


@end
