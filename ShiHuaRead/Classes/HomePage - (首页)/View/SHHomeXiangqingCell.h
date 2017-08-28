//
//  SHHomeXiangqingCell.h
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHAdvertisementReceiveData.h"
@interface SHHomeXiangqingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *xiangqingImage;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingName;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingType;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingXuke;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingCity;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingDizhi;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingMoney;
@property (weak, nonatomic) IBOutlet UILabel *xiangqinggonggao;
@property (weak, nonatomic) IBOutlet UILabel *xiangqinggongxuan;
@property (weak, nonatomic) IBOutlet UILabel *xiangqinghezuo;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingrenshu;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingtoudan;

@property (weak, nonatomic) IBOutlet UILabel *xiangqingshuxingOne;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingshuxingTwo;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingshuxingThree;
@property (weak, nonatomic) IBOutlet UILabel *xiangqingshuxingfore;

- (void)config:(AdvertisementList *)model;

+(instancetype)SHHomeXiangqingCell;
@end
