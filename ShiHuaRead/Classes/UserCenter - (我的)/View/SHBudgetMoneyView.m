//
//  SHBudgetMoneyView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHBudgetMoneyView.h"

@interface SHBudgetMoneyView() <UITextFieldDelegate>

@property(nonatomic, strong) UITextField *leftTextF;

@property(nonatomic, strong) UITextField *rightTextF;

@property(nonatomic, strong) TextBlock block;

@property(nonatomic, copy) NSString *leftStr;

@property(nonatomic, copy) NSString *rightStr;

@end

@implementation SHBudgetMoneyView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    UILabel *titleLb = [UILabel labelWithFont:font_14 textColor: Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    titleLb.text = @"预算金额";
    UITextField *detailText = [[UITextField alloc] init];
    detailText.delegate = self;
    detailText.font = font_12;
    detailText.textColor = Color_252525;
    _leftTextF = detailText;
    detailText.layer.borderWidth =  1;
    detailText.layer.borderColor = Color_E5E5E5.CGColor;

    UITextField *detailText1 = [[UITextField alloc] init];
    detailText1.delegate = self;
    detailText1.font = font_12;
    detailText1.textColor = Color_252525;
    _rightTextF = detailText1;
    detailText1.layer.borderWidth =  1;
    detailText1.layer.borderColor = Color_E5E5E5.CGColor;

    [self addSubview:titleLb];
    [self addSubview:detailText];
    [self addSubview:detailText1];
    
    __weak typeof(self) weakSelf = self;
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(15);
        make.centerY.equalTo(weakSelf);
    }];
    
    [_leftTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLb.mas_right).offset(40);
        make.centerY.equalTo(weakSelf);
        make.width.equalTo(@(43));
        make.height.equalTo(@(24));
    }];

    [_rightTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftTextF.mas_right).offset(15);
        make.centerY.equalTo(weakSelf);
        make.width.equalTo(@(43));
        make.height.equalTo(@(24));
    }];

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isEqual:_leftTextF]) {
        _leftStr = textField.text;
    }else if([textField isEqual:_rightTextF]){
        _rightStr = textField.text;
    }
    if (_block) {
        _block(_leftStr,_rightStr);
    }
    
}

- (void)registBlock:(TextBlock)block
{
    _block = block;
}

@end
