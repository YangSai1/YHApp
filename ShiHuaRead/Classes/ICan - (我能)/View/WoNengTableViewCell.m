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

- (void)cofigModel:(SHICanListData *)model
{
//    _WoMenPictureImage.image = [UIImage imageNamed:@"icon-tupian-183-221"];
    
    if (model.pics.count != 0) {
        SHICanListImages *imageM = model.pics[0];
        NSString *path = [NSString stringWithFormat:@"%@%@",BASE_URL,imageM.location];
        [_WoMenPictureImage setHeaderWithURL:[NSURL URLWithString:path]];
    }else{
        _WoMenPictureImage.image = [UIImage imageNamed:@"icon-60@2x"];
    }

    _WomenCellName.text = model.realName;
    _WoMenCellJieShao.text = @"12334";
    _WoMenCellFadan.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
    _WoMenCellChengjiao.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
    _WoMenCellToudan.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
    _WoMenCellZzhongdan.text = [NSString stringWithFormat:@"%d",arc4random() % 100];

    _WoMenCellFadanhaopin.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
    _WoMenCellToudanhaopin.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
    _WoMenCellFadanChapin.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
    _WoMenCellTouDanChapin.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
    _WoMenCellJianjie.text = model.intro;
    _WoMenCellHeight.text = model.height;
    
    int sex = [self getRandomNumber:0 to:2];
    if (sex == 0) {
        _WoMenCellSex.text = @"男";
    }else{
        _WoMenCellSex.text = @"女";
    }
    _WoMenCellNumber.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
}

-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
