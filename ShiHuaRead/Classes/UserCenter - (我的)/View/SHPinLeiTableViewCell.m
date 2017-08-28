//
//  SHPinLeiTableViewCell.m
//  ShiHuaRead
//
//  Created by 海波的电脑 on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHPinLeiTableViewCell.h"

@implementation SHPinLeiTableViewCell


-(instancetype)init{
    if (self = [super init]) {
        UIView * blueView = [[UIView alloc]init];
        self.blueView = blueView;
        [self addSubview:blueView];
        UILabel * titleView = [[UILabel alloc]init];
        self.titleView = titleView;
        [self addSubview:titleView];
        UIView * buttonView = [[UIView alloc]init];
        self.buttonView = buttonView;
        [self addSubview:buttonView];
    }
    return self;
}
-(void)setTitleArray:(NSArray *)titleArray{
    for (int i = 0; i < titleArray.count; i ++) {
        UIButton * pinLeiBtn = [UIButton buttonWithType: UIButtonTypeCustom];
        [pinLeiBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [pinLeiBtn setTitleColor:Color(@"007AFF") forState:UIControlStateNormal];
        pinLeiBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        pinLeiBtn.layer.cornerRadius = 7.0;
        pinLeiBtn.layer.borderColor = Color(@"007AFF").CGColor;
        pinLeiBtn.layer.borderWidth = 0.7;
        pinLeiBtn.layer.masksToBounds = YES;
        pinLeiBtn.frame = CGRectMake(78 * i + 15, 10, 51, 16);
        [self.buttonView addSubview:pinLeiBtn];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.blueView.backgroundColor = Color(@"007AFF");
    self.blueView.frame = CGRectMake(15, 10, 2, 15);
    self.titleView.font = [UIFont systemFontOfSize:14];
    self.titleView.frame = CGRectMake(30, 10, 90, 15);
    self.titleView.textColor = gray_999999;
    self.buttonView.frame = CGRectMake(0, 35, kScreenWidth, 35);
    self.buttonView.backgroundColor = [UIColor whiteColor];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
