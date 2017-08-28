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
    self.xiangqingshuxingOne.layer.borderColor = Color(@"0177ee").CGColor;
    self.xiangqingshuxingOne.layer.borderWidth = 1.0;
    self.xiangqingshuxingOne.layer.masksToBounds = YES;
    self.xiangqingshuxingTwo.layer.cornerRadius = 5.0;
    self.xiangqingshuxingTwo.layer.borderColor = Color(@"0177ee").CGColor;
    self.xiangqingshuxingTwo.layer.borderWidth = 1.0;
    self.xiangqingshuxingTwo.layer.masksToBounds = YES;
    self.xiangqingshuxingThree.layer.cornerRadius = 5.0;
    self.xiangqingshuxingThree.layer.borderColor = Color(@"0177ee").CGColor;
    self.xiangqingshuxingThree.layer.borderWidth = 1.0;
    self.xiangqingshuxingThree.layer.masksToBounds = YES;
    self.xiangqingshuxingfore.layer.cornerRadius = 5.0;
    self.xiangqingshuxingfore.layer.borderColor = Color(@"0177ee").CGColor;
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

- (void)config:(AdvertisementList *)model
{
//    _xiangqingImage.image = [UIImage imageNamed:@"icon-tupian-183-221"];
    
    if (model.pics.count != 0) {
        SHQuerySkillImages *imageM = model.pics[0];
        NSString *path = [NSString stringWithFormat:@"%@%@",BASE_URL,imageM.location];
        [_xiangqingImage setHeaderWithURL:[NSURL URLWithString:path]];
    }else{
        _xiangqingImage.image = [UIImage imageNamed:@"icon-60@2x"];
    }

    
    //    _HomeCellGonggao.text = @"";
    //    _HomeCellGongXuan.text = @"";
    _xiangqingName.text = model.title;

    _xiangqingType.text = @"院线电影";
    
    _xiangqingXuke.text = model.shootLicence;
    
    _xiangqingCity.text = [NSString stringWithFormat:@"%@  %@  %@",model.province,model.city,model.area];
    
    _xiangqingDizhi.text = model.detailAddress;
    
    _xiangqingMoney.text = [NSString stringWithFormat:@"¥ %@ - %@",model.budgetStart,model.budgetEnd];
    
    _xiangqinggongxuan.text = [NSString stringWithFormat:@"公选期: %d天",arc4random() % 10];
    _xiangqingrenshu.text = [NSString stringWithFormat:@"%d人",arc4random() % 300];
    _xiangqingshuxingOne.text = model.noticeClass;
}
@end
