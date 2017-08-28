//
//  SHICanTopView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHICanTopView.h"

@interface SHICanTopView ()

@end

@implementation SHICanTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initView];
        
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = gray_f3f3f3;
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor whiteColor];
    
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed:@"icon-tupian-183-221"];
    
    _nameLb = [UILabel labelWithFont:fontCommon_15 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _skillLb = [UILabel labelWithFont:fontCommon_10 textColor:[UIColor whiteColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _skillLb.backgroundColor = Color_157efb;
    _skillLb.layer.cornerRadius = 6;
    _skillLb.layer.masksToBounds = YES;
    
    _fadanNumLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];

    _fadaGoodV = [[UIImageView alloc] init];
    _fadaGoodV.image = [UIImage imageNamed:@"icon-haopin-21"];
    _fadanGoodLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _fadaBadV = [[UIImageView alloc] init];
    _fadaBadV.backgroundColor = [UIColor redColor];
    _fadaBadV.image = [UIImage imageNamed:@"icon-chapin-21"];
    
    _fadanBadLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _toudanGoodV = [[UIImageView alloc] init];
    _toudanGoodV.image = [UIImage imageNamed:@"icon-haopin-21"];
    _toudanGoodLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _toudanBadV = [[UIImageView alloc] init];
    _toudanBadV.image = [UIImage imageNamed:@"icon-chapin-21"];
    _toudanBadLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = Color_E5E5E5;
    
    _detailLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    _detailRightV = [[UIImageView alloc] init];
    _detailRightV.image = [UIImage imageNamed:@"icon-xianche-28"];
    
    [self addSubview:_bgView];
    [_bgView addSubview:_iconImageView];
    [_bgView addSubview:_nameLb];
    [_bgView addSubview:_skillLb];
    [_bgView addSubview:_fadanNumLb];
    [_bgView addSubview:_fadaGoodV];
    [_bgView addSubview:_fadanGoodLb];
    [_bgView addSubview:_fadaBadV];
    [_bgView addSubview:_fadanBadLb];
    [_bgView addSubview:_toudanGoodV];
    [_bgView addSubview:_toudanGoodLb];
    [_bgView addSubview:_toudanBadV];
    [_bgView addSubview:_toudanBadLb];
    [_bgView addSubview:_lineView];
    [_bgView addSubview:_detailLb];
    [_bgView addSubview:_detailRightV];
    
    __weak typeof(self) weakSelf = self;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.top.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
    }];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf.bgView).offset(zScaleH(8));
        make.width.equalTo(@(zScaleW(92)));
        make.height.equalTo(@(zScaleW(112)));
    }];
    
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImageView).offset(zScaleH(8));
        make.left.equalTo(weakSelf.iconImageView.mas_right).offset(zScaleW(22));
    }];
    
    [_skillLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.nameLb);
        make.left.equalTo(weakSelf.nameLb.mas_right).offset(zScaleW(22));
        make.height.equalTo(@(zScaleH(15)));
        make.width.equalTo(@(zScaleW(50)));
    }];

    [_fadanNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLb.mas_bottom).offset(zScaleH(8));
        make.left.equalTo(weakSelf.nameLb);
    }];
    
    [_fadaGoodV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLb);
        make.top.equalTo(weakSelf.fadanNumLb.mas_bottom).offset(zScaleH(8));
        make.width.height.equalTo(@(zScaleH(10)));
    }];
    
    [_fadanGoodLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.fadaGoodV.mas_right).offset(zScaleW(6));
        make.centerY.equalTo(weakSelf.fadaGoodV);
    }];
    
    [_fadaBadV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.fadanBadLb.mas_left).offset(zScaleW(-6));
        make.centerY.equalTo(weakSelf.fadaGoodV);
        make.width.height.equalTo(@(zScaleH(10)));
    }];
    
    [_fadanBadLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.lineView.mas_right).offset(zScaleW(-2));
        make.centerY.equalTo(weakSelf.fadaGoodV);
    }];

    
    [_toudanGoodV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLb);
        make.top.equalTo(weakSelf.fadaGoodV.mas_bottom).offset(zScaleH(8));
        make.width.height.equalTo(@(zScaleH(10)));
    }];
    
    [_toudanGoodLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.toudanGoodV.mas_right).offset(zScaleW(6));
        make.centerY.equalTo(weakSelf.toudanGoodV);
    }];
    
    [_toudanBadV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.fadaBadV);
        make.centerY.equalTo(weakSelf.toudanGoodV);
        make.width.height.equalTo(@(zScaleH(10)));
    }];
    
    [_toudanBadLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.lineView.mas_right).offset(zScaleW(-2));
        make.centerY.equalTo(weakSelf.toudanGoodV);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLb);
        make.right.equalTo(weakSelf.bgView).offset(zScaleW(-10));
        make.top.equalTo(weakSelf.toudanGoodV.mas_bottom).offset(zScaleH(8));
        make.height.equalTo(@(1));
    }];
    
    [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineView).offset(zScaleW(2));
        make.top.equalTo(weakSelf.lineView.mas_bottom).offset(zScaleH(8));
    }];
    
    [_detailRightV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.detailLb.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.detailLb);
        make.width.equalTo(@(zScaleH(15)));
        make.height.equalTo(@(zScaleH(12)));
    }];

}
@end
