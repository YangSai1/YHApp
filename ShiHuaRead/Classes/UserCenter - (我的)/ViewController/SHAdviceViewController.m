//
//  SHAdviceViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHAdviceViewController.h"
#import "SHAdviceCheckView.h"
#import "SHBlueLineTextView.h"
#import "SHBlueHeadeViewTextView.h"

@interface SHAdviceViewController ()

@end

@implementation SHAdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;

    self.title = @"投诉建议";
    [self initView];
    
    // Do any additional setup after loading the view.
}

- (void)initView
{
    __weak typeof(self) weakSelf = self;

    SHAdviceCheckView *adviceCheckView = [[SHAdviceCheckView alloc] init];
    [adviceCheckView registBlock:^(AdviceType type) {
        
    }];
    
    SHBlueLineTextView *adviceNameV = [[SHBlueLineTextView alloc] init];
    [adviceNameV setTitle:@"题目" placeholder:@"输入题目"];
    [adviceNameV registBlock:^(NSString *text) {
        
    }];
    
    SHBlueHeadeViewTextView *blueTextView = [[SHBlueHeadeViewTextView alloc] init];
    [blueTextView.titleView setTitle:@"描述" placeholder:nil];
    blueTextView.textView.placeholder = @"200字以内";
    blueTextView.textView.font = font_13;
    blueTextView.textView.textDidChangedBlock = ^(NSString *text) {
        NSLog(@"%@",text);
    };
    SHBlueLineTextView *iphoneV = [[SHBlueLineTextView alloc] init];
    [iphoneV setTitle:@"联系电话" placeholder:@"请输入您的联系电话号码"];
    [iphoneV registBlock:^(NSString *text) {
        
    }];

    UIButton *submitBtn = [UIButton buttonWithTitle:@"提交申请"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        
    }];
    
    [self.view addSubview:adviceCheckView];
    [self.view addSubview:adviceNameV];
    [self.view addSubview:blueTextView];
    [self.view addSubview:iphoneV];
    [self.view addSubview:submitBtn];

    [adviceCheckView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(8));
        make.left.equalTo(weakSelf.view).offset(zScaleW(13));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-13));
        make.height.equalTo(@(zScaleH(60)));
    }];
    
    [adviceNameV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(adviceCheckView.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [blueTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(adviceNameV.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(200)));
    }];
    
    [iphoneV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blueTextView.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(zScaleH(-40));
        make.left.equalTo(weakSelf.view).offset(zScaleW(60));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-60));
        make.height.equalTo(@(zScaleH(44)));
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
