//
//  SHEditView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHEditView.h"

@interface SHEditView ()<UITextFieldDelegate>

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIImageView *xingV;

@property(nonatomic, strong) UIImageView *rightImage;

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, copy) TextViewBlock block;

@end

@implementation SHEditView

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
    bgView.layer.borderColor = Color_E5E5E5.CGColor;
    bgView.layer.borderWidth = 1.0f;
    _bgView = bgView;
    UILabel *titleLb = [UILabel labelWithFont:font_14 textColor: Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    _titleLb = titleLb;
    
    _xingV = [[UIImageView alloc] init];
    _xingV.image = [UIImage imageNamed:@"icon-xinji-16"];
    
    UITextField *detailText = [[UITextField alloc] init];
    detailText.delegate = self;
    detailText.font = font_12;
    detailText.textColor = Color_252525;
    _detailText = detailText;
    
    UIImageView *rightView = [[UIImageView alloc] init];
    rightView.image = [UIImage imageNamed:@"icon-32-20"];
    _rightImage = rightView;
    
    [self addSubview:bgView];
    [bgView addSubview:_titleLb];
    [bgView addSubview:_xingV];
    [bgView addSubview:_detailText];
    [bgView addSubview:rightView];
    
//    _titleLb.backgroundColor = [UIColor redColor];
//    _detailText.backgroundColor = [UIColor greenColor];
    
}




- (void)registBlock:(TextViewBlock)block
{
    _block = block;
}

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail
{
    [self setTitle:title detailTitle:detail showXing:NO];
}

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail showXing:(BOOL)isShow
{
    [self setTitle:title detailTitle:detail showXing:isShow placehoder:nil];
}

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail showXing:(BOOL)isShow placehoder:(NSString *)placeh
{
    _titleLb.text = title;
    _detailText.text = detail;
    
    if (placeh) {
        _detailText.placeholder = placeh;
    }
    
    if (!isShow) {
        _xingV.hidden = YES;
    }
    _rightImage.hidden = YES;
    
    [self updateConstraintsIfNeeded];

}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(zScaleW(13));
        make.right.equalTo(weakSelf).offset(zScaleW(-13));
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(5);
        make.centerY.equalTo(weakSelf.bgView);
    }];
    
    [_xingV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLb);
        make.left.equalTo(weakSelf.titleLb.mas_right);
        make.width.height.equalTo(@(8));
    }];
    
    [_detailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(120);
        make.centerY.equalTo(weakSelf.bgView);
        make.width.equalTo(@(zScaleW(200)));
//        make.right.equalTo(weakSelf.bgView).offset(-30);
        make.height.equalTo(weakSelf.bgView);
    }];
    
    [_rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView).offset(-10);
        make.centerY.equalTo(weakSelf.bgView);
        make.width.equalTo(@(15));
        make.height.equalTo(@(10));
        
    }];
    
    [super updateConstraints];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *str = textField.text;
    if (_block) {
        _block(str);
    }
}

@end
