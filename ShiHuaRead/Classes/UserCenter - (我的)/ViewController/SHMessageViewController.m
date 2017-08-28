//
//  SHMessageViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMessageViewController.h"
#import "SHMessageTableViewCell.h"

@interface SHMessageViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *dataList;

@end

@implementation SHMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    self.navigationController.navigationBar.hidden = NO;

    [self initView];
    [self initData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    SHMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
    if (!cell) {
        cell = [[SHMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"messageCell"];
    }
    [cell setText];
    return cell;
}
#pragma mark - init view
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = gray_f3f3f3;
        _tableView.rowHeight = zScaleH(60);
    }
    return _tableView;
    
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
