//
//  SHBlueHeaderImageCheckView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHBlueHeaderImageCheckView.h"

@interface SHBlueHeaderImageCheckView ()

@property(nonatomic, strong) UIViewController *containerVC;

@end

@implementation SHBlueHeaderImageCheckView

- (id)initWithContainerVC:(UIViewController *)containerVC
{
    if (self = [super initWithFrame:CGRectZero]) {
        _containerVC = containerVC;
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)initView
{
    _blueLineTextView = [[SHBlueLineTextView alloc] init];
    _blueLineTextView.lineView.hidden = YES;
    _blueLineTextView.detailText.hidden = YES;
    [_blueLineTextView setTitle:@"图片选择" placeholder:nil];
    
    SHImagePickerView *imagePickerView = [[SHImagePickerView alloc] initWithContainerVC:_containerVC];
    _imagePickerView = imagePickerView;
    [self addSubview:_blueLineTextView];
    [self addSubview:_imagePickerView];

    __weak typeof(self) weakSelf = self;

    [_blueLineTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf);
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@(zScaleH(44)));
    }];
    
    [_imagePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.blueLineTextView.mas_bottom).offset(zScaleH(5));
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@(zScaleH(80)));
        
    }];

}

@end
