//
//  SHBlueLineTextView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHBlueLineTextView.h"

@interface SHBlueLineTextView () <UITextFieldDelegate>

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, copy) EditTextViewBlocl block;

@property(nonatomic, strong) UIView *bgView;

@end

@implementation SHBlueLineTextView

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
    _bgView = bgView;
    
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.image = [UIImage imageNamed:@"icon-5-29"];
    
    _titleLb = [[UILabel alloc] init];
    _titleLb.textColor = Color_252525;
    _titleLb.font = font_14;
    
    UITextField *detailText = [[UITextField alloc] init];
    detailText.delegate = self;
    detailText.font = font_13;
    detailText.textColor = Color_252525;
    _detailText = detailText;

    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    _lineView = lineView;
    
    [self addSubview:_bgView];
    [bgView addSubview:_titleLb];
    [bgView addSubview:_lineView];
    [bgView addSubview:_leftImageView];
    [bgView addSubview:_detailText];
}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(zScaleW(13));
        make.height.equalTo(@(zScaleH(20)));
        make.width.equalTo(@(zScaleH(3)));
        make.bottom.equalTo(weakSelf.bgView).offset(zScaleH(-7));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(zScaleW(10));
        make.bottom.equalTo(weakSelf.leftImageView).offset(zScaleH(3));
    }];
    
    [_detailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLb.mas_right).offset(zScaleW(15));
        make.bottom.equalTo(weakSelf.leftImageView).offset(zScaleH(3));
        make.width.equalTo(@(zScaleW(200)));
    }];

    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(zScaleW(13));
        make.right.equalTo(weakSelf.bgView).offset(zScaleW(-13));
        make.bottom.equalTo(weakSelf.bgView);
        make.height.equalTo(@(1.0));
    }];
    
    [super updateConstraints];
}

- (void)setTitle:(NSString *)title placeholder:(NSString *)placeHolder;
{
    
    _titleLb.text = title;
    
    _detailText.placeholder = placeHolder;
    
    [self updateConstraintsIfNeeded];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_block) {
        _block(textField.text);
    }
}

- (void)registBlock:(EditTextViewBlocl)block
{
    _block = block;
}
@end
