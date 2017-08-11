//
//  SHShenQingCellTwo.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "SHShenQingCellTwo.h"
#import <QuartzCore/QuartzCore.h>
@implementation SHShenQingCellTwo

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)init{
    if (self = [super init]) {
        UIView * blueView = [[UIView alloc]init];
        self.blueView = blueView;
        [self addSubview:blueView];
        UILabel * title = [[UILabel alloc]init];
        self.titleView = title;
        [self addSubview:title];
        UITextView * textView = [[UITextView alloc]init];
        self.textView = textView;
        [self addSubview:textView];
        UILabel * textLable = [[UILabel alloc]init];
        self.textLable = textLable;
        [self addSubview:textLable];
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.textView.clipsToBounds = NO;
    self.textView.layer.cornerRadius =10.0;
    self.textView.layer.shadowRadius = 5.0;
    self.textView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.shadowOpacity = 0.8;
    self.textView.layer.shadowOffset = CGSizeMake(0, 0);
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.blueView.backgroundColor = Color(@"007AFF");
    self.blueView.frame = CGRectMake(15, 10, 2, 15);
    self.titleView.font = [UIFont systemFontOfSize:14];
    self.titleView.frame = CGRectMake(30, 10, 90, 15);
    self.titleView.textColor = gray_999999;
    self.textView.frame = CGRectMake(15, 30, kScreenWidth - 30, 70);
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textLabel.textColor = [UIColor grayColor];
    self.textLable.frame = CGRectMake(127, 58, 120, 14);
    self.textLable.font = [UIFont systemFontOfSize:14];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
