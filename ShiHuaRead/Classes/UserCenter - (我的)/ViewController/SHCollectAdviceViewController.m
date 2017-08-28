//
//  SHCollectAdviceViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHCollectAdviceViewController.h"
#import "SHHomePageTableViewCell.h"
#import "SHAdvertisementListApiManager.h"
#import "SHAdvertisementReceiveData.h"
@interface SHCollectAdviceViewController ()<UITableViewDelegate,UITableViewDataSource,CTAPIManagerCallBackDelegate,CTAPIManagerParamSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) SHAdvertisementListApiManager *advertisementListApiManager;

@property(nonatomic, strong) NSArray *dataArr;

@end

@implementation SHCollectAdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr = [NSArray array];
    
    [self initView];
    
    [self.advertisementListApiManager loadData];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}


- (void)initView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 30) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = YES;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = gray_f3f3f3;
    _tableView.rowHeight = zScaleH(141);
    
    [self.view addSubview:_tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHHomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[SHHomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    AdvertisementList *model = _dataArr[indexPath.row];
    cell.model = model;
    return cell;
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

#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    NSDictionary *params = @{@"phone":@"18937723501",@"validCode":@"1111"};
    
    if (manager == self.advertisementListApiManager) {
        //        params = @{
        //                   kTestAPIManagerParamsKeyLatitude:@(31.228000),
        //                   kTestAPIManagerParamsKeyLongitude:@(121.454290)
        //                   };
        
        [SVProgressHUD showWithStatus:@"数据加载中..."];
        NSString *userId = [SHUserManager shareManager].userModel.ID;
        params = @{@"userId":userId};
        
    }
    
    return params;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    if (manager == self.advertisementListApiManager) {
        
        [SVProgressHUD dismiss];
        
        NSDictionary *receiveData = [manager fetchDataWithReformer:nil];
        
        NSDictionary *realData = receiveData[@"data"];
        
        NSString *errMessage = receiveData[@"msg"];
        
        if ([receiveData[@"errcode"]integerValue] == 0) {
            
            SHAdvertisementReceiveData *advertisementReceiveData = [SHAdvertisementReceiveData mj_objectWithKeyValues:realData];
            _dataArr = advertisementReceiveData.iData;
            [self.tableView reloadData];
            //            [SVProgressHUD showSuccessWithStatus:@""];
            
            //            [SHUserManager shareManager].userModel = loginReceiveData;
            
            //        self.resultLable.text = @"success";
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:errMessage];
            
        }
        
        
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        //        [self layoutResultLable];
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    if (manager == self.advertisementListApiManager) {
        
        [SVProgressHUD dismiss];
        
        //        self.resultLable.text = @"fail";
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
        
        //        [self layoutResultLable];
    }
}

#pragma mark - getters and setters
- (SHAdvertisementListApiManager *)advertisementListApiManager
{
    if (_advertisementListApiManager == nil) {
        _advertisementListApiManager = [[SHAdvertisementListApiManager alloc] init];
        _advertisementListApiManager.delegate = self;
        _advertisementListApiManager.paramSource = self;
    }
    return _advertisementListApiManager;
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
