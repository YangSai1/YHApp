//
//  SHPopListView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SHQuerySkillListReceiveData.h"
typedef void(^SHChangBlock)(NSString *title);

typedef void(^SHChangModelBlock)(SHQuerySkillListData *model);

@interface SHPopListView : UITableView

@property(nonatomic, strong) NSArray *array;

@property(nonatomic, strong) NSArray <SHQuerySkillListData *> *modelArr;

- (void)registBlock:(SHChangBlock)block;

- (void)registModelBlock:(SHChangModelBlock)block;
@end
