//
//  JBVerifyCodeView.m
//  JamBoHealth
//
//  Created by zyh on 15/9/7.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import "JBVerifyCodeView.h"
#import "JBDownLine.h"
#import "JBCountdownAsBtnView.h"

@interface JBVerifyCodeView ()<UITextFieldDelegate>

@property(nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, strong) UITextField *textField;

@property(nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) SendVerifyCodeBlock sendVerifyCodeBlock;

@end

@implementation JBVerifyCodeView

- (id)init
{
    if (self = [super init]) {
        [self initViewWithFrame:CGRectMake(0, 0, kScreenWidth, 58)];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initViewWithFrame:frame];
//        self.backgroundColor = white_ffffff;
    }
    return self;
}

- (void)initViewWithFrame:(CGRect)frame
{
    self.frame = CGRectMake(0, frame.origin.y, kScreenWidth, cellH);
    
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.image = [UIImage imageNamed:@"icon-yanzhengma--40"];
    
    [self addSubview:self.leftImageView];
    [self addSubview:self.textField];
    [self addSubview:self.lineView];
    
    
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

    
    
    _countdownBtnView = [[JBCountdownAsBtnView alloc] initWithFrame:CGRectMake(kScreenWidth - 15 - 80, (cellH - 15)/2, 80, 25)];
    _countdownBtnView.backgroundColor = Color(@"157efb");
    [_countdownBtnView setCountdownTouchBlock:^{
        BOOL bResult = NO;
        if (weakSelf.sendVerifyCodeBlock) {
            bResult = weakSelf.sendVerifyCodeBlock(weakSelf.countdownBtnView);
        }
        return bResult;
    }];
    [self addSubview:_countdownBtnView];
    
    _downLine = [[JBDownLine alloc] initWithFrame:CGRectMake(12, self.frame.size.height - 0.5, kScreenWidth - 12*2, 0.5) Style:colorStyleE6e6e6];
    [self addSubview:_downLine];
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.textColor = LoginTitleColer;
        _textField.font = fontCommon_15;
        _textField.delegate = self;
        _textField.placeholder = @"请输入手机验证码";
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


- (NSString *)verifyCodeContent
{
    return _verifyCodeTxtField.text;
}

- (void)startVerifyCode
{
    [_countdownBtnView startCountdown];
}

- (void)endVerifyCode
{
    [_countdownBtnView stopCountdown];
}

- (void)setLineColor:(UIColor *)color
{
    _downLine.backgroundColor = color;
}

- (void)setBtnTitle:(NSString *)title
{
    [_countdownBtnView setVerifyCodeTitle:title];
}

- (void)setLettImage:(NSString *)imageStr
{
    _leftImageView.image = [UIImage imageNamed:imageStr];
}
@end
