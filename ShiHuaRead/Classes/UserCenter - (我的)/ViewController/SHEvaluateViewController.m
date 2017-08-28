//
//  SHEvaluateViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHEvaluateViewController.h"
#import "SHEvaluateView.h"
#import "STTextView.h"

@interface SHEvaluateViewController ()

@end

@implementation SHEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评价";
    [self initView];
    // Do any additional setup after loading the view.
}


#pragma mark - 初始化view
- (void)initView
{
    
    __weak typeof(self) weakSelf = self;

    SHEvaluateView *evaluate = [[SHEvaluateView alloc] init];
    [evaluate registEvaluateBlock:^(EvaluateType type) {
        NSLog(@"%lu",type);
    }];
    evaluate.layer.cornerRadius = 5.0f;
    evaluate.layer.masksToBounds = YES;

    STTextView *textView = [[STTextView alloc] init];
    textView.placeholder = @"此处输入评论意见";
    textView.textDidChangedBlock = ^(NSString *text){
        NSLog(@"%@",text);
    };
    textView.layer.cornerRadius = 5.0f;
    textView.layer.masksToBounds = YES;
    textView.verticalSpacing = 10;
    textView.textContainerInset = UIEdgeInsetsMake(15, 10, 15, 10);

    UIButton *submitBtn = [UIButton buttonWithTitle:@"提交"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        
    }];
    
    [self.view addSubview:evaluate];
    [self.view addSubview:textView];
    [self.view addSubview:submitBtn];
    
    [evaluate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(zScaleH(15));
        make.height.equalTo(@(zScaleH(70)));
    }];

    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(evaluate.mas_bottom).offset(zScaleH(30));
        make.left.equalTo(weakSelf.view).offset(zScaleW(13));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-13));
        make.height.equalTo(@(zScaleH(120)));
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.view).offset(zScaleH(10));
        make.left.equalTo(weakSelf.view).offset(zScaleW(40));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-40));
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
