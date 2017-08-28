//
//  SHMineICanViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineICanViewController.h"
#import "SHMineICanEiderViewController.h"
#import "SHICanTableViewCell.h"
#import "SHICanListApiManager.h"
#import "SHICanListReceiveData.h"

@interface SHMineICanViewController ()<UITableViewDelegate,UITableViewDataSource,CTAPIManagerCallBackDelegate,CTAPIManagerParamSource>
@property(nonatomic, strong)UITableView * tableView;

@property(nonatomic, strong) SHICanListApiManager *iCanListApiManager;

@property(nonatomic, strong) NSArray *dataArr;;

@end

@implementation SHMineICanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的我能";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _dataArr = [NSArray array];
    [self setUpNavigationBIiTEM];
    [self setUpHomeTable];
    
    [self.iCanListApiManager loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.iCanListApiManager loadData];
    
}


-(void)setUpNavigationBIiTEM{
    self.navigationController.navigationBar.hidden = NO;
    UIBarButtonItem *rightBarItem = [UIBarButtonItem barButtonRightItemWithImageName:@"新增-(1)" target:self action:@selector(rightBtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}
- (void)rightBtn
{
    SHMineICanEiderViewController *mineNoticeEditorVc = [[SHMineICanEiderViewController alloc] init];
    [self.navigationController pushViewController:mineNoticeEditorVc animated:YES];
}

-(void)setUpHomeTable
{
    UITableView * homeTable = [[UITableView alloc]init];
    homeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    homeTable.dataSource = self;
    homeTable.delegate = self;
    homeTable.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.tableView = homeTable;
    [self.view addSubview:homeTable];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return zScaleH(158);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHICanTableViewCell * wonengCell = [tableView dequeueReusableCellWithIdentifier:@"woneng"];
    if (wonengCell == nil) {
        wonengCell = [[SHICanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"woneng"];
    }
    wonengCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    SHICanListData *model = _dataArr[indexPath.row];
    
    [wonengCell cofigModel:model];
    
    return wonengCell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    NSDictionary *params = @{@"phone":@"18937723501",@"validCode":@"1111"};
    
    if (manager == self.iCanListApiManager) {
        
        [SVProgressHUD showWithStatus:@"加载中..."];
        NSString *userId = [SHUserManager shareManager].userModel.ID;
        params = @{@"userId":userId};

    }
    
    return params;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    if (manager == self.iCanListApiManager) {
        
        [SVProgressHUD dismiss];

        NSDictionary *receiveData = [manager fetchDataWithReformer:nil];
        
        NSDictionary *realData = receiveData[@"data"];
        
        NSString *errMessage = receiveData[@"msg"];
        
        if ([receiveData[@"errcode"]integerValue] == 0) {
            

            SHICanListReceiveData *iCanListReceiveData = [SHICanListReceiveData mj_objectWithKeyValues:realData];
            
            _dataArr = iCanListReceiveData.iData;
            
            [self.tableView reloadData];
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:errMessage];
            
        }
        
        
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        //        [self layoutResultLable];
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    if (manager == self.iCanListApiManager) {
        
        [SVProgressHUD dismiss];
        //        self.resultLable.text = @"fail";
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
        //        [self layoutResultLable];
    }
}

#pragma mark - getters and setters
- (SHICanListApiManager *)iCanListApiManager
{
    if (_iCanListApiManager == nil) {
        _iCanListApiManager = [[SHICanListApiManager alloc] init];
        _iCanListApiManager.delegate = self;
        _iCanListApiManager.paramSource = self;
    }
    return _iCanListApiManager;
}

@end
