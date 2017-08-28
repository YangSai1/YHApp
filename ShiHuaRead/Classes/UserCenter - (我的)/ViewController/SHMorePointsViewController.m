//
//  SHMorePointsViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMorePointsViewController.h"
#import "SHMinePointsTableViewCell.h"

@interface SHMorePointsViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *dataList;

@end

@implementation SHMorePointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"奖励记录";
    
    [self initView];
    [self initData];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    [self.view addSubview:self.tableView];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHMinePointsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineMorePointsCell"];
    if (!cell) {
        cell = [[SHMinePointsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MineMorePointsCell"];
    }
    [cell text];
    return cell;
}

#pragma mark - init view
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, kScreenHeight - 10) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = gray_f3f3f3;
        _tableView.rowHeight = zScaleH(53);
    }
    return _tableView;
    
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
