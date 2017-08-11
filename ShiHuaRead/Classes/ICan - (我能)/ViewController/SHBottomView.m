//
//  SHBottomView.m
//  ShiHuaRead
//
//  Created by 海波的电脑 on 2017/8/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHBottomView.h"

@implementation SHBottomView
-(instancetype)init{
    if (self = [super init]) {
        UIView * ImagesView = [[UIView alloc]init];
        for (int i = 0; i < 3; i ++) {
            UIImageView * image = [[UIImageView alloc]init];
            [ImagesView addSubview:image];
        }
        self.imagesView = ImagesView;
        [self addSubview:ImagesView];
        UIView * xinxiView = [[UIView alloc]init];
        UILabel * xinxi1 = [[UILabel alloc]init];
        [xinxiView addSubview:xinxi1];
        self.xinxiOne = xinxi1;
        UILabel * xinxi2 = [[UILabel alloc]init];
        [xinxiView addSubview:xinxi2];
        self.xinxiTwo = xinxi2;
        UILabel * xinxi3 = [[UILabel alloc]init];
        [xinxiView addSubview:xinxi3];
        self.xinxiThree = xinxi3;
        UILabel * xinxi4 = [[UILabel alloc]init];
        [xinxiView addSubview:xinxi4];
        self.xinxiFoure = xinxi4;
        UILabel * xinxi5 = [[UILabel alloc]init];
        [xinxiView addSubview:xinxi5];
        self.xinxiFive = xinxi5;
        UILabel * xinxi6 = [[UILabel alloc]init];
        [xinxiView addSubview:xinxi6];
        self.xinxiliu = xinxi6;
        UILabel * xinxi7 = [[UILabel alloc]init];
        [xinxiView addSubview:xinxi7];
        self.xinxiSeven = xinxi7;
        UILabel * xinxi8 = [[UILabel alloc]init];
        [xinxiView addSubview:xinxi8];
        self.xinxiEight = xinxi8;
        self.XinXiView = xinxiView;
        [self addSubview:xinxiView];
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.XinXiView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.XinXiView.layer.borderWidth = 0.3;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imagesView.frame = CGRectMake(5, 0, kScreenWidth - 10, 68);
    self.XinXiView.frame = CGRectMake(5, 78, kScreenWidth - 10, 252);
    for (int i = 0; i < 3; i ++) {
        UIImageView * childImage = self.imagesView.subviews[i];
        childImage.frame = CGRectMake(i * 92 + 10, 0, 82, 68);
    }
    for (int i = 0; i < 8; i ++) {
        UILabel * childLable = self.XinXiView.subviews[i];
        childLable.font = [UIFont systemFontOfSize:12];
        childLable.textColor = [UIColor darkGrayColor];
        childLable.text = @"真实姓名:活动时间单号";
        childLable.frame = CGRectMake(10, 15 + 27 * i, kScreenWidth - 30, 12);
    }
}
@end
