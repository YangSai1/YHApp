//
//  SHThrowMoneryView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHThrowMoneryView.h"

@interface SHThrowMoneryView ()

@property(nonatomic, strong) UIButton *firstBtn;

@property(nonatomic, strong) UIButton *senoundBtn;

@property(nonatomic, strong) ChangeBlock block;

@end

@implementation SHThrowMoneryView

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
    titleLb.text = @"投单人要求";

    _firstBtn = [[UIButton alloc] init];
    [_firstBtn setImage:[UIImage imageNamed:@"icon-40"] forState:UIControlStateNormal];
    [_firstBtn setTitle:@"有投单履约金" forState:UIControlStateNormal];
    [_firstBtn setTitleColor:Color_252525 forState:UIControlStateNormal];
//    _firstBtn.backgroundColor = [UIColor greenColor];
    _firstBtn.titleLabel.font = font_14;
    [_firstBtn setImage:[UIImage imageNamed:@"icon-40-40"] forState:UIControlStateSelected];
    __weak typeof(self) weakSelf = self;

    [_firstBtn addActionBlock:^(UIButton *sender) {
        [weakSelf click:sender];
    }];
    
    _senoundBtn = [[UIButton alloc] init];
    [_senoundBtn setImage:[UIImage imageNamed:@"icon-40"] forState:UIControlStateNormal];
    [_senoundBtn setTitle:@"无投单履约金" forState:UIControlStateNormal];
//    _senoundBtn.backgroundColor = [UIColor redColor];
    [_senoundBtn setTitleColor:Color_252525 forState:UIControlStateNormal];
    _senoundBtn.titleLabel.font = font_14;
    [_senoundBtn setImage:[UIImage imageNamed:@"icon-40-40"] forState:UIControlStateSelected];
    [_senoundBtn addActionBlock:^(UIButton *sender) {
        [weakSelf click:sender];
    }];
    
    [self addSubview:titleLb];
    [self addSubview:_firstBtn];
    [self addSubview:_senoundBtn];
    
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(15);
        make.centerY.equalTo(weakSelf);
    }];
    
    [_firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLb.mas_right).offset(40);
        make.centerY.equalTo(weakSelf);
        make.height.equalTo(@(20));
    }];
    
    [_senoundBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.firstBtn.mas_right).offset(15);
        make.centerY.equalTo(weakSelf);
        make.height.equalTo(@(20));
    }];

}

- (void)click:(UIButton *)btn
{
    if ([btn isEqual:_firstBtn]) {
        _senoundBtn.selected = NO;
        _firstBtn.selected = YES;
    }else{
        _senoundBtn.selected = YES;
        _firstBtn.selected = NO;
    }
    
    BOOL isSelectB = false;
    if (_firstBtn.selected) {
        isSelectB = YES;
    }
    if (_senoundBtn.selected) {
        isSelectB = NO;
    }
    
    if (_block) {
        _block(isSelectB);
    }
    
    NSLog(@"%@",isSelectB ? @"是" : @"否");
}

- (void)registBlock:(ChangeBlock)block{
    _block = block;
}


@end
