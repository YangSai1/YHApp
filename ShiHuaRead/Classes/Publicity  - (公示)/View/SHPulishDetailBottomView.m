//
//  SHPulishDetailBottomView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHPulishDetailBottomView.h"
#import "SHPulishZhongDanCell.h"

@interface SHPulishDetailBottomView () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UIView *headView;

@property(nonatomic, strong) UILabel *toudanNum;

@property(nonatomic, strong) UILabel *zhongdanNum;

@end

@implementation SHPulishDetailBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = [UIColor redColor];
    [self addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHPulishZhongDanCell *zhongdanCell = [tableView dequeueReusableCellWithIdentifier:@"zhongdanCell"];
    if (!zhongdanCell) {
        zhongdanCell = [[SHPulishZhongDanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"zhongdanCell"];
    }
    [zhongdanCell cofigModel:nil];
    return zhongdanCell;
}


- (void)config:(id)model
{
    _toudanNum.text = @"10000";
    _zhongdanNum.text = @"500";
}
#pragma mark - init view
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - zScaleH(40 + 8 + 64)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = gray_f3f3f3;
        _tableView.rowHeight = zScaleH(158);
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
    
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, zScaleH(55))];
        _headView.backgroundColor = [UIColor whiteColor];
        UILabel *touDanTitle = [UILabel labelWithFont:font_13 textColor:Color_157efb numberOfLines:1 textAlignment:NSTextAlignmentCenter];
        touDanTitle.text = @"投单数";
        UILabel *zhongdanTitle = [UILabel labelWithFont:font_13 textColor:Color_157efb numberOfLines:1 textAlignment:NSTextAlignmentCenter];
        zhongdanTitle.text = @"中单数";
        _toudanNum = [UILabel labelWithFont:font_13 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentCenter];
        _zhongdanNum = [UILabel labelWithFont:font_13 textColor:[UIColor redColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
        [_headView addSubview:touDanTitle];
        [_headView addSubview:zhongdanTitle];
        [_headView addSubview:_toudanNum];
        [_headView addSubview:_zhongdanNum];
        
        touDanTitle.frame = CGRectMake(0, zScaleW(8), kScreenWidth * 0.5, zScaleH(20));
        
        zhongdanTitle.frame = CGRectMake(kScreenWidth * 0.5, zScaleW(8), kScreenWidth * 0.5, zScaleH(20));
        _toudanNum.frame = CGRectMake(0, touDanTitle.bottom + zScaleH(2), touDanTitle.width, touDanTitle.height);
        _zhongdanNum.frame = CGRectMake(zhongdanTitle.x, touDanTitle.bottom + zScaleH(2), touDanTitle.width, touDanTitle.height);

    }
    return _headView;
}

@end
