//
//  YKMarketTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/7.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMarketTableViewCell.h"

@interface YKMarketTableViewCell ()
@property(nonatomic,weak)UIImageView *imgView;



@end

@implementation YKMarketTableViewCell

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
    imgView.image = [UIImage imageNamed:@"market_cell_placehoder"];
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
   [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(self.contentView).offset(kSPACING);
       make.right.equalTo(self.contentView).offset(-kSPACING);
       make.top.equalTo(self.contentView);
       make.height.mas_equalTo(120);
   }];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.text = @"新白鹿餐厅";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:titleLabel];
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.text = @"杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱";
    descLabel.font = [UIFont systemFontOfSize:12];
    descLabel.textColor = [UIColor yk_colorWithHex:0x999999];
    descLabel.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:descLabel];

    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView);
        make.top.equalTo(imgView.mas_bottom).offset(kSPACING);
        
    }];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel);
        make.top.equalTo(titleLabel.mas_bottom).offset(3);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.equalTo(descLabel).offset(20);
    }];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
