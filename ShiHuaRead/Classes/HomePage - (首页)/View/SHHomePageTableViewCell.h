//
//  SHHomePageTableViewCell.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHAdvertisementReceiveData.h"

@interface SHHomePageTableViewCell : UITableViewCell

@property(nonatomic, strong) AdvertisementList *model;

- (void)text;

@end
