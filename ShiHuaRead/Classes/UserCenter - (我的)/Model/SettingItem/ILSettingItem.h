//
//  ILSettingItem.h
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void(^ILSettingItemOption)();

@interface ILSettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *subTitle;

@property(nonatomic, assign) BOOL isShowDivider;

// 保存一段功能，在恰当的时候调用
@property (nonatomic, copy) ILSettingItemOption option;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

@end
