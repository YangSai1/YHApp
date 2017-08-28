//
//  SHShenQingCellthree.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "SHShenQingCellthree.h"
@implementation SHShenQingCellthree

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(instancetype)init{
    if (self = [super init]) {
        UIView * blueView = [[UIView alloc]init];
        self.blueView = blueView;
        [self addSubview:blueView];
        UILabel * titleView = [[UILabel alloc]init];
        self.titleView = titleView;
        [self addSubview:titleView];
        UIButton * button1 = [[UIButton alloc]init];
        self.imageBtnOne = button1;
        [self addSubview:button1];
        UIButton * button2 = [[UIButton alloc]init];
        self.imageBtnTwo = button2;
        [self addSubview:button2];
        UIButton * button3 = [[UIButton alloc]init];
        self.imageBtnThree = button3;
        [self addSubview:button3];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.blueView.backgroundColor = Color(@"007AFF");
    self.blueView.frame = CGRectMake(15, 10, 2, 15);
    self.titleView.font = [UIFont systemFontOfSize:14];
    self.titleView.frame = CGRectMake(30, 10, 90, 15);
    self.titleView.textColor = gray_999999;
    self.titleView.text = @"图片上传";
//    [self.imageBtnOne setImage:[UIImage imageNamed:@"icon-添加@1x.png"] forState:UIControlStateNormal];
    [self.imageBtnOne setBackgroundImage:[UIImage imageNamed:@"icon-添加@1x.png"] forState:UIControlStateNormal];
    
    CGFloat LRM = (kScreenWidth - 90 * 3) * 0.25;
    
    self.imageBtnOne.frame = CGRectMake(LRM, 33, 90, 90);
//    [self.imageBtnTwo setImage:[UIImage imageNamed:@"icon-添加@1x.png"] forState:UIControlStateNormal];
    [self.imageBtnTwo setBackgroundImage:[UIImage imageNamed:@"icon-添加@1x.png"] forState:UIControlStateNormal];

    self.imageBtnTwo.frame = CGRectMake(LRM * 2 + 90, 33, 90, 90);
//    [self.imageBtnThree setImage:[UIImage imageNamed:@"icon-添加@1x.png"] forState:UIControlStateNormal];
    [self.imageBtnThree setBackgroundImage:[UIImage imageNamed:@"icon-添加@1x.png"] forState:UIControlStateNormal];

    self.imageBtnThree.frame = CGRectMake(LRM * 3 + 90 + 90, 33, 90, 90);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
