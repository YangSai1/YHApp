//
//  SHRegistViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHRegistViewController.h"
#import "SHTextFieldLineView.h"

#import "JBVerifyCodeView.h"

@interface SHRegistViewController ()

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) UIButton *agreeImageView;

@end

@implementation SHRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    
    [self initView];
    
    // Do any additional setup after loading the view.
}

- (void)initView
{
    _bgView = [[UIView alloc] init];
    
    SHTextFieldLineView *userNameView = [[SHTextFieldLineView alloc] initWithImage:@"icon-mincheng-51" placeholder:@"请输入姓名或者昵称(最多10个字符)" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
    }];
    
    SHTextFieldLineView *iphoneView = [[SHTextFieldLineView alloc] initWithImage:@"icon-shouji-51" placeholder:@"请输入手机号" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
    }];
    
    JBVerifyCodeView *iphoneCodeView = [[JBVerifyCodeView alloc] init];
    [iphoneCodeView setSendVerifyCodeBlock:^BOOL(JBCountdownAsBtnView *countdownBtn) {
        
        DLog(@"发送验证码");
        
        return YES;
    }];
    
    SHTextFieldLineView *passWordView = [[SHTextFieldLineView alloc] initWithImage:@"icon-denglumima-39" placeholder:@"6 - 20位字符,建议有字母和数字组成" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
    }];
    
    SHTextFieldLineView *againPassWordView = [[SHTextFieldLineView alloc] initWithImage:@"icon-denglumima-39" placeholder:@"请再次输入密码" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
    }];
    
    
    UIView *agreeBtn = [[UIView alloc] init];
    
    
    
    _agreeImageView = [[UIButton alloc] init];
    [_agreeImageView setImage:[UIImage imageNamed:@"icon-34"] forState:UIControlStateNormal];
    [_agreeImageView setImage:[UIImage imageNamed:@"icon-34-34"] forState:UIControlStateSelected];

    [_agreeImageView addActionBlock:^(UIButton *sender) {
        sender.selected = !sender.selected;
    }];
    
    UIButton *agreeLb = [UIButton buttonWithBackgroundColor:[UIColor clearColor] title:@"同意汩汩注册协议" titleLabelFont:font_12 titleColor:LoginTitleColer target:nil action:nil clipsToBounds:NO];
    
    [agreeLb addActionBlock:^(UIButton *sender) {
        
    }];
    
    UIView *agreeLine = [[UIView alloc] init];
    agreeLine.backgroundColor = Color(@"007aff");
    
    
    UIButton *nextBtn = [UIButton buttonWithTitle:@"下一步"];
    [nextBtn addActionBlock:^(UIButton *sender) {
        DLog(@"下一步");
    }];
    
    [self.view addSubview:_bgView];
    [_bgView addSubview:userNameView];
    [_bgView addSubview:iphoneView];
    [_bgView addSubview:iphoneCodeView];
    [_bgView addSubview:passWordView];
    [_bgView addSubview:againPassWordView];
    [self.view addSubview:agreeBtn];
    [agreeBtn addSubview:_agreeImageView];
    [agreeBtn addSubview:agreeLb];
    [agreeBtn addSubview:agreeLine];

    [self.view addSubview:nextBtn];
    
    __weak typeof(self) weakSelf = self;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(64 + 40);
        make.left.right.equalTo(weakSelf.view);
        make.bottom.equalTo(againPassWordView.mas_bottom);
    }];
    
    [userNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bgView);
        make.left.right.equalTo(weakSelf.bgView);
        make.height.equalTo(@(58));
    }];
    
    [iphoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userNameView.mas_bottom);
        make.left.right.equalTo(weakSelf.bgView);
        make.height.equalTo(@(58));
    }];

    [iphoneCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iphoneView.mas_bottom);
        make.left.right.equalTo(weakSelf.bgView);
        make.height.equalTo(@(58));
    }];

    [passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iphoneCodeView.mas_bottom);
        make.left.right.equalTo(weakSelf.bgView);
        make.height.equalTo(@(58));
    }];

    [againPassWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passWordView.mas_bottom);
        make.left.right.equalTo(weakSelf.bgView);
        make.height.equalTo(@(58));
    }];

    [agreeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bgView.mas_bottom);
        make.left.equalTo(weakSelf.bgView).offset(18);
        make.width.equalTo(@(150));
        make.height.equalTo(@(40));
    }];
    
    [_agreeImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(agreeLb);
        make.left.equalTo(agreeBtn);
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
    
    [agreeLb mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(agreeBtn.mas_bottom);
        make.left.equalTo(weakSelf.agreeImageView.mas_right).offset(53);
    }];
    
    [agreeLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(agreeBtn.mas_bottom);
        make.left.right.equalTo(agreeLb);
        make.height.equalTo(@(1));
    }];

    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(agreeBtn.mas_bottom).offset(90);
        make.left.equalTo(weakSelf.view).offset(50);
        make.right.equalTo(weakSelf.view).offset(-50);
    }];

    
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
