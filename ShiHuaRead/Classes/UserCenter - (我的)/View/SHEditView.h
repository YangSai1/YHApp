//
//  SHEditView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TextViewBlock)(NSString *title);

@interface SHEditView : UIView

@property(nonatomic, strong) UITextField *detailText;

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail;

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail showXing:(BOOL)isShow;

- (void)setTitle:(NSString *)title detailTitle:(NSString *)detail showXing:(BOOL)isShow placehoder:(NSString *)placeh;

- (void)registBlock:(TextViewBlock)block;

@end
