//
//  SHSeachBarView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHSeachBarView.h"

@interface SHSeachBarView ()<UITextFieldDelegate>

@property(nonatomic, strong) UIImageView *searchView;

@property(nonatomic, strong) UIImageView *searchImgView;

@property(nonatomic, strong) UITextField *seachTextField;

@property(nonatomic, copy) SeachBlock block;

@end

@implementation SHSeachBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    CGFloat barH = 30;
    _searchView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, barH)];
    _searchView.layer.cornerRadius = 6.0f;
    _searchView.image = [UIImage imageNamed:@"icon-shoushuokuang-5453-60"];
    _searchView.userInteractionEnabled = YES;
    _searchView.clipsToBounds = YES;
    [self addSubview:_searchView];
    
    _searchImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, (barH - 22)/2, 22, 22)];
    _searchImgView.userInteractionEnabled = YES;

    _searchImgView.image = [UIImage imageNamed:@"icon-shoushuo-39"];
    _searchImgView.contentMode = UIViewContentModeScaleAspectFit;
    [_searchView addSubview:_searchImgView];
    
    CGFloat searchLblXOffset = [_searchImgView xRightPosition] + 4;
    _seachTextField = [[UITextField alloc] initWithFrame:CGRectMake(searchLblXOffset, 0, [_searchView vWidth] - searchLblXOffset, barH)];
    
    UIColor * color = [UIColor whiteColor];
    [_seachTextField setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    _seachTextField.textColor = TabbarNorColer;
    _seachTextField.placeholder = @"搜索内容";
    _seachTextField.delegate = self;
    _seachTextField.font = fontCommon_14;
    _seachTextField.textAlignment = NSTextAlignmentLeft;
    [_searchView addSubview:_seachTextField];
    
    
//    _searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kBaseWidth*5/8, _height)];
//    [_searchView addSubview:_searchBtn];
}

- (void)registBlock:(SeachBlock)block
{
    _block = block;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *text = textField.text;
    if (_block) {
        _block(text);
    }
}

@end
