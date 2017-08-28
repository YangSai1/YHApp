//
//  SHEditListView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SHEditListView;

typedef void(^TipViewBlock)(SHEditListView *view,NSString *title);

@interface SHEditListView : UIView

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail;

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail showXing:(BOOL)isShow;

- (void)registBlock:(TipViewBlock)block;

// 是否显示列表View;
@property(nonatomic, assign) BOOL isShowListView;

@property(nonatomic, strong) UILabel *detailLb;

@property(nonatomic, strong) NSArray *dataArr;


@end
