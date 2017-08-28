//
//  SHAdviceCheckView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHAdviceCheckView.h"
#import "SHShadowView.h"
@interface SHAdviceCheckView ()

@property(nonatomic, copy) AdviceTypeBlock block;

@property(nonatomic, strong) UIButton *informBtn;

@property(nonatomic, strong) UIButton *complainBtn;

@property(nonatomic, strong) UIButton *adviceBtn;

@property(nonatomic, strong) SHShadowView *bgView;

@end

@implementation SHAdviceCheckView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    SHShadowView *bgView = [[SHShadowView alloc] initWithFrame:self.bounds];
    _bgView = bgView;
    __weak typeof(self) weakSelf = self;

    _informBtn = [[UIButton alloc] init];
    [_informBtn setImage:[UIImage imageNamed:@"icon-shangchuangshijinag-32"] forState:UIControlStateNormal];
    [_informBtn setImage:[UIImage imageNamed:@"icon-35"] forState:UIControlStateSelected];
    [_informBtn setTitle:@"举报" forState:UIControlStateNormal];
    _informBtn.titleLabel.font = font_14;
    [_informBtn setTitleColor:Color_252525 forState:UIControlStateNormal];
    [_informBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [_informBtn addActionBlock:^(UIButton *sender) {
        [weakSelf checkAdvice:AdviceTypeInform];
    }];
    _complainBtn = [[UIButton alloc] init];
    [_complainBtn setImage:[UIImage imageNamed:@"icon-shangchuangshijinag-32"] forState:UIControlStateNormal];
    [_complainBtn setImage:[UIImage imageNamed:@"icon-35"] forState:UIControlStateSelected];
    [_complainBtn setTitle:@"投诉" forState:UIControlStateNormal];
    _complainBtn.titleLabel.font = font_14;
    [_complainBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [_complainBtn setTitleColor:Color_252525 forState:UIControlStateNormal];
    [_complainBtn addActionBlock:^(UIButton *sender) {
        [weakSelf checkAdvice:AdviceTypeComplain];
    }];

    _adviceBtn = [[UIButton alloc] init];
    [_adviceBtn setImage:[UIImage imageNamed:@"icon-35"] forState:UIControlStateNormal];
    [_adviceBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [_adviceBtn setImage:[UIImage imageNamed:@"icon-35"] forState:UIControlStateSelected];
    [_adviceBtn setTitle:@"建议" forState:UIControlStateNormal];
    _adviceBtn.titleLabel.font = font_14;
    [_adviceBtn setTitleColor:Color_252525 forState:UIControlStateNormal];
    [_adviceBtn addActionBlock:^(UIButton *sender) {
        [weakSelf checkAdvice:AdviceTypeAdvice];
    }];

    [self addSubview:_bgView];
    
    [bgView addSubview:_informBtn];
    [bgView addSubview:_complainBtn];
    [bgView addSubview:_adviceBtn];

}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    
    [_informBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.right.equalTo(weakSelf.complainBtn.mas_left).offset(zScaleW(-60));
        make.width.equalTo(@(zScaleW(60)));
        make.height.equalTo(@(zScaleH(20)));
    }];
    
    [_complainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.centerX.equalTo(weakSelf);
        make.width.equalTo(@(zScaleW(60)));
        make.height.equalTo(@(zScaleH(20)));
    }];
    
    [_adviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf.complainBtn.mas_right).offset(zScaleW(60));
        make.width.equalTo(@(zScaleW(60)));
        make.height.equalTo(@(zScaleH(20)));
    }];
    [super updateConstraints];
}

- (void)checkAdvice:(AdviceType)type
{
    if (type == AdviceTypeInform) {
        _informBtn.selected = YES;
        _complainBtn.selected = NO;
        _adviceBtn.selected = NO;
    }else if (type == AdviceTypeComplain){
        _informBtn.selected = NO;
        _complainBtn.selected = YES;
        _adviceBtn.selected = NO;
    }else if (type == AdviceTypeAdvice){
        _informBtn.selected = NO;
        _complainBtn.selected = NO;
        _adviceBtn.selected = YES;
    }
    
    if (_block) {
        _block(type);
    }
}

- (void)registBlock:(AdviceTypeBlock)block
{
    _block = block;
}
@end
