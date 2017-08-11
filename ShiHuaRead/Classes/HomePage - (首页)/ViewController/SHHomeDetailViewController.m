//
//  SHHomeDetailViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHHomeDetailViewController.h"

#import "SHHomeXiangqingCell.h"
#import "SHTouDanShenSingViewController.h"
@interface SHHomeDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * xiangqingtable;
@property(nonatomic,strong)UITextView * textView;

@end

@implementation SHHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公告详情";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setuptableview];
    [self setUpUIbuttonsView];
    [self setUpUIbuttonsView];
}
-(void)setUpUIbuttonsView{
    UIView * buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 50, kScreenWidth, 50)];
    UIButton * soucahngBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [soucahngBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [soucahngBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    soucahngBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [soucahngBtn setBackgroundImage:[UIImage imageNamed:@"icon-229-666.png"] forState:UIControlStateNormal];
    soucahngBtn.frame = CGRectMake(15, 11, 115, 34);
    [soucahngBtn addTarget:self action:@selector(soucangClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:soucahngBtn];
    
    UIButton * toudanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [toudanBtn setTitle:@"立即投单" forState:UIControlStateNormal];
    [toudanBtn setBackgroundImage:[UIImage imageNamed:@"icon-229-667.png"] forState:UIControlStateNormal];
    [toudanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    toudanBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    toudanBtn.frame = CGRectMake(134, 11, 115, 34);
    [toudanBtn addTarget:self action:@selector(toudanClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:toudanBtn];
    
    UIButton * jubaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [jubaoBtn setTitle:@"举报" forState:UIControlStateNormal];
    jubaoBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [jubaoBtn setTitleColor:[UIColor colorWithRed:164/255.0 green:171/255.0 blue:175/255.0 alpha:1] forState:UIControlStateNormal];
    [jubaoBtn setBackgroundImage:[UIImage imageNamed:@"icon-100-60g.png"] forState:UIControlStateNormal];
    jubaoBtn.frame = CGRectMake(kScreenWidth - 75, 11, 51, 31);
    [jubaoBtn addTarget:self action:@selector(jubaoClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:jubaoBtn];
    [self.view addSubview:buttonView];
}
//点击收藏
-(void)soucangClick:(UIButton *)btn{
    
}
//点击投单
-(void)toudanClick:(UIButton *)btn{
    SHTouDanShenSingViewController * toudanVC = [[SHTouDanShenSingViewController alloc]init];
    
    [self.navigationController pushViewController:toudanVC animated:YES];
}
//点击举报
-(void)jubaoClick:(UIButton *)btn{
    
}
-(void)setuptableview{
    UITableView * xiangqingtable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 114) style:UITableViewStyleGrouped];
    xiangqingtable.delegate = self;
    xiangqingtable.dataSource = self;
    xiangqingtable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:xiangqingtable];
    self.xiangqingtable = xiangqingtable;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 250;
    }else{
        return 385;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }else{
        return 40;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headView = nil;
    if (section == 0) {
        return headView;
    }else{
        UILabel * miaoshuLable = [[UILabel alloc]initWithFrame:CGRectMake(13, 5, 90, 25)];
        miaoshuLable.text = @"需求描述";
        miaoshuLable.font = [UIFont systemFontOfSize:15];
        headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        headView.backgroundColor = [UIColor clearColor];
        [headView addSubview:miaoshuLable];
        return headView;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SHHomeXiangqingCell * xiangqingCell = [SHHomeXiangqingCell SHHomeXiangqingCell];
        xiangqingCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return xiangqingCell;
    }else{
        UITableViewCell * miaoshuCell = [[UITableViewCell alloc]init];
        miaoshuCell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(5, 5, kScreenWidth - 10, 375)];
        backView.layer.shadowRadius = 5.0;
        backView.layer.masksToBounds = YES;
        backView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        backView.layer.shadowOpacity = 0.3;
        backView.layer.shadowOffset = CGSizeMake(0, 0);
        [miaoshuCell.contentView addSubview:backView];
        UILabel * textLable = [[UILabel alloc]init];
        textLable.frame = CGRectMake(8, 8, kScreenWidth - 26, 359);
        textLable.numberOfLines = 0;
        [backView addSubview:textLable];
        
        return miaoshuCell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
