//
//  SHLoginViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHUserCenterViewController.h"
#import "ILSettingCell.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingLabelItem.h"

#import "ILSettingGroup.h"

#import "SHMineNoticeViewController.h"
#import "SHMineTopViewLbView.h"

@interface SHUserCenterViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableview;

@property(nonatomic, strong) UIView *tableViewTopView;

@property(nonatomic, strong) NSMutableArray *dataList;

@property(nonatomic, strong) UILabel *nameLb;

@property(nonatomic, strong) UIImageView *iconImageView;

@property(nonatomic, assign) NSInteger xingji;


@property(nonatomic, strong) SHMineTopViewLbView *fadanView;

@property(nonatomic, strong) SHMineTopViewLbView *chengjiaoView;

@property(nonatomic, strong) SHMineTopViewLbView *toudanView;

@end

@implementation SHUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _xingji = 3;
    [self creatItem];
    [self initView];
    
    // Do any additional setup after loading the view.
}

- (void)initView
{
    [self.view addSubview:self.tableview];
    self.navigationController.navigationBar.hidden = YES;
    [self creatTableViewTopView];
    
//    [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(200, 0, 0, 0));
//    }];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)creatTableViewTopView
{
    UIImageView *bgTopView = [[UIImageView alloc] init];
    bgTopView.frame = CGRectMake(0, 0, kScreenWidth, 230);
    bgTopView.image = [UIImage imageNamed:@"图层-21"];
    bgTopView.backgroundColor = [UIColor whiteColor];
    
    UIButton *settingBtn = [[UIButton alloc] init];
    [settingBtn setImage:[UIImage imageNamed:@"icon-shezhi-39"] forState:UIControlStateNormal];
    
    UIButton *xiaoxiBtn = [[UIButton alloc] init];
    [xiaoxiBtn setImage:[UIImage imageNamed:@"icon-xiaoxi-37"] forState:UIControlStateNormal];
    
    UIView *navBgView = [[UIView alloc] init];
    navBgView.backgroundColor = [UIColor clearColor];
    
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.layer.cornerRadius = 30;
    iconImageView.image = [UIImage imageNamed:@"icon-touxiang-110"];
    _iconImageView = iconImageView;
    UILabel *nameLb = [UILabel labelWithFont:font_13 textColor:[UIColor whiteColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _nameLb = nameLb;
    nameLb.text = @"张家辉";
    
    UIView *xingV = [self xingView];
    
    _fadanView = [[SHMineTopViewLbView alloc] init];
    _chengjiaoView = [[SHMineTopViewLbView alloc] init];
    _toudanView = [[SHMineTopViewLbView alloc] init];
    
    UIView *topBottomBgView = [[UIView alloc] init];

    
    [self.view addSubview:bgTopView];
    
    [bgTopView addSubview:navBgView];
    [navBgView addSubview:settingBtn];
    [navBgView addSubview:xiaoxiBtn];
    
    [bgTopView addSubview:iconImageView];
    [bgTopView addSubview:nameLb];
    [bgTopView addSubview:xingV];
    
    [bgTopView addSubview:topBottomBgView];
    
    [topBottomBgView addSubview:_fadanView];
    [topBottomBgView addSubview:_chengjiaoView];
    [topBottomBgView addSubview:_toudanView];

    [navBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(bgTopView);
        make.height.equalTo(@(64));
    }];
    
    __weak typeof(self) weakSelf = self;

    [settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(xiaoxiBtn.mas_left).offset(-10);
        make.centerY.equalTo(xiaoxiBtn);
        make.width.height.equalTo(@(30));
    }];
    
    [xiaoxiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(navBgView.mas_right).offset(-15);
        make.centerY.equalTo(navBgView).offset(5);
        make.width.height.equalTo(settingBtn);
    }];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navBgView.mas_bottom);
        make.centerX.equalTo(bgTopView);
        make.height.width.equalTo(@(60.0f));
    }];
    
    [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageView.mas_bottom).offset(5);
        make.left.right.equalTo(bgTopView);
    }];
    
    [xingV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLb.mas_bottom).offset(2);
        make.centerX.equalTo(bgTopView);
        make.height.equalTo(@(10));
        make.width.equalTo(@(45));
    }];
    
    [topBottomBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgTopView);
        make.top.equalTo(xingV.mas_bottom);
        make.height.equalTo(@(50));
    }];
    
    [_chengjiaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topBottomBgView);
        make.top.bottom.equalTo(topBottomBgView);
    }];
    
    [_fadanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.chengjiaoView.mas_left).offset(-50);
        make.top.bottom.equalTo(topBottomBgView);
    }];
    
    [_toudanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.chengjiaoView.mas_right).offset(50);
        make.top.bottom.equalTo(topBottomBgView);
    }];

    
}

- (UIView *)xingView
{
    UIView *xingBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 10)];
    
    CGFloat xingWH = 10;
    CGFloat marge = 5;
    for (int index = 0; index < _xingji; index ++) {
        UIImageView *xingImageV = [[UIImageView alloc] initWithFrame:CGRectMake(index * (xingWH + marge) , 0, xingWH, xingWH)];
        xingImageV.image  = [UIImage imageNamed:@"icon-xinji-16"];
        [xingBgView addSubview:xingImageV];
    }
    return xingBgView;
}


- (void)creatItem
{
    _dataList = [NSMutableArray arrayWithCapacity:0];
    
    // 0组
    [self addGroup0];
    
    // 1组
    [self addGroup1];
    
    // 2组
    [self addGroup2];
}

- (void)addGroup0
{
    ILSettingItem *mineNotice = [ILSettingArrowItem itemWithIcon:@"icon-wodepingu-35" title:@"我的公告" destVcClass:[SHMineNoticeViewController class]];
    ILSettingItem *mineCan = [ILSettingArrowItem itemWithIcon:@"icon-wodewoneng-40" title:@"我的我能" destVcClass:[SHBaseViewController class]];
    mineCan.isShowDivider = NO;

    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    
    group0.items = @[mineNotice,mineCan];
    [self.dataList addObject:group0];
}

- (void)addGroup1
{
    // 1组
//    ILSettingItem *newVersion = [ILSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
//    // 保存了一段检查更新的功能
//    newVersion.option = ^{
//        // 1.显示蒙板
////        [MBProgressHUD showMessage:@"正在检查ing......."];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 2.隐藏蒙板
////            [MBProgressHUD hideHUD];
//            
//            // 3.提示用户
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有更新版本" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
//            // 显示UIAlertView
//            [alert show];
//            
//        });
//        
//        
//    };
    ILSettingItem *mineSingle = [ILSettingArrowItem itemWithIcon:@"icon-wodetoudan-40" title:@"我的投单" destVcClass:[SHBaseViewController class]];
    
    ILSettingItem *mineZD = [ILSettingArrowItem itemWithIcon:@"icon-wodezhongdan-40" title:@"我的中单" destVcClass:[SHBaseViewController class]];
    
    ILSettingItem *mineCollec = [ILSettingArrowItem itemWithIcon:@"icon-wodeshoucheang-40" title:@"我的收藏" destVcClass:[SHBaseViewController class]];
    ILSettingItem *mineIntegral = [ILSettingArrowItem itemWithIcon:@"icon-wodejifen-40" title:@"我的积分" destVcClass:nil];
    mineIntegral.isShowDivider = NO;
    ILSettingGroup *group1 = [[ILSettingGroup alloc] init];
    
    group1.items = @[mineSingle,mineZD,mineCollec,mineIntegral];
    
    [self.dataList addObject:group1];
}

- (void)addGroup2
{
    ILSettingItem *singleMonery = [ILSettingArrowItem itemWithIcon:@"icon-doudanluyuejin-40" title:@"投单履约金" destVcClass:nil];
    ILSettingItem *zhishiCQ = [ILSettingArrowItem  itemWithIcon:@"icon-zhishichangquan-42" title:@"知识产权评估"];
    
    ILSettingItem *myGame = [ILSettingArrowItem itemWithIcon:@"icon-wodediangying-48" title:@"我的游戏电影" destVcClass:nil];
    
    ILSettingItem *advice = [ILSettingArrowItem itemWithIcon:@"icon-toushuyujianyi-36" title:@"投诉建议" destVcClass:nil];
    
    ILSettingItem *publicGood = [ILSettingArrowItem itemWithIcon:@"icon-gugugongyi-39-35" title:@"汩汩慈善公益" destVcClass:nil];
    publicGood.isShowDivider = NO;
    
    ILSettingGroup *group2 = [[ILSettingGroup alloc] init];
    
    group2.items = @[singleMonery,zhishiCQ,myGame,advice,publicGood];
    
    [self.dataList addObject:group2];

    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    ILSettingGroup *group = self.dataList[section];
    return group.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }else{
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 创建cell
    ILSettingCell *cell = [[ILSettingCell class] cellWithTableView:tableView];
    
    NSLog(@"%@",NSStringFromCGRect(cell.frame));
    
    // 取出模型
    ILSettingGroup *group = self.dataList[indexPath.section];
    ILSettingItem *item = group.items[indexPath.row];
    // 传递模型
    cell.item = item;
    cell.isShowDivider = item.isShowDivider;
    
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    ILSettingGroup *group = self.dataList[section];
//    return group.header;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    ILSettingGroup *group = self.dataList[section];
//    return group.footer;
//}
#warning 点击某一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出模型
    ILSettingGroup *group = self.dataList[indexPath.section];
    ILSettingItem *item = group.items[indexPath.row];
    
    // 执行操作
    if (item.option) {
        item.option();
        return;
    }
    
    if ([item isKindOfClass:[ILSettingArrowItem class]]) { // 需要跳转控制器
        ILSettingArrowItem *arrowItem = (ILSettingArrowItem *)item;
        
        
        // 创建跳转的控制器
        if (arrowItem.destVcClass) {
            
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            
            [XHToast showCenterWithText:TIP_SHOW];

        }
        
    }
    
}



- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 210, kScreenWidth, kScreenHeight - 210 - 49) style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.bounces = YES;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.backgroundColor = gray_f3f3f3;
        _tableview.rowHeight = 44.0f;
        // 设置组间距
//        _tableview.sectionHeaderHeight = 10;
//        _tableview.sectionFooterHeight = 0;
    }
    return _tableview;

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
