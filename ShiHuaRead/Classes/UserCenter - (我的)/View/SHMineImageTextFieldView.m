//
//  SHMineImageTextFieldView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHMineImageTextFieldView.h"

@interface SHMineImageTextFieldView ()<UITextFieldDelegate>

@property(nonatomic, strong) UITextField *textField;

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, copy) ChangeTextFieldViewBlock block;

@end

@implementation SHMineImageTextFieldView

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
//    _leftImageView.image = [UIImage imageNamed:@"icon-denglumima-39"];
    
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
    [bgView addSubview:_leftImageView];
    
    
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
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(zScaleW(40));
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
    
}

- (void)setImage:(NSString *)image placeholder:(NSString *)placeholder
{
    
    _textField.placeholder = placeholder;

    _leftImageView.image = [UIImage imageNamed:image];

}

- (void)updateConstraints
{
    
    [super updateConstraints];
}

- (void)registBlock:(ChangeTextFieldViewBlock)block
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
