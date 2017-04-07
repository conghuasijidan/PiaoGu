//
//  TabBarViewController.m
//  YueShiJia
//
//  Created by 葱花思鸡蛋 on 2017/3/1.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import "TabBarViewController.h"
#import "YKNavController.h"
#import "YKHomeViewController.h"
#import "YKMarketViewController.h"
#import "YKMeViewController.h"

@interface TabBarViewController ()<UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setChildViewControllers];
    // 改变tabBar的字体颜色
    //   
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor yk_colorWithHex:0x999999],NSForegroundColorAttributeName,nil]forState:UIControlStateSelected];
    // 未选中时字体颜色0xFFEEDD
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor yk_colorWithHex:0x999999],NSForegroundColorAttributeName,nil]forState:UIControlStateNormal];
    // 设置item位置的样式
    self.tabBar.itemPositioning = UITabBarItemPositioningCentered;
    //以下属性需要设置Centered样式才有作用，否则无效
    self.tabBar.itemSpacing = 134.0f;
    //设置item.title位置偏移
    UIOffset offset;
    offset.horizontal = 0;
    offset.vertical = -3;
    for (UITabBarItem *item in self.tabBar.items) {
        [item setTitlePositionAdjustment:offset];
    }
    

}




- (void)setChildViewControllers{
    
    NSArray* array = @[
                       @{
                           @"className" : @"YKHomeViewController",
                           @"title" : @"首页",
                           @"imageName" : @"home_tabBar_normal",
                           @"imageName_selected" : @"home_tabBar_selected"
                           },
                       @{
                           @"className" : @"YKMarketViewController",
                           @"title" : @"市场",
                           @"imageName" : @"market_tabBar_normal",
                           @"imageName_selected" : @"market_tabBar_selected"
                           },
                       
                       @{
                           @"className" : @"YKMeViewController",
                           @"title" : @"我的",
                           @"imageName" : @"me_tabBar_normal",
                           @"imageName_selected" : @"me_tabBar_selected"
                           }
                       ];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        UIViewController *vc =  [self createViewControllerWithDict:dict];
        [arrayM addObject:vc];
    }

    
    self.viewControllers = arrayM.copy;
    
}
- (UIViewController *)createViewControllerWithDict:(NSDictionary *)dict{
    
    Class className = NSClassFromString(dict[@"className"]);
    
    UIViewController *viewController = [[className alloc] init];
    
    viewController.title = dict[@"title"];
//    YKLog(@"%@",[viewController class]  );
//    viewController.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"food+"]];
    viewController.tabBarItem.image = [[UIImage imageNamed:dict[@"imageName"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:dict[@"imageName_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    YKNavController *nav = [[YKNavController alloc] initWithRootViewController:viewController];
    viewController.navigationItem.title = @"首页";
    return nav;
}


@end
