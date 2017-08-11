//
//  JBSearchTopView.m
//  JamBoHealth
//
//  Created by ebaolife on 15/8/28.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import "JBSearchTopView.h"

@implementation JBSearchTopView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
//        backImg.image = [EBUtility scaleImage:[UIImage imageNamed:@"common_top_new"] toSize:CGSizeMake(kScreenWidth, 64)];
//        backImg.contentMode = UIViewContentModeScaleToFill;
//        [self addSubview:backImg];
        
        UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(10, 27, kScreenWidth - 65, 30)];
        [self setBackgroundColor:blue_0099ff];
        searchView.layer.cornerRadius = 3;
        searchView.clipsToBounds = YES;
        [self addSubview:searchView];
        
        UIImageView *arrowImgView = [[UIImageView alloc] initWithFrame:CGRectMake(45, 42, 8, 8)];
        arrowImgView.contentMode = UIViewContentModeScaleAspectFit;
        arrowImgView.image = [UIImage imageNamed:@"common_separator_one"];
        [self addSubview:arrowImgView];
        
        _chooseTypeBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 40, 44)];
        _chooseTypeBtn.titleLabel.font = fontCommon_14;
        [_chooseTypeBtn setTitleColor:white_ffffff forState:UIControlStateNormal];
        [self addSubview:_chooseTypeBtn];
        
        _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 50, 20, 40, 44)];
        _cancelBtn.titleLabel.font = fontCommon_17;
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:_cancelBtn];
        
        UIImageView *searchImgView = [[UIImageView alloc] initWithFrame:CGRectMake([_chooseTypeBtn xRightPosition] + 10, 32, 20, 20)];
        searchImgView.contentMode = UIViewContentModeScaleAspectFit;
        searchImgView.image = [UIImage imageNamed:@"home_search"];
        [self addSubview:searchImgView];
        
        _contentTxtField = [[UITextField alloc] initWithFrame:CGRectMake([searchImgView xRightPosition] + 10 , 27, kScreenWidth - [searchImgView xRightPosition] - 40 - 30, 30)];
        _contentTxtField.returnKeyType = UIReturnKeySearch;
        _contentTxtField.placeholder = @"请输入关键词搜索";
        _contentTxtField.font = fontCommon_14;
        _contentTxtField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _contentTxtField.textColor = white_ffffff;
        _contentTxtField.tintColor = white_ffffff;
        [_contentTxtField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        [self addSubview:_contentTxtField];
//        UILabel *downline = [[UILabel alloc] initWithFrame:CGRectMake([_chooseTypeBtn xRightPosition]+10, [_contentTxtField yBottomPosition] + 4, _contentTxtField.frame.size.width, 1)];
//        downline.backgroundColor = [UIColor whiteColor];
//        [self addSubview:downline ];
        
        
        
    }
    return  self;
}

@end
