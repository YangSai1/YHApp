//
//  SHMineTopViewLbView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineTopViewLbView.h"

@interface SHMineTopViewLbView ()

@property(nonatomic, strong) UILabel *numLb;

@property(nonatomic, strong) UILabel *titleLb;

@end

@implementation SHMineTopViewLbView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}


- (void)initView
{
    _numLb = [UILabel labelWithFont:fontCommon_22 textColor:[UIColor whiteColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _numLb.text = @"36";
    
    _titleLb = [UILabel labelWithFont:fontCommon_10 textColor:[UIColor whiteColor] numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    _titleLb.text = @"发单";
    [self addSubview:_numLb];
    [self addSubview:_titleLb];
    
    __weak typeof(self) weakSelf = self;
    [_numLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(0);
        make.left.equalTo(weakSelf).offset(0);
        make.right.equalTo(weakSelf).offset(0);
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.numLb.mas_bottom).offset(0);
        make.left.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
    }];
}

- (void)setNumLb:(NSString *)num withNameLb:(NSString *)name
{
    _numLb.text = num;
    _titleLb.text = name;
}

@end
