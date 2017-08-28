//
//  SHCollectICanViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHCollectICanViewController.h"
#import "SHICanTableViewCell.h"
#import "SHICanListApiManager.h"
#import "SHICanListReceiveData.h"

@interface SHCollectICanViewController ()<UITableViewDelegate,UITableViewDataSource,CTAPIManagerCallBackDelegate,CTAPIManagerParamSource>
@property(nonatomic,strong)UITableView * HomeTableView;

@property(nonatomic, strong) SHICanListApiManager *iCanListApiManager;

@property(nonatomic, strong) NSArray *dataArr;;

@end

@implementation SHCollectICanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _dataArr = [NSArray array];
    [self setUpHomeTable];
    
    [self.iCanListApiManager loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.iCanListApiManager loadData];
    
}

-(void)setUpHomeTable
{
    UITableView * homeTable = [[UITableView alloc]init];
    homeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    homeTable.dataSource = self;
    homeTable.delegate = self;
    homeTable.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 30);
    self.HomeTableView = homeTable;
    homeTable.backgroundColor = gray_f3f3f3;
    [self.view addSubview:homeTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return zScaleH(158);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHICanTableViewCell * icanCell = [tableView dequeueReusableCellWithIdentifier:@"woneng"];
    if (icanCell == nil) {
        icanCell = [[SHICanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"woneng"];
    }
    icanCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    SHICanListData *model = _dataArr[indexPath.row];
    [icanCell cofigModel:model];
    return icanCell;
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
        //        params = @{
        
        [SVProgressHUD showWithStatus:@"加载中..."];
        //                   kTestAPIManagerParamsKeyLatitude:@(31.228000),
        //                   kTestAPIManagerParamsKeyLongitude:@(121.454290)
        //                   };
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
            
            [self.HomeTableView reloadData];
            //            [SVProgressHUD showSuccessWithStatus:@"提交成功"];
            
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
