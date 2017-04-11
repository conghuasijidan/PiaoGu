//
//  YKInvestTableViewCell.h
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/10.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKInvestTableViewCell : UITableViewCell
// 跳转产品详情页 传递model数据
@property(nonatomic,copy)void (^detailBlock)(NSString *model);


@end
