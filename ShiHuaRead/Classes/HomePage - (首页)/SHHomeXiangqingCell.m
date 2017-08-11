//
//  SHHomeXiangqingCell.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "SHHomeXiangqingCell.h"

@implementation SHHomeXiangqingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.xiangqingshuxingOne.layer.cornerRadius = 5.0;
    self.xiangqingshuxingOne.layer.borderColor = [UIColor blueColor].CGColor;
    self.xiangqingshuxingOne.layer.borderWidth = 1.0;
    self.xiangqingshuxingOne.layer.masksToBounds = YES;
    self.xiangqingshuxingTwo.layer.cornerRadius = 5.0;
    self.xiangqingshuxingTwo.layer.borderColor = [UIColor blueColor].CGColor;
    self.xiangqingshuxingTwo.layer.borderWidth = 1.0;
    self.xiangqingshuxingTwo.layer.masksToBounds = YES;
    self.xiangqingshuxingThree.layer.cornerRadius = 5.0;
    self.xiangqingshuxingThree.layer.borderColor = [UIColor blueColor].CGColor;
    self.xiangqingshuxingThree.layer.borderWidth = 1.0;
    self.xiangqingshuxingThree.layer.masksToBounds = YES;
    self.xiangqingshuxingfore.layer.cornerRadius = 5.0;
    self.xiangqingshuxingfore.layer.borderColor = [UIColor blueColor].CGColor;
    self.xiangqingshuxingfore.layer.borderWidth = 1.0;
    self.xiangqingshuxingfore.layer.masksToBounds = YES;
}
+(instancetype)SHHomeXiangqingCell{
    return [[[NSBundle mainBundle]loadNibNamed:@"SHHomeXiangqingCell" owner:nil options:nil]lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
