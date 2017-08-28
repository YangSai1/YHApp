//
//  SHCashMoneyTitleTextFieldView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHCashMoneyTitleTextFieldView.h"

@interface SHCashMoneyTitleTextFieldView ()<UITextFieldDelegate>

@property(nonatomic, strong) UITextField *textField;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, copy) TitleFieldViewBlock block;

@end

@implementation SHCashMoneyTitleTextFieldView

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
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor clearColor];
    
    _titleLb = [[UILabel alloc] init];
    _titleLb.textColor = Color_333333;
    _titleLb.font = font_15;
    
    _textField = [[UITextField alloc] init];
    _textField.textColor = Color_333333;
    _textField.font = font_12;
    _textField.delegate = self;
    
    [self addSubview:bgView];
    [bgView addSubview:_textField];
    [bgView addSubview:_titleLb];
    
    
    __weak typeof(self) weakSelf = self;
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf);
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(15);
        make.centerY.equalTo(bgView);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(120));
        make.height.equalTo(@(zScaleH(30)));
        make.right.equalTo(bgView).offset(zScaleW(-30));
        make.centerY.equalTo(bgView);
    }];
    
}

- (void)setTitle:(NSString *)title placeholder:(NSString *)placeholder
{
    
    _textField.placeholder = placeholder;
    
    _titleLb.text = title;
    
    if (placeholder == nil) {
        _textField.userInteractionEnabled = NO;
    }
    
}

- (void)updateConstraints
{
    
    [super updateConstraints];
}

- (void)registBlock:(TitleFieldViewBlock)block
{
    _block = block;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_block) {
        _block(textField.text);
    }
}
@end
