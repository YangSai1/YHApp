//
//  SHImagePickerView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageDatasBlock)(NSArray *images);

@interface SHImagePickerView : UIView

- (id)initWithContainerVC:(UIViewController *)containerVC;

- (void)registBlock:(ImageDatasBlock)block;
@property(nonatomic, strong) NSMutableArray *selectedPhotos;

@property(nonatomic, strong) NSMutableArray *selectedAssets;


@end
