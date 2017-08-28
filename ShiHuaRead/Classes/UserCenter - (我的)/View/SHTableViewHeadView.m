//
//  SHTableViewHeadView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHTableViewHeadView.h"

@interface SHTableViewHeadView ()

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIView *lineView;

@property(nonatomic, strong) UIButton *rightBtn;

@property(nonatomic, strong) UIImageView *rightImageView;

@property(nonatomic, copy) HeaderClickBlock block;

@end

@implementation SHTableViewHeadView

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
    _titleLb  = [UILabel labelWithFont:font_14 textColor:Color_252525 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    __weak typeof(self) weakSelf = self;

    _rightBtn = [[UIButton alloc] init];
    _rightBtn.titleLabel.font = font_12;
    [_rightBtn setTitleColor:Color_a4a5a4 forState:UIControlStateNormal];
    [_rightBtn addActionBlock:^(UIButton *sender) {
        if (weakSelf.block) {
            weakSelf.block();
        }
    }];
    _rightImageView  = [[UIImageView alloc] init];
    _rightImageView.image = [UIImage imageNamed:@"arrow_gray@2x"];
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = Color_E5E5E5;
    
    [self addSubview:_titleLb];
    [self addSubview:_rightBtn];
    [self addSubview:_rightImageView];
    [self addSubview:_lineView];


}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(zScaleW(10));
        make.centerY.equalTo(weakSelf);
    }];
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.rightImageView.mas_left).offset(zScaleW(-5));
        make.centerY.equalTo(weakSelf);
    }];
    
    [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(zScaleW(-15));
        make.centerY.equalTo(weakSelf);
        make.width.equalTo(@(zScaleW(6)));
        make.height.equalTo(@(zScaleW(12)));

    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf);
        make.height.equalTo(@(1));
    }];
    [super updateConstraints];
}

- (void)setTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    _titleLb.text = title;
    [_rightBtn setTitle:subTitle forState:UIControlStateNormal];
    [self updateConstraintsIfNeeded];
}

- (void)registBlock:(HeaderClickBlock)block
{
    _block = block;
}
@end
