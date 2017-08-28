//
//  SHSkillView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHSkillView.h"

@interface SHSkillView ()

@property(nonatomic, strong) UIScrollView *scrollview;

@end

@implementation SHSkillView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    _scrollview = [[UIScrollView alloc] init];
    _scrollview.backgroundColor = [UIColor whiteColor];
    _scrollview.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollview];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat pinleiBtnW = zScaleW(80);
    
    CGFloat margin = zScaleW(20);

    _scrollview.frame = self.bounds;
    
    _scrollview.contentSize = CGSizeMake(_titleArray.count * (margin + pinleiBtnW) + margin, 0);
}

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    
    CGFloat pinleiBtnW = zScaleW(80);
    
    CGFloat margin = zScaleW(20);
    
    for (int i = 0; i < titleArray.count; i ++) {
        UIButton * pinLeiBtn = [UIButton buttonWithType: UIButtonTypeCustom];
        [pinLeiBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [pinLeiBtn setTitleColor:Color(@"007AFF") forState:UIControlStateNormal];
        pinLeiBtn.titleLabel.font = font_11;
        pinLeiBtn.layer.cornerRadius = 7.0;
        pinLeiBtn.layer.borderColor = Color(@"007AFF").CGColor;
        pinLeiBtn.layer.borderWidth = 0.7;
        pinLeiBtn.layer.masksToBounds = YES;
        pinLeiBtn.frame = CGRectMake((pinleiBtnW + margin) * i + margin, zScaleH(7), pinleiBtnW, zScaleH(16));
        [self.scrollview addSubview:pinLeiBtn];
    }

}

@end
