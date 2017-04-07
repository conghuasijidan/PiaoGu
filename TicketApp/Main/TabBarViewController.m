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

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setChildViewControllers];
    // 改变tabBar的字体颜色
    //   RGB（216 186 146）
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName,nil]forState:UIControlStateSelected];
    // 未选中时字体颜色（146 146 146）
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor yk_colorWithHex:999999],NSForegroundColorAttributeName,nil]forState:UIControlStateNormal];
    
}
- (void)setChildViewControllers{
    
    NSArray* array = @[
                       @{
                           @"className" : @"YKHomeViewController",
                           @"title" : @"首页",
                           @"imageName" : @"home",
                           @"imageName_selected" : @"home_press"
                           },
                       @{
                           @"className" : @"YKMarketViewController",
                           @"title" : @"市场",
                           @"imageName" : @"special",
                           @"imageName_selected" : @"special_press"
                           },
                       
                       @{
                           @"className" : @"YKMeViewController",
                           @"title" : @"我",
                           @"imageName" : @"me",
                           @"imageName_selected" : @"me_press"
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
    
    return nav;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
