//
//  WoNengTableViewCell.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "WoNengTableViewCell.h"

@implementation WoNengTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.backView.clipsToBounds = NO;
    self.backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.backView.layer.shadowOffset = CGSizeMake(0, 0);
    self.backView.layer.shadowOpacity = 0.8;
    self.backView.layer.shadowRadius = 1.0;
//    self.backView.layer.masksToBounds = YES;
}
+(instancetype)WoNengTableViewCell{
    return [[[NSBundle mainBundle]loadNibNamed:@"WoNengTableViewCell" owner:nil options:nil]lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
