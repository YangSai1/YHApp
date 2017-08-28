//
//  SHMineTitleLableView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineTitleLableView.h"

@interface SHMineTitleLableView ()<UITextFieldDelegate>

@property(nonatomic, strong) UITextField *textField;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, copy) TitleFieldViewBlock block;

@end

@implementation SHMineTitleLableView

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
    bgView.backgroundColor = [UIColor clearColor];
    
    _titleLb = [[UILabel alloc] init];
    _titleLb.textColor = Color_333333;
    _titleLb.font = font_15;

    _textField = [[UITextField alloc] init];
    _textField.textColor = Color_333333;
    _textField.font = font_15;
    _textField.delegate = self;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = Color_E5E5E5;
    _lineView = lineView;
    
    
    [self addSubview:bgView];
    [bgView addSubview:_textField];
    [bgView addSubview:lineView];
    [bgView addSubview:_titleLb];
    
    
    __weak typeof(self) weakSelf = self;
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(zScaleW(15));
        make.right.equalTo(weakSelf).offset(zScaleW(-15));
        make.centerY.equalTo(weakSelf);
        make.height.equalTo(@(zScaleH(50)));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(15);
        make.centerY.equalTo(bgView);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(90));
        make.height.equalTo(@(zScaleH(30)));
        make.right.equalTo(bgView).offset(zScaleW(-30));
        make.centerY.equalTo(bgView);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(5));
        make.right.equalTo(bgView).offset(zScaleW(-5));
        make.bottom.equalTo(bgView);
        make.height.equalTo(@(1.0));
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
