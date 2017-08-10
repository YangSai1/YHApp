//
//  SHThirdLoginView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHThirdLoginView.h"

@interface SHThirdLoginView ()


@end

@implementation SHThirdLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initView];
        
    }
    return self;
}

- (void)initView
{
    UILabel *tipLb = [UILabel labelWithFont:fontCommon_12 textColor:LoginTitleColer numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    tipLb.text = @"第三方账号登陆";
    
    UIView *leftLine = [[UIView alloc] init];
    leftLine.backgroundColor = Color_E5E5E5;
    
    UIView *rightLine = [[UIView alloc] init];
    rightLine.backgroundColor = Color_E5E5E5;
    
    _weixinBtn = [[SHThirdLoginBtn alloc] initWithImage:@"icon-weixin-55" title:@"微信登陆"];
    
    _qqBtn = [[SHThirdLoginBtn alloc] initWithImage:@"icon-QQ-55" title:@"QQ登陆"];
    
    [self addSubview:tipLb];
    [tipLb addSubview:leftLine];
    [tipLb addSubview:rightLine];

    [self addSubview:_weixinBtn];
    [self addSubview:_qqBtn];
    
    __weak typeof(self) weakSelf = self;
    [tipLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf);
        make.centerX.equalTo(weakSelf);
    }];
    
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(tipLb);
        make.right.equalTo(tipLb.mas_left).offset(-10);
        make.width.equalTo(@(60));
        make.height.equalTo(@(1));
    }];
    
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(tipLb);
        make.left.equalTo(tipLb.mas_right).offset(10);
        make.width.equalTo(@(60));
        make.height.equalTo(@(1));
    }];
    
    [_weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipLb.mas_bottom).offset(19);
        make.right.equalTo(weakSelf.mas_centerX).offset(-20);
        make.height.equalTo(@(40));
    }];
    
    [_qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipLb.mas_bottom).offset(19);
        make.left.equalTo(weakSelf.mas_centerX).offset(20);
        make.height.equalTo(@(40));
    }];



    
}
@end
