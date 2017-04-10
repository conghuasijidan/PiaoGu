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
       make.left.equalTo(self.contentView).offset(5);
       make.right.equalTo(self.contentView).offset(-5);
       make.top.equalTo(self.contentView);
       make.height.mas_equalTo(120);
   }];

}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
