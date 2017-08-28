//
//  SHAdvertisementListApiManager.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CTAPIBaseManager.h"

@interface SHAdvertisementListApiManager : CTAPIBaseManager<CTAPIManager>

- (void)loadNextPage;

- (void)refreshPage;
@end
