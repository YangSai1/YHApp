//
//  SHShenqingCellOne.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "SHShenqingCellOne.h"
@implementation SHShenqingCellOne

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(instancetype)init{
    if (self = [super init]) {
        UIView * blueView = [[UIView alloc]init];
        self.blueViwe = blueView;
        [self addSubview:blueView];
        UILabel * titleView = [[UILabel alloc]init];
        self.titleView = titleView;
        [self addSubview:titleView];
        UITextField * textfield = [[UITextField alloc]init];
        self.textFieldView = textfield;
        [self addSubview:textfield];
        UIView * grayView = [[UIView alloc]init];
        self.grayView = grayView;
        [self addSubview:grayView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.blueViwe.backgroundColor = Color(@"007AFF");
    self.blueViwe.frame = CGRectMake(15, 10, 2, 15);
    self.titleView.font = [UIFont systemFontOfSize:14];
    self.titleView.frame = CGRectMake(30, 10, 90, 15);
    self.titleView.textColor = gray_999999;
    self.textFieldView.frame = CGRectMake(102, 5, 200, 25);
    self.textFieldView.font = [UIFont systemFontOfSize:15];
    self.grayView.backgroundColor = [UIColor lightGrayColor];
    self.grayView.frame = CGRectMake(15, 33, kScreenWidth - 30, 1);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
