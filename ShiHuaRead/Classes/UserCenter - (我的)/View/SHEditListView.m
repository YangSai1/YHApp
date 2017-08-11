//
//  SHEditListView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHEditListView.h"
#import "CommonMenuView.h"

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
    
//    _dataArr = @[@"1",@"2",@"3"];
    
    NSDictionary *dict1 = @{@"imageName" : @"icon_button_affirm",
                            @"itemName" : @"撤回"
                            };
    NSDictionary *dict2 = @{@"imageName" : @"icon_button_recall",
                            @"itemName" : @"确认"
                            };
    NSDictionary *dict3 = @{@"imageName" : @"icon_button_record",
                            @"itemName" : @"记录"
                            };
    NSArray *dataArray = @[dict1,dict2,dict3];
    _dataArr = dataArray;

    __weak typeof(self) weakSelf = self;

    [CommonMenuView createMenuWithFrame:CGRectMake(0, 0, kScreenWidth - 30, 0) target:nil dataArray:_dataArr itemsClickBlock:^(NSString *str, NSInteger tag) {
        
        NSLog(@"%@ - %lu",str,tag);
        
        weakSelf.detailLb.text = str;
        
        if (_block) {
            _block(self,str);
        }

        
        [CommonMenuView hidden];
        //        [weakSelf doSomething:(NSString *)str tag:(NSInteger)tag]; // do something
    } backViewTap:^{
        //        weakSelf.flag = YES; // 这里的目的是，让rightButton点击，可再次pop出menu
    }];

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
    [CommonMenuView updateMenuItemsWith:_dataArr];
    CGPoint point = CGPointMake(self.centerX, self.bottom + 64);
    [CommonMenuView showMenuAtPoint:point];
    
    
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
