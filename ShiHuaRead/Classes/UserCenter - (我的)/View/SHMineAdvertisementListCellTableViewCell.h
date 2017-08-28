//
//  SHMineAdvertisementListCellTableViewCell.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHAdvertisementReceiveData.h"
#import "SHMineTouDanListReceiveData.h"

typedef void(^PingLunClickBlock)(AdvertisementList *model);

@interface SHMineAdvertisementListCellTableViewCell : UITableViewCell

@property(nonatomic, strong) AdvertisementList *model;

@property(nonatomic, strong) SHMineTouDanListData *toudanModel;

- (void)registBlock:(PingLunClickBlock)block;
@end
