//
//  HomeTableViewCell.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.yuanjianView.layer.cornerRadius = 5;
    self.yuanjianView.layer.masksToBounds = YES;
    
    self.backView.clipsToBounds = NO;
    self.backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.backView.layer.shadowOffset = CGSizeMake(0, 0);
    self.backView.layer.shadowOpacity = 0.8;
    self.backView.layer.shadowRadius = 1.0;
}
+(instancetype)HomeTableCell{
    return [[[NSBundle mainBundle]loadNibNamed:@"HomeTableViewCell" owner:nil options:nil]lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)config:(AdvertisementList *)model
{
    
    if (model.pics.count != 0) {
        SHQuerySkillImages *imageM = model.pics[0];
        NSString *path = [NSString stringWithFormat:@"%@%@",BASE_URL,imageM.location];
        [_HomeImageView setHeaderWithURL:[NSURL URLWithString:path]];
    }else{
        _HomeImageView.image = [UIImage imageNamed:@"icon-60@2x"];
    }
//
    
    NSString *timeStr = [EBUtility getDateFromTimestampString:model.noticeTime];
    
    NSString *timeEndStr;
    
    if (model.exeTime.length > 10) {
        timeEndStr = [model.exeTime substringToIndex:10];
    }
    
    timeStr = [NSString stringWithFormat:@"至 %@",timeEndStr];

    
    _HomeCellGonggao.text = timeStr;
//    _HomeCellGongXuan.text = @"";
    _HomeCellHeZuo.text = [NSString stringWithFormat:@"%d天",arc4random() % 10];
    _HomeCellRenShu.text = [NSString stringWithFormat:@"%d人",arc4random() % 300];
    _HomeCellMoney.text = [NSString stringWithFormat:@"%@ - %@",model.budgetStart,model.budgetEnd];
}

@end
