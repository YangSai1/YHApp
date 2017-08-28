//
//  SHBlueHeadeViewTextView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHBlueHeadeViewTextView.h"

@interface SHBlueHeadeViewTextView ()

@end

@implementation SHBlueHeadeViewTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    _titleView = [[SHBlueLineTextView alloc] init];
    _titleView.lineView.hidden = YES;
    _titleView.detailText.hidden = YES;
    
    
    _shadowBgView = [[SHShadowView alloc] init];
    
    _textView = [[STTextView alloc] init];
    
    [self addSubview:_titleView];
    [self addSubview:_shadowBgView];
    [_shadowBgView addSubview:_textView];

    __weak typeof(self) weakSelf = self;

    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf);
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [_shadowBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleView.mas_bottom).offset(zScaleH(10));
        make.left.equalTo(weakSelf).offset(zScaleW(13));
        make.right.equalTo(weakSelf).offset(zScaleW(-13));
        make.bottom.equalTo(weakSelf);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.shadowBgView).offset(2);
        make.left.equalTo(weakSelf.shadowBgView).offset(2);
        make.right.equalTo(weakSelf.shadowBgView).offset(-2);
        make.bottom.equalTo(weakSelf.shadowBgView).offset(-2);
    }];
}
@end
