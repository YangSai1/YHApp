//
//  SHTextFieldLineView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTextFieldLineView.h"

@interface SHTextFieldLineView ()<UITextFieldDelegate>

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, strong) UITextField *textField;

@property(nonatomic, strong) UIView *lineView;

@property(nonatomic, copy) SHTextFieldLineViewBlock block;

@property(nonatomic, copy) NSString *imageStr;

@property(nonatomic, copy) NSString *placeholder;

@end

@implementation SHTextFieldLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithImage:(NSString *)leftImage placeholder:(NSString *)placeholder valueAction:(SHTextFieldLineViewBlock)block
{
    _imageStr = leftImage;
    _placeholder = placeholder;
    _block = block;
    return [self init];
}
#pragma mark - 初始化视图
- (void)initView
{
    [self addSubview:self.leftImageView];
    [self addSubview:self.textField];
    [self addSubview:self.lineView];
    
    self.leftImageView.image = [UIImage imageNamed:_imageStr];
    self.textField.placeholder = _placeholder;
    
    __weak typeof(self) weakSelf = self;
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineView).offset(3.0f);
        make.bottom.equalTo(weakSelf.lineView.mas_top).offset(-10);
        make.height.width.equalTo(@(20));
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(30.0f);
        make.centerY.equalTo(weakSelf.leftImageView);
        make.right.equalTo(weakSelf.lineView.mas_right);
        make.height.equalTo(@(30));
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(15);
        make.right.equalTo(weakSelf).offset(-15);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-1.0);
        make.height.equalTo(@(1.0f));
    }];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *text = textField.text;
    if (_block) {
        _block(text);
    }
}

#pragma mark - setter/getter
- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.textColor = LoginTitleColer;
        _textField.font = fontCommon_15;
        _textField.delegate = self;
    }
    return _textField;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = Color_E5E5E5;
    }
    return _lineView;
}
@end
