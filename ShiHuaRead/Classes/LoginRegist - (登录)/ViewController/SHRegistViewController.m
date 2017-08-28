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

#import "SHRegistApi.h"

#import "SHLoginReceiveModel.h"
#import "SHRegistAskData.h"

@interface SHRegistViewController ()<CTAPIManagerParamSource, CTAPIManagerCallBackDelegate>

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) UIButton *agreeImageView;

@property(nonatomic, strong) SHRegistApi *registApiManager;

@property(nonatomic, strong) SHRegistAskData *registAskData;

@end

@implementation SHRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    
    _registAskData = [[SHRegistAskData alloc] init];
    
    [self initView];
    
    // Do any additional setup after loading the view.
}

- (void)initView
{
    _bgView = [[UIView alloc] init];
    
    __weak typeof(self) weakSelf = self;

    
    SHTextFieldLineView *userNameView = [[SHTextFieldLineView alloc] initWithImage:@"icon-mincheng-51" placeholder:@"请输入姓名或者昵称(最多10个字符)" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
        weakSelf.registAskData.username = value;
    }];
    
    SHTextFieldLineView *iphoneView = [[SHTextFieldLineView alloc] initWithImage:@"icon-shouji-51" placeholder:@"请输入手机号" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
        weakSelf.registAskData.phone = value;
    }];
    
    JBVerifyCodeView *iphoneCodeView = [[JBVerifyCodeView alloc] init];
    [iphoneCodeView setSendVerifyCodeBlock:^BOOL(JBCountdownAsBtnView *countdownBtn) {
        weakSelf.registAskData.validCode = @"1111";
        DLog(@"发送验证码");
        
        return YES;
    }];
    
    SHTextFieldLineView *passWordView = [[SHTextFieldLineView alloc] initWithImage:@"icon-denglumima-39" placeholder:@"6 - 20位字符,建议有字母和数字组成" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
        weakSelf.registAskData.password = value;
    }];
    
    SHTextFieldLineView *againPassWordView = [[SHTextFieldLineView alloc] initWithImage:@"icon-denglumima-39" placeholder:@"请再次输入密码" valueAction:^(NSString *value) {
        NSLog(@"%@",value);
        
        if ([weakSelf.registAskData.password isEqualToString:value]) {
            weakSelf.registAskData.password = value;
        }else{
            [SVProgressHUD showErrorWithStatus:@"两次输入的密码不一样"];
        }
        
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
        
        [weakSelf.registApiManager loadData];

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

    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(40);
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

#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    NSDictionary *params = @{@"username":@"123455",@"password":@"123456",@"phone":@"18937723501",@"nickName":@"yyyyy",@"validCode":@"1111"};
    
    if (manager == self.registApiManager) {
//        params = @{
//                   kTestAPIManagerParamsKeyLatitude:@(31.228000),
//                   kTestAPIManagerParamsKeyLongitude:@(121.454290)
//                   };
        
        params = [_registAskData mj_JSONObject];
    }
    
    return params;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    if (manager == self.registApiManager) {
//        self.resultLable.text = @"success";
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        
        NSDictionary *receiveData = [manager fetchDataWithReformer:nil];
        
        NSDictionary *realData = receiveData[@"data"];
        
        NSString *errMessage = receiveData[@"msg"];
        
        if ([receiveData[@"errcode"]integerValue] == 0) {

            SHLoginReceiveModel *loginReceiveData = [SHLoginReceiveModel mj_objectWithKeyValues:realData];
            
            [SHUserManager shareManager].userModel = loginReceiveData;
            
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            
            [SVProgressHUD showErrorWithStatus:errMessage];

        }
        
//        [self layoutResultLable];
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    if (manager == self.registApiManager) {
//        self.resultLable.text = @"fail";
        NSLog(@"registApiManager - %@", [manager fetchDataWithReformer:nil]);
        
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
//        [self layoutResultLable];
    }
}

#pragma mark - getters and setters
- (SHRegistApi *)registApiManager
{
    if (_registApiManager == nil) {
        _registApiManager = [[SHRegistApi alloc] init];
        _registApiManager.delegate = self;
        _registApiManager.paramSource = self;
    }
    return _registApiManager;
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
