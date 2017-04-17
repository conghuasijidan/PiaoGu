//
//  YKNiNameViewController.m
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/4/17.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

#import "YKNiNameViewController.h"

@interface YKNiNameViewController ()
@property(nonatomic,weak)UITextField *textField;

@end

@implementation YKNiNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"昵称";
    [self setupUI];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTintColor:[UIColor yk_colorWithHex:0xffffff]];
    [button addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = saveItem;
    
}
#pragma mark - 搭建界面
- (void)setupUI{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [self.view addSubview:tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:self.view.bounds];
    headerView.backgroundColor = [UIColor whiteColor];
    tableView.tableHeaderView = headerView;
    tableView.tableFooterView = [[UIView alloc] init];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor yk_colorWithHex:0xf5f5f5];
    [headerView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headerView);
        make.top.equalTo(headerView);
        make.height.mas_equalTo(10);
    }];
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"昵称长度2-6个字";
    [textField setValue:[UIColor yk_colorWithHex:0x999999]forKeyPath:@"_placeholderLabel.textColor"];
    textField.font = [UIFont systemFontOfSize:14];
    [textField addTarget:self action:@selector(textFieldChangedAction) forControlEvents:UIControlEventEditingChanged];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.keyboardType = UIKeyboardTypeDefault;
    [headerView addSubview:textField];
    self.textField = textField;
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(10);
        make.top.equalTo(bgView.mas_bottom).offset(15);
        make.right.equalTo(headerView).offset(-kSPACING);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor yk_colorWithHex:0x999999];
    lineView.alpha = 0.2;
    [headerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headerView);
        make.top.equalTo(textField.mas_bottom).offset(15);
        make.height.mas_equalTo(1);
    }];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction)];
    [headerView addGestureRecognizer:tapRecognizer];
}
- (void)tapGestureAction{
    [self.textField resignFirstResponder];
}

#pragma mark - textField change
- (void)textFieldChangedAction{
    if (self.textField.text.length > 18) {
       self.textField.text = [self.textField.text substringToIndex:18];
    }
}

#pragma mark - 保存用户信息
- (void)saveAction{
    YKLog(@"保存用户信息");
}
@end
