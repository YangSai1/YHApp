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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    self.navigationItem.title = @"立刻支付";
    [self setUpZhifuView];
    [self setUpZHiFuBtn];
}
-(void)setUpZHiFuBtn{
    UIButton * zhifuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [zhifuButton setTitle:@"立即支付" forState:UIControlStateNormal];
    [zhifuButton setBackgroundImage:[UIImage imageNamed:@"icon-229-66-.png"] forState:UIControlStateNormal];
    zhifuButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [zhifuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [zhifuButton addTarget:self action:@selector(likezhiduclick:) forControlEvents:UIControlEventTouchUpInside];
    zhifuButton.frame = CGRectMake((kScreenWidth - 124)/2, 215, 124, 41);
    [self.view addSubview:zhifuButton];
}
//点击立刻支付按钮
-(void)likezhiduclick:(UIButton *)btn{
    
}
-(void)setUpZhifuView{
    UIView * zhifuView = [[UIView alloc]initWithFrame:CGRectMake(15, 79, kScreenWidth - 30, 115)];
    zhifuView.backgroundColor = [UIColor whiteColor];
    zhifuView.layer.cornerRadius = 5.f;
    zhifuView.layer.masksToBounds = YES;
    UILabel * zhifuTitle = [[UILabel alloc]init];
    zhifuTitle.text = @"支付金额";
    zhifuTitle.font = [UIFont systemFontOfSize:15];
    zhifuTitle.frame = CGRectMake(18, 15, 65, 15);
    [zhifuView addSubview:zhifuTitle];
    
    UILabel * zhifujine = [[UILabel alloc]init];
    zhifujine.font = [UIFont systemFontOfSize:13];
    zhifujine.textColor = [UIColor redColor];
    zhifujine.text = [NSString stringWithFormat:@"¥ %@",self.jineStr];
    zhifujine.frame = CGRectMake(256, 16, 70, 13);
    [zhifuView addSubview:zhifujine];
    
    UILabel * titleLable = [[UILabel alloc]init];
    titleLable.text = @"投单履约金账户";
    titleLable.font = [UIFont systemFontOfSize:13];
    titleLable.textColor = [UIColor darkGrayColor];
    titleLable.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    titleLable.textAlignment = NSTextAlignmentLeft;
    titleLable.frame = CGRectMake(12, 52, kScreenWidth - 54, 22);
    [zhifuView addSubview:titleLable];
    
    UILabel * zhanghuName = [[UILabel alloc]initWithFrame:CGRectMake(18, 85, 55, 14)];
    zhanghuName.text = @"账户金额:";
    zhanghuName.font = [UIFont systemFontOfSize:13];
    zhanghuName.textColor = [UIColor darkGrayColor];
    [zhifuView addSubview:zhanghuName];
    
    UILabel * zhanghuJinE = [[UILabel alloc]initWithFrame:CGRectMake(75, 85, 95, 14)];
    zhanghuJinE.font = [UIFont systemFontOfSize:13];
    zhanghuJinE.textColor = [UIColor redColor];
    zhanghuJinE.text = @"¥1000.00元";
    [zhifuView addSubview:zhanghuJinE];
    
    UIButton * chongzhiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chongzhiBtn setTitle:@"充值" forState:UIControlStateNormal];
    chongzhiBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [chongzhiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chongzhiBtn setBackgroundColor:[UIColor blueColor]];
    chongzhiBtn.frame = CGRectMake(kScreenWidth - 80, 81, 41, 20);
    [chongzhiBtn addTarget:self action:@selector(chhongzhiClick:) forControlEvents:UIControlEventTouchUpInside];
    [zhifuView addSubview:chongzhiBtn];
    
    [self.view addSubview:zhifuView];
}
//点击充值按钮
-(void)chhongzhiClick:(UIButton *)btn{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
