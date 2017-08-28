//
//  SHUserManager.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHLoginReceiveModel.h"

@interface SHUserManager : NSObject

+ (instancetype)shareManager;

@property(nonatomic, strong) SHLoginReceiveModel *userModel;

@end
