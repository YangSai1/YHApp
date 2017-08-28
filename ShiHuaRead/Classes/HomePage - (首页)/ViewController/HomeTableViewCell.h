//
//  HomeTableViewCell.h
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHAdvertisementReceiveData.h"
@interface HomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *HomeImageView;
@property (weak, nonatomic) IBOutlet UILabel *HomeCellTitlelable;
@property (weak, nonatomic) IBOutlet UILabel *HomeCellGonggao;
@property (weak, nonatomic) IBOutlet UILabel *HomeCellGongXuan;
@property (weak, nonatomic) IBOutlet UILabel *HomeCellHeZuo;
@property (weak, nonatomic) IBOutlet UILabel *HomeCellRenShu;
@property (weak, nonatomic) IBOutlet UILabel *HomeCellMoney;
@property (weak, nonatomic) IBOutlet UIView *yuanjianView;
@property (weak, nonatomic) IBOutlet UIView *backView;


+(instancetype)HomeTableCell;
- (void)config:(AdvertisementList *)model;

@end
