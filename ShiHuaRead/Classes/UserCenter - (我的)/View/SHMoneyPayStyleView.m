//
//  SHMoneyPayStyleView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMoneyPayStyleView.h"

@interface SHMoneyPayStyleView () <UITextFieldDelegate>

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, strong) UILabel *titleLb;


@end

@implementation SHMoneyPayStyleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = [UIColor whiteColor];
    
    _leftImageView = [[UIImageView alloc] init];
    UILabel *titleLb = [UILabel labelWithFont:font_12 textColor: Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    _titleLb = titleLb;
    _rightBtn = [[UIButton alloc] init];
    [_rightBtn setImage:[UIImage imageNamed:@"充值2"] forState:UIControlStateNormal];
    [_rightBtn setImage:[UIImage imageNamed:@"充值1"] forState:UIControlStateSelected];
    
    [self addSubview:_leftImageView];
    [self addSubview:_titleLb];
    [self addSubview:_rightBtn];

}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(zScaleW(15));
        make.centerY.equalTo(weakSelf);
        make.width.height.equalTo(@(zScaleH(35)));
    }];
    
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(zScaleW(25));
        make.centerY.equalTo(weakSelf);
    }];
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(zScaleW(-15));
        make.centerY.equalTo(weakSelf);
        make.width.height.equalTo(@(zScaleH(15)));
    }];
    
    [super updateConstraints];
    
}

- (void)setTitle:(NSString *)title withImage:(NSString *)image
{
    _titleLb.text = title;
    _leftImageView.image = [UIImage imageNamed:image];
    [self updateConstraintsIfNeeded];
    
}

@end
