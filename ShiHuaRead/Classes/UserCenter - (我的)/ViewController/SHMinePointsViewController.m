//
//  SHVMinePointsiewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMinePointsViewController.h"
#import "SHTableViewHeadView.h"
#import "SHMinePointsTableViewCell.h"
#import "SHMorePointsSearchViewController.h"

@interface SHMinePointsViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UILabel *pointsNum;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIButton *pointsBtn;

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *dataList;

@property(nonatomic, strong) SHTableViewHeadView *headView;

@end

@implementation SHMinePointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"我的积分";
    [self initView];
    [self initData];
}

- (void)initView
{
    [self.view addSubview:self.tableView];
    [self initTopView];
}

- (void)initTopView
{
    UIImageView *topBgView = [[UIImageView alloc] init];
    topBgView.userInteractionEnabled = YES;
    topBgView.image = [UIImage imageNamed:@"icon-749-212"];
    _pointsNum = [UILabel labelWithFont:font_20 textColor:[UIColor redColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _pointsNum.text = @"80000";
    
    _titleLb = [UILabel labelWithFont:font_15 textColor:[UIColor redColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _titleLb.text = @"总积分";
    
    _pointsBtn = [[UIButton alloc] init];
    _pointsBtn.backgroundColor = [UIColor whiteColor];
    [_pointsBtn setTitle:@"积分规则" forState:UIControlStateNormal];
    _pointsBtn.titleLabel.font = font_12;
    [_pointsBtn setTitleColor:TabbarSelectColer forState:UIControlStateNormal];
    
    [self.view addSubview:topBgView];
    [topBgView addSubview:_pointsNum];
    [topBgView addSubview:_titleLb];
    [topBgView addSubview:_pointsBtn];
    
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

    [_pointsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topBgView);
        make.top.equalTo(weakSelf.titleLb.mas_bottom).offset(zScaleH(10));
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
    SHMinePointsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MinePointsCell"];
    if (!cell) {
        cell = [[SHMinePointsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MinePointsCell"];
    }
    [cell text];
    return cell;
}
#pragma mark - init view
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, zScaleH(130), kScreenWidth, kScreenHeight - zScaleH(130)) style:UITableViewStylePlain];
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
        [_headView setTitle:@"积分明细" subTitle:@"更多查询"];
        [_headView registBlock:^{
            NSLog(@"查看更多");
            SHMorePointsSearchViewController *morePointsSearchVc = [[SHMorePointsSearchViewController alloc] init];
            [self.navigationController pushViewController:morePointsSearchVc animated:YES];
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
