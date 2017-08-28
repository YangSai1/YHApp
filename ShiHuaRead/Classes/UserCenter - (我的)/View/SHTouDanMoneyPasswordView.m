//
//  SHTouDanMoneyPasswordView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTouDanMoneyPasswordView.h"

@interface SHTouDanMoneyPasswordView () <UITextFieldDelegate>

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIImageView *xingV;

@property(nonatomic, strong) UITextField *detailText;

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) UIView *lineView;


@property(nonatomic, copy) TextViewBlock block;


@end

@implementation SHTouDanMoneyPasswordView

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
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.borderColor = Color_E5E5E5.CGColor;
    bgView.layer.borderWidth = 1.0f;
    _bgView = bgView;
    
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.image = [UIImage imageNamed:@"icon-denglumima-39"];
    
    UILabel *titleLb = [UILabel labelWithFont:font_13 textColor: Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    _titleLb = titleLb;
    
    _xingV = [[UIImageView alloc] init];
    _xingV.image = [UIImage imageNamed:@"icon-xinji-16"];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    _lineView = lineView;
    
    UITextField *detailText = [[UITextField alloc] init];
    detailText.delegate = self;
    detailText.font = font_11;
    detailText.textColor = Color_252525;
    _detailText = detailText;

    [self addSubview:bgView];
    [bgView addSubview:_leftImageView];
    [bgView addSubview:_titleLb];
    [bgView addSubview:_xingV];
    [bgView addSubview:_lineView];
    [bgView addSubview:_detailText];

}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(zScaleW(20));
        make.right.equalTo(weakSelf).offset(zScaleW(-15));
        make.height.equalTo(@(zScaleH(44)));
    }];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(zScaleW(5));
        make.centerY.equalTo(weakSelf.bgView);
        make.width.height.equalTo(@(zScaleH(15)));
    }];
    
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(zScaleW(15));
        make.centerY.equalTo(weakSelf.bgView);
    }];
    
    [_xingV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLb);
        make.left.equalTo(weakSelf.titleLb.mas_right);
        make.width.height.equalTo(@(8));
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.xingV.mas_right).offset(zScaleW(25));
        make.top.equalTo(weakSelf.bgView).offset(zScaleH(10));
        make.bottom.equalTo(weakSelf.bgView).offset(zScaleH(-10));
        make.width.equalTo(@(zScaleW(1)));
    }];
    
    [_detailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineView.mas_right).offset(zScaleW(25));
        make.centerY.equalTo(weakSelf.bgView);
        make.width.equalTo(@(200));
        make.height.equalTo(weakSelf.bgView);
    }];
    
    
    [super updateConstraints];
    
}

- (void)setTitle:(NSString *)title placeholder:(NSString *)placeholder
{
    _titleLb.text = title;
    _detailText.placeholder = placeholder;
    [self updateConstraintsIfNeeded];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *str = textField.text;
    if (_block) {
        _block(str);
    }
}


- (void)registBlock:(TextViewBlock)block
{
    _block = block;
}
@end
