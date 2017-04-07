//
//  YKNavController.m
//  YueShiJia
//
//  Created by 葱花思鸡蛋 on 2017/3/1.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import "YKNavController.h"
#import "YKHomeViewController.h"
#import "YKMarketViewController.h"
#import "YKMeViewController.h"
@interface YKNavController ()<UINavigationControllerDelegate>

@end

@implementation YKNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
}
// 先走的是代理方法后走的是各个控制器的viewDidLoad方法
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //设置每个控制器的title
    if ([viewController isKindOfClass:[YKHomeViewController class]]) {
        viewController.navigationItem.title = @"首页";
//        viewController.navigationItem
        
    }else if ([viewController isKindOfClass:[YKMarketViewController class]])
    {
        viewController.navigationItem.title = @"票谷";
    }else {
        viewController.navigationItem.title = @"我";
    }
    [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_background_image"] forBarMetrics:UIBarMetricsDefault];
    viewController.navigationController.navigationBar.translucent = NO;
    viewController.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    
}



- (void)searchAction{
    
//    YKLog(@"搜索按钮被点击了");
    
    
}
@end
