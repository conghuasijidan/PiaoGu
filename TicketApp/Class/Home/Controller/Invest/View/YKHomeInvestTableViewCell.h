//
//  YKHomeInvestTableViewCell.h
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/19.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKHomeInvestTableViewCell : UITableViewCell
@property(nonatomic,copy)void (^detailBlock)(NSString *model);


@end
