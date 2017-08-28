//
//  SHChangePasswordViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHChangePasswordViewController.h"
#import "SHMineImageTextFieldView.h"

@interface SHChangePasswordViewController ()

@end

@implementation SHChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    [self initView];
    [self initData];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;

    SHMineImageTextFieldView *oldPassWordM = [[SHMineImageTextFieldView alloc] init];
    oldPassWordM.lineView.hidden = YES;
    [oldPassWordM registBlock:^(NSString *title) {
        
    }];
    [oldPassWordM setImage:@"icon-denglumima-39" placeholder:@"旧密码"];
    
    SHMineImageTextFieldView *passWordM = [[SHMineImageTextFieldView alloc] init];
    [passWordM registBlock:^(NSString *title) {
        
    }];
    [passWordM setImage:@"icon-denglumima-39" placeholder:@"新密码"];

    SHMineImageTextFieldView *againPassWordM = [[SHMineImageTextFieldView alloc] init];
    againPassWordM.lineView.hidden = YES;
    [againPassWordM registBlock:^(NSString *title) {
        
    }];
    [againPassWordM setImage:@"icon-denglumima-39" placeholder:@"确认新密码"];

    [self.view addSubview:oldPassWordM];
    [self.view addSubview:passWordM];
    [self.view addSubview:againPassWordM];

    [oldPassWordM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(10));
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [passWordM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldPassWordM.mas_bottom).offset(zScaleH(10));
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(50)));
    }];

    [againPassWordM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passWordM.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(50)));
    }];

}

- (void)initData
{
    
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
