//
//  YKMarketTableViewCell.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/7.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMarketTableViewCell.h"

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
    self.backgroundColor = [UIColor yk_randomColor];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
