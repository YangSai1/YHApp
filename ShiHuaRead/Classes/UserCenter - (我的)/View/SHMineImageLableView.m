//
//  SHMineImageLableView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineImageLableView.h"

@interface SHMineImageLableView ()

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, copy) TipViewBlock block;

@end

@implementation SHMineImageLableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = white_ffffff;
    
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.hidden = YES;
    
    _titleLb = [[UILabel alloc] init];
    _titleLb.textColor = Color_333333;
    _titleLb.font = font_15;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    _lineView = lineView;
    
    UIImageView *rightImageView = [[UIImageView alloc] init];
    rightImageView.image = [UIImage imageNamed:@"arrow_gray@2x"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    [bgView addGestureRecognizer:tap];

    
    [self addSubview:bgView];
    [bgView addSubview:_titleLb];
    [bgView addSubview:lineView];
    [bgView addSubview:_leftImageView];
    [bgView addSubview:rightImageView];

    
    __weak typeof(self) weakSelf = self;
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(zScaleW(15));
        make.right.equalTo(weakSelf).offset(zScaleW(-15));
        make.centerY.equalTo(weakSelf);
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(5);
        make.height.width.equalTo(@(zScaleH(20)));
        make.centerY.equalTo(bgView);
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(15));
        make.height.equalTo(@(zScaleH(30)));
        make.right.equalTo(bgView).offset(zScaleW(-30));
        make.centerY.equalTo(bgView);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(10));
        make.right.equalTo(bgView).offset(zScaleW(-10));
        make.bottom.equalTo(bgView);
        make.height.equalTo(@(1.0));
    }];
    
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineView);
        make.height.equalTo(@(zScaleH(12)));
        make.width.equalTo(@(zScaleH(6)));
        make.centerY.equalTo(bgView);
    }];
    
}

- (void)setImage:(NSString *)image text:(NSString *)text
{
    
    _titleLb.text = text;
    
    _leftImageView.image = [UIImage imageNamed:image];
    
}

- (void)tap:(UITapGestureRecognizer *)sender
{
    if (_block) {
        _block();
    }
}

- (void)registBlock:(TipViewBlock)block
{
    _block = block;
}

@end
