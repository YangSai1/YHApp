//
//  SHZhiFuViewController.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/10.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "SHZhiFuViewController.h"

@interface SHZhiFuViewController ()

@end

@implementation SHZhiFuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"立刻支付";
    [self initView];
    

}

- (void)initView
{
    [self setUpZhifuView];
    
}

- (void)setUpZHiFuBtn
{
    UIButton * zhifuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [zhifuButton setTitle:@"立即支付" forState:UIControlStateNormal];
    [zhifuButton setBackgroundImage:[UIImage imageNamed:@"icon-229-66-.png"] forState:UIControlStateNormal];
    zhifuButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [zhifuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [zhifuButton addTarget:self action:@selector(likezhiduclick:) forControlEvents:UIControlEventTouchUpInside];
    zhifuButton.frame = CGRectMake((kScreenWidth - zScaleW(124))/2, 215, zScaleW(124), zScaleW(44));
    [self.view addSubview:zhifuButton];
}
//点击立刻支付按钮
- (void)likezhiduclick:(UIButton *)btn
{
    
}
- (void)setUpZhifuView
{
    UIView * zhifuView = [[UIView alloc] init];
    zhifuView.backgroundColor = [UIColor whiteColor];
    zhifuView.layer.cornerRadius = 5.f;
    zhifuView.layer.masksToBounds = YES;
    
    UILabel * zhifuTitle = [[UILabel alloc] init];
    zhifuTitle.text = @"支付金额";
    zhifuTitle.font = font_14;
    zhifuTitle.textColor = Color_252525;

    UILabel * zhifujine = [[UILabel alloc] init];
    zhifujine.font = font_14;
    zhifujine.textColor = [UIColor redColor];
    zhifujine.text = [NSString stringWithFormat:@"¥ %@",self.jineStr];
    
    UILabel * titleLable = [[UILabel alloc]init];
    titleLable.text = @"投单履约金账户";
    titleLable.font = font_13;
    titleLable.textColor = Color_a4a5a4;
    titleLable.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    titleLable.textAlignment = NSTextAlignmentLeft;
    
    UILabel * zhanghuName = [[UILabel alloc] init];
    zhanghuName.text = @"账户金额:";
    zhanghuName.font = font_13;
    zhanghuName.textColor = Color_a4a5a4;
    
    UILabel * zhanghuJinE = [[UILabel alloc]init];
    zhanghuJinE.font = font_13;
    zhanghuJinE.textColor = [UIColor redColor];
    zhanghuJinE.text = @"¥1000.00元";
    
    UIButton * chongzhiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chongzhiBtn setTitle:@"充值" forState:UIControlStateNormal];
    chongzhiBtn.titleLabel.font = font_13;
    [chongzhiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chongzhiBtn setBackgroundColor:Color_157efb];
    [chongzhiBtn addTarget:self action:@selector(chhongzhiClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *submitBtn = [UIButton buttonWithTitle:@"立即支付"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        
    }];
    
    [self.view addSubview:zhifuView];
    [zhifuView addSubview:zhifuTitle];
    [zhifuView addSubview:zhifujine];
    [zhifuView addSubview:titleLable];
    [zhifuView addSubview:zhanghuName];
    [zhifuView addSubview:zhanghuJinE];
    [zhifuView addSubview:chongzhiBtn];
    [self.view addSubview:submitBtn];

    __weak typeof(self) weakSelf = self;
    
    [zhifuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(15));
        make.left.equalTo(weakSelf.view).offset(zScaleW(13));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-13));
        make.height.equalTo(@(zScaleH(110)));
    }];
    
    [zhifuTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(zhifuView).offset(zScaleH(10));
        make.left.equalTo(zhifuView).offset(zScaleW(10));
    }];
    
    [zhifujine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(zhifuView).offset(zScaleH(10));
        make.right.equalTo(zhifuView).offset(zScaleW(-10));
    }];
    
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(zhifuTitle.mas_bottom).offset(zScaleH(15));
        make.right.equalTo(zhifuView).offset(zScaleW(-10));
        make.left.equalTo(zhifuView).offset(zScaleW(10));
        make.height.equalTo(@(zScaleH(25)));
    }];

    [zhanghuName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLable.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(zhifuView).offset(zScaleW(10));
    }];
    
    [zhanghuJinE mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLable.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(zhanghuName.mas_right).offset(zScaleW(10));
    }];
    
    [chongzhiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(zhanghuJinE);
        make.right.equalTo(zhifuView).offset(zScaleW(-10));
        make.width.equalTo(@(zScaleW(40)));
        make.height.equalTo(@(zScaleW(20)));

    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(zhifuView.mas_bottom).offset(zScaleH(30));
        make.width.equalTo(@(zScaleW(110)));
        make.height.equalTo(@(zScaleH(40)));
    }];


}
//点击充值按钮
-(void)chhongzhiClick:(UIButton *)btn{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
