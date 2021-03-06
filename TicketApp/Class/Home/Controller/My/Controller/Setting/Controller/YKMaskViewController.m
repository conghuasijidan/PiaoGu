//
//  YKMaskViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/12.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKMaskViewController.h"
#import "YKMaskTableViewCell.h"
#define kScale (226.0/667.0)
#define kFOOTERHEIGHT 26
@interface YKMaskViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)YKMaskTableViewCell *selectedCell;


@end

@implementation YKMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yk_colorWithHex:0x666666];
    self.view.alpha = 0.5;
    [self setupUI];
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    float y = [UIScreen yk_screenHeight]-[UIScreen yk_screenHeight]*kScale;
    UITableView *maskTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, y, [UIScreen yk_screenWidth], [UIScreen yk_screenHeight]*kScale) style:UITableViewStylePlain];
    maskTableView.backgroundColor = [UIColor whiteColor];
    maskTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    maskTableView.dataSource = self;
    maskTableView.delegate = self;
    [maskTableView registerClass:[YKMaskTableViewCell class] forCellReuseIdentifier:YKMASKCELL];
    maskTableView.rowHeight = 50/226.0*maskTableView.bounds.size.height;
    [self.view addSubview:maskTableView];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen yk_screenWidth], kFOOTERHEIGHT)];
    footerView.backgroundColor = [UIColor whiteColor];
    maskTableView.tableFooterView = footerView;
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.text = @"WIFI下自动5秒刷新";
    textLabel.textColor = [UIColor yk_colorWithHex:0x666666];
    textLabel.font = [UIFont systemFontOfSize:12];
    [footerView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(footerView);
    }];
    
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKMaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YKMASKCELL forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.title = @"5秒";
        
    }else if (indexPath.row == 1){
        cell.title = @"15秒";

        
    }else if (indexPath.row == 2){
        cell.title = @"30秒";

        
    }else if (indexPath.row == 3){
        cell.title = @"60秒";
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedCell.selectedState = NO;
    
   YKMaskTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.selectedCell = cell ;
    cell.selectedState = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
