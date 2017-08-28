//
//  SHTouDanMoneyViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTouDanMoneyViewController.h"

#import "SHTableViewHeadView.h"
#import "SHMinePointsTableViewCell.h"

#import "SHTouDanMoreMoneyViewController.h"
#import "SHCashViewController.h"
#import "SHRechargeablePayStypeViewController.h"

@interface SHTouDanMoneyViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UIImageView *topBgView;

@property(nonatomic, strong) UILabel *pointsNum;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *dataList;

@property(nonatomic, strong) SHTableViewHeadView *headView;

// 充值
@property(nonatomic, strong) UIButton *rechargeableBtn;

// 提现
@property(nonatomic, strong) UIButton *cashBtn;

@end

@implementation SHTouDanMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"履约金账户";
    [self initView];
    [self initData];
}

- (void)initView
{
    [self.view addSubview:self.tableView];
    [self initTopView];
    
    __weak typeof(self) weakSelf = self;

    _rechargeableBtn = [[UIButton alloc] init];
    [_rechargeableBtn addActionBlock:^(UIButton *sender) {
        SHRechargeablePayStypeViewController *rechargeableVc = [[SHRechargeablePayStypeViewController alloc] init];
        [weakSelf.navigationController pushViewController:rechargeableVc animated:YES];
    }];

    [_rechargeableBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    _rechargeableBtn.backgroundColor = [UIColor whiteColor];
    [_rechargeableBtn setImage:[UIImage imageNamed:@"icon-liichongzhi-59-48"] forState:UIControlStateNormal];
    [_rechargeableBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    [_rechargeableBtn setTitleColor:Color_252525 forState:UIControlStateNormal];
    _rechargeableBtn.titleLabel.font = font_13;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    
    _cashBtn = [[UIButton alloc] init];
    [_cashBtn addActionBlock:^(UIButton *sender) {
        SHCashViewController *cashVc = [[SHCashViewController alloc] init];
        [weakSelf.navigationController pushViewController:cashVc animated:YES];
    }];
    _cashBtn.backgroundColor = [UIColor whiteColor];
    [_cashBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    [_cashBtn setImage:[UIImage imageNamed:@"icon-lijitixiang-55"] forState:UIControlStateNormal];
    [_cashBtn setTitle:@"立即提现" forState:UIControlStateNormal];
    [_cashBtn setTitleColor:Color_252525 forState:UIControlStateNormal];
    _cashBtn.titleLabel.font = font_13;
    
    [self.view addSubview:_rechargeableBtn];
    [self.view addSubview:_cashBtn];
    [self.view addSubview:lineView];

    [_rechargeableBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.topBgView.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(60)));
        make.width.equalTo(@(kScreenWidth * 0.5));
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.rechargeableBtn).offset(zScaleH(10));
        make.left.equalTo(weakSelf.rechargeableBtn.mas_right);
        make.bottom.equalTo(weakSelf.rechargeableBtn).offset(zScaleH(-10));
        make.width.equalTo(@(1));
    }];

    
    [_cashBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.topBgView.mas_bottom).offset(zScaleH(10));
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(60)));
        make.width.equalTo(@(kScreenWidth * 0.5));
    }];

    
}

- (void)initTopView
{
    UIImageView *topBgView = [[UIImageView alloc] init];
    topBgView.userInteractionEnabled = YES;
    _topBgView = topBgView;
    topBgView.image = [UIImage imageNamed:@"icon-749-212"];
    _pointsNum = [UILabel labelWithFont:font_20 textColor:[UIColor redColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _pointsNum.text = @"80000";
    
    _titleLb = [UILabel labelWithFont:font_15 textColor:[UIColor redColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _titleLb.text = @"总积分";
    
    [self.view addSubview:topBgView];
    [topBgView addSubview:_pointsNum];
    [topBgView addSubview:_titleLb];
    
    __weak typeof(self) weakSelf = self;
    [topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.left.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(120)));
    }];
    
    [_pointsNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topBgView);
        make.top.equalTo(topBgView).offset(zScaleH(15));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topBgView);
        make.top.equalTo(weakSelf.pointsNum.mas_bottom).offset(zScaleH(10));
    }];
}

- (void)initData
{
    _dataList = @[@"1",@"2",@"3"];
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return zScaleH(44);
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHMinePointsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineMoneyCell"];
    if (!cell) {
        cell = [[SHMinePointsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MineMoneyCell"];
    }
    [cell text];
    return cell;
}
#pragma mark - init view
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, zScaleH(130 + 60 + 10), kScreenWidth, kScreenHeight - zScaleH(130 + 60 + 10)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = gray_f3f3f3;
        _tableView.rowHeight = zScaleH(53);
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
    
}

- (SHTableViewHeadView *)headView
{
    if (!_headView) {
        _headView = [[SHTableViewHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, zScaleH(44))];
        [_headView setTitle:@"交易记录" subTitle:@"更多查询"];
        [_headView registBlock:^{
            NSLog(@"查看更多");
            SHTouDanMoreMoneyViewController *moreMoneyVc1 = [[SHTouDanMoreMoneyViewController alloc] init];
            [self.navigationController pushViewController:moreMoneyVc1 animated:YES];
        }];
    }
    return _headView;
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
