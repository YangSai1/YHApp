//
//  SHForgetPasswordSubViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHForgetPasswordSubViewController.h"

@interface SHForgetPasswordSubViewController ()<UITextFieldDelegate>

@property(nonatomic, strong) UITextField *passWordF;

@property(nonatomic, strong) UITextField *againPassWordF;


@end

@implementation SHForgetPasswordSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    [self initView];
    [self initData];

    // Do any additional setup after loading the view.
}

- (void)initView
{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = white_ffffff;
    
    UIImageView *passWordFleftImage = [[UIImageView alloc] init];
    passWordFleftImage.image = [UIImage imageNamed:@"icon-denglumima-39"];
    
    _passWordF = [[UITextField alloc] init];
    _passWordF.placeholder = @"新密码";
    _passWordF.textColor = Color_333333;
    _passWordF.font = font_15;
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    
    UIImageView *againPassWordFleftImage = [[UIImageView alloc] init];
    againPassWordFleftImage.image = [UIImage imageNamed:@"icon-denglumima-39"];
    _againPassWordF = [[UITextField alloc] init];
    _againPassWordF.placeholder = @"确认新密码";
    _againPassWordF.textColor = Color_333333;
    _againPassWordF.font = font_15;
    
    
    UIButton *submitB = [UIButton buttonWithTitle:@"提交修改"];
    [submitB addActionBlock:^(UIButton *sender) {
        NSLog(@"验证");
        
    }];
    
    [self.view addSubview:bgView];
    [bgView addSubview:_passWordF];
    [bgView addSubview:_againPassWordF];
    
    [bgView addSubview:passWordFleftImage];
    [bgView addSubview:againPassWordFleftImage];

    [bgView addSubview:lineView];
    [self.view addSubview:submitB];
    
    __weak typeof(self) weakSelf = self;
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleW(15));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-15));
        make.top.equalTo(weakSelf.view).offset(zScaleH(10));
        make.height.equalTo(@(zScaleH(100)));
    }];
    
    [passWordFleftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(5);
        make.height.width.equalTo(@(zScaleH(20)));
        make.centerY.equalTo(bgView).offset(zScaleH(-25));
    }];
    
    [_passWordF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(40));
        make.height.equalTo(@(zScaleH(30)));
        make.right.equalTo(bgView).offset(zScaleW(-30));
        make.centerY.equalTo(bgView).offset(zScaleH(-25));
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(10));
        make.right.equalTo(bgView).offset(zScaleW(-10));
        make.centerY.equalTo(bgView);
        make.height.equalTo(@(1.0));
    }];
    
    [againPassWordFleftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passWordFleftImage);
        make.height.width.equalTo(@(zScaleH(20)));
        make.centerY.equalTo(bgView).offset(zScaleH(25));
    }];

    [_againPassWordF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(40));
        make.height.equalTo(@(zScaleH(30)));
        make.right.equalTo(bgView).offset(zScaleW(-30));
        make.centerY.equalTo(bgView).offset(zScaleH(25));
    }];
    
    [submitB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(zScaleW(30));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-30));
        make.centerY.equalTo(weakSelf.view).offset(zScaleH(5));
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
