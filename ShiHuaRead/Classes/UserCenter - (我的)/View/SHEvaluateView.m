//
//  SHEvaluateView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHEvaluateView.h"

@interface  SHEvaluateView()

@property(nonatomic, strong) UIButton *goodEvaluateBtn;

@property(nonatomic, strong) UIButton *midEvaluateBtn;

@property(nonatomic, strong) UIButton *badEvaluateBtn;

@property(nonatomic, copy) EvaluateTypeViewBlock block;

@end


@implementation SHEvaluateView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}


- (void)initView
{
    __weak typeof(self) weakSelf = self;

    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = white_ffffff;
    
    _goodEvaluateBtn = [[UIButton alloc] init];
    [_goodEvaluateBtn setImage:[UIImage imageNamed:@"评价-好评-拷贝"] forState:UIControlStateNormal];
    [_goodEvaluateBtn setImage:[UIImage imageNamed:@"评价-好评"] forState:UIControlStateSelected];
    [_goodEvaluateBtn addActionBlock:^(UIButton *sender) {
        [weakSelf clickBtn:EvaluateTypeGood];
    }];
    UILabel *goodLb = [UILabel labelWithFont:font_14 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    goodLb.text = @"好评";
    
    _midEvaluateBtn = [[UIButton alloc] init];
    [_midEvaluateBtn setImage:[UIImage imageNamed:@"评价-中评"] forState:UIControlStateNormal];
    [_midEvaluateBtn setImage:[UIImage imageNamed:@"评价-中评-拷贝"] forState:UIControlStateSelected];
    [_midEvaluateBtn addActionBlock:^(UIButton *sender) {
        [weakSelf clickBtn:EvaluateTypeMid];
    }];
    UILabel *midLb = [UILabel labelWithFont:font_14 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    midLb.text = @"中评";
    
    _badEvaluateBtn = [[UIButton alloc] init];
    [_badEvaluateBtn setImage:[UIImage imageNamed:@"评价-差评"] forState:UIControlStateNormal];
    [_badEvaluateBtn setImage:[UIImage imageNamed:@"评价-差评-拷贝"] forState:UIControlStateSelected];
    [_badEvaluateBtn addActionBlock:^(UIButton *sender) {
        [weakSelf clickBtn:EvaluateTypeBad];
    }];
    UILabel *badLb = [UILabel labelWithFont:font_14 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    badLb.text = @"差评";
    
    [self addSubview:bgView];
    [bgView addSubview:_goodEvaluateBtn];
    [bgView addSubview:goodLb];

    [bgView addSubview:_midEvaluateBtn];
    [bgView addSubview:midLb];

    [bgView addSubview:_badEvaluateBtn];
    [bgView addSubview:badLb];

    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(zScaleW(13));
        make.right.equalTo(weakSelf).offset(zScaleW(-13));
        make.top.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
    }];
    
    CGFloat WH = zScaleH(30);
    
    [_goodEvaluateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.midEvaluateBtn.mas_left).offset(zScaleW(-100));
        make.top.equalTo(weakSelf.midEvaluateBtn);
        make.width.height.equalTo(@(WH));
    }];
    [goodLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.goodEvaluateBtn.mas_bottom).offset(zScaleH(2));
        make.centerX.equalTo(weakSelf.goodEvaluateBtn);
    }];
    
    [_midEvaluateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(bgView).offset(zScaleH(5));
        make.width.height.equalTo(@(WH));
    }];
    [midLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.midEvaluateBtn.mas_bottom).offset(zScaleH(2));
        make.centerX.equalTo(weakSelf.midEvaluateBtn);
    }];

    [_badEvaluateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.midEvaluateBtn.mas_right).offset(zScaleW(100));
        make.top.equalTo(weakSelf.midEvaluateBtn);
        make.width.height.equalTo(@(WH));
    }];
    [badLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.badEvaluateBtn.mas_bottom).offset(zScaleH(2));
        make.centerX.equalTo(weakSelf.badEvaluateBtn);
    }];

    
}

- (void)clickBtn:(EvaluateType)type
{
    if (type == EvaluateTypeGood) {
        _badEvaluateBtn.selected = NO;
        _midEvaluateBtn.selected = NO;
        _goodEvaluateBtn.selected = YES;
    }else if (type == EvaluateTypeMid){
        _badEvaluateBtn.selected = NO;
        _midEvaluateBtn.selected = YES;
        _goodEvaluateBtn.selected = NO;
    }else if (type == EvaluateTypeBad){
        _badEvaluateBtn.selected = YES;
        _midEvaluateBtn.selected = NO;
        _goodEvaluateBtn.selected = NO;
    }
    
    if (_block) {
        _block(type);
    }

}

- (void)registEvaluateBlock:(EvaluateTypeViewBlock)block
{
    _block = block;
}
@end
