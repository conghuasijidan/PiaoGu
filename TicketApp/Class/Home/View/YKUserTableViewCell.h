//
//  YKUserTableViewCell.h
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKUserTableViewCell : UITableViewCell

@property(nonatomic,copy)void (^meCallBack)();
@property(nonatomic,copy)void (^messageCallBack)();


@end
