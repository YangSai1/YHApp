//
//  ILSettingCell.h
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILSettingItem;

@interface ILSettingCell : UITableViewCell

@property (nonatomic, strong) ILSettingItem *item;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property(nonatomic, assign) BOOL isShowDivider;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
