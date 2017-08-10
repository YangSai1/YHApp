//
//  SHLoginViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHLoginViewController.h"
#import "SHTextFieldLineView.h"
#import "SHThirdLoginView.h"
#import "SHRegistViewController.h"
#import "SHTabBarController.h"

@interface SHLoginViewController ()

@property(nonatomic, strong) UIImageView *logoView;

@property(nonatomic, strong) UILabel *logoLb;

@property(nonatomic, strong) UIView *middleView;

@property(nonatomic, strong) SHThirdLoginView *thirdLoginView;

@end

@implementation SHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 初始化视图
- (void)initView
{
    _logoView = [[UIImageView alloc] init];
    _logoView.image = [UIImage imageNamed:@"icon-tupian-183-221"];
    _logoView.backgroundColor = [UIColor redColor];
    _logoLb = [UILabel labelWithFont:fontCommon_18 textColor:Color(@"434344") numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _logoLb.text = @"汩汩";
    _middleView = [[UIView alloc] init];
    SHTextFieldLineView *userNameView = [[SHTextFieldLineView alloc] initWithImage:@"icon-shouji-51" placeholder:@"请输入手机号" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
    }];
    
    SHTextFieldLineView *passWordView = [[SHTextFieldLineView alloc] initWithImage:@"icon-denglumima-39" placeholder:@"请输入登陆密码" valueAction:^(NSString *value) {
        
    }];

    UIButton *loginBtn = [UIButton buttonWithTitle:@"立即登录"];
    [loginBtn addActionBlock:^(UIButton *sender) {
        
        SHTabBarController *tabbarVc = [[SHTabBarController alloc] init];
        [UIWindow currentWindow].rootViewController = tabbarVc;
        
    }];
    
    UIView *registView = [[UIView alloc] init];
    
    UIButton *registBtn = [UIButton buttonWithBackgroundColor:[UIColor clearColor] title:@"手机快速注册" titleLabelFont:fontCommon_12 titleColor:LoginTitleColer target:self action:@selector(registBtn) clipsToBounds:NO];
    
    UIButton *wangJiBtn = [UIButton buttonWithBackgroundColor:[UIColor clearColor] title:@"忘记密码" titleLabelFont:fontCommon_12 titleColor:LoginTitleColer target:self action:@selector(wangjiBtn) clipsToBounds:NO];
    UIView *registLine = [[UIView alloc] init];
    registLine.backgroundColor = Color_E5E5E5;
    
    _thirdLoginView = [[SHThirdLoginView alloc] init];
    
    [_thirdLoginView.weixinBtn addActionBlock:^(UIButton *sender) {
        [XHToast showCenterWithText:TIP_SHOW];
    }];
    
    [_thirdLoginView.qqBtn addActionBlock:^(UIButton *sender) {
        [XHToast showCenterWithText:TIP_SHOW];
    }];

    
    [self.view addSubview:_logoView];
    [self.view addSubview:_logoLb];
    
    [self.view addSubview:_middleView];
    [_middleView addSubview:userNameView];
    [_middleView addSubview:passWordView];

    [self.view addSubview:loginBtn];
    
    [self.view addSubview:registView];
    [registView addSubview:registBtn];
    [registView addSubview:registLine];
    [registView addSubview:wangJiBtn];

    [self.view addSubview:_thirdLoginView];
    __weak typeof(self) weakSelf = self;

    [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.width.height.equalTo(@(90));
        make.top.equalTo(weakSelf.view).offset(41 + 64);
    }];
    
    [_logoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.logoView.mas_bottom).offset(zScaleH(13));
    }];

    [_middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.centerY.equalTo(weakSelf.view);
        make.height.equalTo(@(116));
    }];
    
    [userNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.middleView).offset(0);
        make.bottom.equalTo(passWordView.mas_top).offset(0);
    }];
    
    [passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(58));
        make.bottom.equalTo(weakSelf.middleView).offset(0);
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(50.0f);
        make.right.equalTo(weakSelf.view).offset(-50.0f);
        make.top.equalTo(weakSelf.middleView.mas_bottom).offset(18);
    }];

    
    [registView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(loginBtn.mas_bottom).offset(22);
        make.height.equalTo(@(20));
    }];
    
    [registLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(registView);
        make.centerX.equalTo(registView);
        make.width.equalTo(@(1.0f));
    }];

    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(registLine.mas_left).offset(-20.0f);
        make.centerY.equalTo(registLine);
    }];
    
    [wangJiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(registLine.mas_right).offset(20.0f);
        make.centerY.equalTo(registLine);
    }];
    
    [_thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(registView.mas_bottom).offset(50);
        make.centerX.equalTo(registView);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(120));
    }];

}

- (void)registBtn
{
    SHRegistViewController *registVc = [[SHRegistViewController alloc] init];
    [self.navigationController pushViewController:registVc animated:YES];
}

- (void)wangjiBtn
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
