//
//  SHBlueHeaderImageCheckView.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBlueLineTextView.h"
#import "SHImagePickerView.h"

@interface SHBlueHeaderImageCheckView : UIView

@property(nonatomic, strong) SHBlueLineTextView *blueLineTextView;

@property(nonatomic, strong) SHImagePickerView *imagePickerView;

- (id)initWithContainerVC:(UIViewController *)containerVC;
@end
