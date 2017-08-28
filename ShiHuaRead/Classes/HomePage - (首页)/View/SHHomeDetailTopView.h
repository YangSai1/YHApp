//
//  SHHomeDetailTopView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHAdvertisementReceiveData.h"

@interface SHHomeDetailTopView : UIView

@property(nonatomic, strong) AdvertisementList *model;

- (void)text;

@end
