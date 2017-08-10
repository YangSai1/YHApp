//
//  ILSettingItem.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILSettingItem.h"

@implementation ILSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    ILSettingItem *item = [[self alloc] init];
    
    item.icon = icon;
    item.title = title;
    item.isShowDivider = YES;
    return item;
}

@end
