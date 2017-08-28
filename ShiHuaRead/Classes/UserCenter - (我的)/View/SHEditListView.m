//
//  SHEditListView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHEditListView.h"
#import "CommonMenuView.h"
#import "SHPopListView.h"
#import "LEEAlert.h"
@interface SHEditListView ()

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIImageView *xingV;

@property(nonatomic, strong) UIImageView *rightImage;

@property(nonatomic, strong) UIView *bgView;

//@property(nonatomic, strong) NSArray *dataArr;

@property(nonatomic, copy) TipViewBlock block;


@end

@implementation SHEditListView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _isShowListView = YES;
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
    
    UILabel *detailLb = [UILabel labelWithFont:font_12 textColor: Color_c1c1c1 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    _detailLb = detailLb;
    
    UIImageView *rightView = [[UIImageView alloc] init];
    rightView.image = [UIImage imageNamed:@"icon-32-20"];
    _rightImage = rightView;
    [self addSubview:bgView];
    
    __weak typeof(self) weakSelf = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    [_bgView addGestureRecognizer:tap];
    
    [bgView addSubview:_titleLb];
    [bgView addSubview:_xingV];
    [bgView addSubview:detailLb];
    [bgView addSubview:rightView];
    
}

- (void)tap:(UITapGestureRecognizer *)sender
{
    
    if (!_isShowListView) {
        if (_block) {
            _block(self,nil);
        }
        return;
    }
    
    __weak typeof(self) weakSelf = self;

    SHPopListView *view = [[SHPopListView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 200) style:UITableViewStylePlain];
    
    view.array = _dataArr;
    
    [view registBlock:^(NSString *title) {
       
        [LEEAlert closeWithCompletionBlock:^{
            
            NSLog(@"选中的%@" ,title);
            weakSelf.detailLb.text = title;
            if (_block) {
                _block(self,title);
            }

        }];
        
    }];
    
    [LEEAlert actionsheet].config
    .LeeTitle(@"请选择")
    .LeeItemInsets(UIEdgeInsetsMake(0, 0, 20, 0))
    .LeeAddCustomView(^(LEECustomView *custom) {
        
        custom.view = view;
        
        custom.isAutoWidth = YES;
    })
    .LeeItemInsets(UIEdgeInsetsMake(0, 0, 0, 0))
    .LeeAddAction(^(LEEAction *action) {
        
        action.title = @"取消";
        
        action.titleColor = TabbarNorColer;
        
        action.backgroundColor = [UIColor whiteColor];
    })
    .LeeHeaderInsets(UIEdgeInsetsMake(20, 0, 0, 0))
    .LeeHeaderColor([UIColor whiteColor])
    .LeeActionSheetBottomMargin(0.0f) // 设置底部距离屏幕的边距为0
    .LeeCornerRadius(0.0f) // 设置圆角曲率为0
    .LeeConfigMaxWidth(^CGFloat(LEEScreenOrientationType type) {
        
        // 这是最大宽度为屏幕宽度 (横屏和竖屏)
        
        return CGRectGetWidth([[UIScreen mainScreen] bounds]);
    })
    .LeeShow();

}

- (void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;

}


- (void)registBlock:(TipViewBlock)block
{
    _block = block;
}

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail
{
    [self setTitle:title detailTitle:detail showXing:YES];
}

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail showXing:(BOOL)isShow
{
    _titleLb.text = title;
    _detailLb.text = detail;
    if (!isShow) {
        _xingV.hidden = YES;
    }
    
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints
{
    __weak typeof(self) weakSelf = self;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(15);
        make.right.equalTo(weakSelf).offset(-15);
        make.height.equalTo(@(44));
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
    
    [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.xingV.mas_right).offset(40);
        make.centerY.equalTo(weakSelf.bgView);
    }];
    
    [_rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView).offset(-10);
        make.centerY.equalTo(weakSelf.bgView);
        make.width.equalTo(@(15));
        make.height.equalTo(@(10));

    }];
    
    [super updateConstraints];

}

@end
