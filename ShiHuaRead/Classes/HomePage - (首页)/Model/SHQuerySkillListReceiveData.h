//
//  SHQuerySkillListReceiveData.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHQuerySkillListData :NSObject
@property (nonatomic , copy) NSString              * ID;
@property (nonatomic , assign) NSInteger              createTime;
@property (nonatomic , assign) NSInteger              delFlag;
@property (nonatomic , copy) NSString              * name;

@end


@interface SHQuerySkillListReceiveData :NSObject
@property (nonatomic , assign) NSInteger              limit;
@property (nonatomic , assign) NSInteger              dataCount;
@property (nonatomic , assign) NSInteger              offset;
@property (nonatomic , assign) NSInteger              totalCount;
@property (nonatomic , strong) NSArray<SHQuerySkillListData *>              * iData;
@property (nonatomic , assign) NSInteger              page;

@end

