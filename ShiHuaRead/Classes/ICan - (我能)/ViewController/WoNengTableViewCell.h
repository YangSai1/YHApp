//
//  WoNengTableViewCell.h
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/9.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WoNengTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *WoMenPictureImage;
@property (weak, nonatomic) IBOutlet UILabel *WomenCellName;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellJieShao;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellFadan;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellChengjiao;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellToudan;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellZzhongdan;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellFadanhaopin;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellToudanhaopin;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellFadanChapin;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellTouDanChapin;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellJianjie;
@property (weak, nonatomic) IBOutlet UIImageView *WoMenCellImage;

@property (weak, nonatomic) IBOutlet UILabel *WoMenCellHeight;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellSex;
@property (weak, nonatomic) IBOutlet UILabel *WoMenCellNumber;
//底部控件
@property (weak, nonatomic) IBOutlet UIImageView *heigthImage;
@property (weak, nonatomic) IBOutlet UIView *oneview;
@property (weak, nonatomic) IBOutlet UIImageView *sexImage;

@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIImageView *buzhidoaImage;

@property (weak, nonatomic) IBOutlet UIView *backView;

+(instancetype)WoNengTableViewCell;
@end
