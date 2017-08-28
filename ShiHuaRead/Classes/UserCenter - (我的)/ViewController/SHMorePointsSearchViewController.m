//
//  SHMorePointsSearchViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMorePointsSearchViewController.h"
#import "SHMorePointsViewController.h"

#import "THDatePickerView.h"

@interface SHMorePointsSearchViewController () <THDatePickerViewDelegate>

@property(nonatomic, strong) UILabel *stareBtnTitleLb;

@property(nonatomic, strong) UILabel *endBtnTitleLb;

@property (strong, nonatomic) THDatePickerView *dateView;

@property(nonatomic, assign) NSInteger datePicker;

@end


@implementation SHMorePointsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多查询";
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    UIButton *stareBtn = [[UIButton alloc] init];
    stareBtn.backgroundColor = [UIColor whiteColor];
    [stareBtn addActionBlock:^(UIButton *sender) {
        _datePicker = 0;
        [self showDatePicker];
    }];
    
    UILabel *titleLb = [UILabel labelWithFont:font_14 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    titleLb.text = @"起始时间";
    _stareBtnTitleLb = [UILabel labelWithFont:font_14 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    
    UIButton *endBtn = [[UIButton alloc] init];
    endBtn.backgroundColor = [UIColor whiteColor];
    [endBtn addActionBlock:^(UIButton *sender) {
        _datePicker = 1;
        [self showDatePicker];
    }];

    UILabel *endTitleLb = [UILabel labelWithFont:font_14 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    endTitleLb.text = @"截止时间";

    _endBtnTitleLb = [UILabel labelWithFont:font_14 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    UIButton *submitBtn = [UIButton buttonWithTitle:@"确定"];
    [submitBtn addActionBlock:^(UIButton *sender) {
        SHMorePointsViewController *morePointsVc = [[SHMorePointsViewController alloc] init];
        [self.navigationController pushViewController:morePointsVc animated:YES];
    }];
    THDatePickerView *dateView = [[THDatePickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300)];
    dateView.delegate = self;
    dateView.title = @"请选择时间";
    self.dateView = dateView;

    
    [self.view addSubview:stareBtn];
    [stareBtn addSubview:titleLb];
    [stareBtn addSubview:_stareBtnTitleLb];
    
    [self.view addSubview:lineView];
    
    [self.view addSubview:endBtn];
    [endBtn addSubview:endTitleLb];
    [endBtn addSubview:_endBtnTitleLb];
    
    [self.view addSubview:submitBtn];
    
    [self.view addSubview:self.dateView];
    __weak typeof(self) weakSelf = self;
    
    [stareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(zScaleH(10));
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(40)));
    }];
    
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView);
        make.centerY.equalTo(stareBtn);
    }];
    
    [_stareBtnTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineView);
        make.centerY.equalTo(stareBtn);
    }];

    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stareBtn.mas_bottom);
        make.left.equalTo(weakSelf.view).offset(zScaleW(13));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-13));
        make.height.equalTo(@(1));
    }];
    
    [endBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@(zScaleH(40)));
    }];
    
    [endTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView);
        make.centerY.equalTo(endBtn);
    }];
    
    [_endBtnTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineView);
        make.centerY.equalTo(endBtn);
    }];

    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(endBtn.mas_bottom).offset(zScaleH(40));
        make.left.equalTo(weakSelf.view).offset(zScaleW(60));
        make.right.equalTo(weakSelf.view).offset(zScaleW(-60));
        make.height.equalTo(@(zScaleH(40)));
    }];
    
}

- (void)showDatePicker
{
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
        [self.dateView show];
    }];
    
}

#pragma mark - THDatePickerViewDelegate
/**
 保存按钮代理方法
 
 @param timer 选择的数据
 */
- (void)datePickerViewSaveBtnClickDelegate:(NSString *)timer {
    NSLog(@"%@",timer);
    //    self.timerLbl.text = timer;
    
    if (_datePicker == 0) {
        // 开始时间
        NSString *time = [NSString stringWithFormat:@"%@:00",timer];
        time = [time substringToIndex:10];
        _stareBtnTitleLb.text = time;
        
    }else if (_datePicker == 1){
        // 结束时间
        NSString *time = [NSString stringWithFormat:@"%@:00",timer];
        
        time = [time substringToIndex:10];
        
        _endBtnTitleLb.text = time;
        
    }
    
    //    self.btn.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
}

/**
 取消按钮代理方法
 */
- (void)datePickerViewCancelBtnClickDelegate {
    NSLog(@"取消点击");
    //    self.btn.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
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
