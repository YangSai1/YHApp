//
//  UIConfig.h
//  ShiHuaRead
//
//  Created by Mac on 2017/8/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#ifndef UIConfig_h
#define UIConfig_h


#define kBaseWidth 320
#define kBaseHight 568

///////////////////////
//新的UI机制

#define zBaseWidth 720
#define zBaseHeight 1280

#define zScaleW(valueSize) ((valueSize) * (kScreenWidth/zBaseWidth))
#define zScaleH(valueSize) ((valueSize) * (kScreenHeight/zBaseHeight))

/////////////////////

//statusBar navBar高度和
#define kBarH 64

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)



#define sizeScale (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0 ? 1.375 : 1)
#define fontScale (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0 ? 1.178 : 1)

/*****字体*****/
#define font_9   [UIFont fontWithName:@"Heiti SC" size:9 * fontScale]

#define font_11   [UIFont fontWithName:@"Heiti SC" size:11 * fontScale]
#define font_12   [UIFont fontWithName:@"Heiti SC" size:12 * fontScale]
#define font_13   [UIFont fontWithName:@"Heiti SC" size:13 * fontScale]
#define font_14   [UIFont fontWithName:@"Heiti SC" size:14 * fontScale]
#define font_15   [UIFont fontWithName:@"Heiti SC" size:15 * fontScale]
#define font_16   [UIFont fontWithName:@"Heiti SC" size:16 * fontScale]
#define font_17   [UIFont fontWithName:@"Heiti SC" size:17 * fontScale]
#define font_18   [UIFont fontWithName:@"Heiti SC" size:18 * fontScale]
#define font_19   [UIFont fontWithName:@"Heiti SC" size:19 * fontScale]
#define font_20   [UIFont fontWithName:@"Heiti SC" size:20 * fontScale]
#define font_30   [UIFont fontWithName:@"Heiti SC-Bold" size:30 * fontScale]

#define fontCommon_10   [UIFont fontWithName:@"Heiti SC" size:10]
#define fontCommon_11   [UIFont fontWithName:@"Heiti SC" size:11]
#define fontCommon_12   [UIFont fontWithName:@"Heiti SC" size:12]
#define fontCommon_13   [UIFont fontWithName:@"Heiti SC" size:13]
#define fontCommon_14   [UIFont fontWithName:@"Heiti SC" size:14]
#define fontCommon_15   [UIFont fontWithName:@"Heiti SC" size:15]
#define fontCommon_16   [UIFont fontWithName:@"Heiti SC" size:16]
#define fontCommon_17   [UIFont fontWithName:@"Heiti SC" size:17]
#define fontCommon_18   [UIFont fontWithName:@"Heiti SC" size:18]
#define fontCommon_19   [UIFont fontWithName:@"Heiti SC" size:19]
#define fontCommon_20   [UIFont fontWithName:@"Heiti SC" size:20]
#define fontCommon_22   [UIFont fontWithName:@"Heiti SC" size:22]
#define fontCommon_24   [UIFont fontWithName:@"Heiti SC" size:24]


#define FontWithSize(fontSize) [UIFont fontWithName:@"Heiti SC" size:fontSize]

#define cellH 40 * sizeScale
#define cellHeaderH 10 * sizeScale


// 颜色
/*****全局用色*****/
#define white_ffffff [EBUtility UIColorFromHexColor:@"ffffff"]
#define gray_f3f3f3 [EBUtility UIColorFromHexColor:@"f3f3f3"]
#define gray_e6e6e6 [EBUtility UIColorFromHexColor:@"e6e6e6"]
#define gray_ebebeb [EBUtility UIColorFromHexColor:@"ebebeb"]
#define gray_c1c1c1 [EBUtility UIColorFromHexColor:@"c1c1c1"]
#define gray_b3b3b3 [EBUtility UIColorFromHexColor:@"b3b3b3"]
#define gray_999999 [EBUtility UIColorFromHexColor:@"999999"]
#define gray_757575 [EBUtility UIColorFromHexColor:@"757575"]
#define Black_000000 [EBUtility UIColorFromHexColor:@"000000"]
#define blue_0099ff ([EBUtility UIColorFromHexColor:@"0099ff"])
#define blue_3399ff [EBUtility UIColorFromHexColor:@"3399ff"]
#define blue_61ddef [EBUtility UIColorFromHexColor:@"61ddef"]
#define blue_ze_00a9b1 [EBUtility UIColorFromHexColor:@"00a9b1"]

#define Color(colorStr) [EBUtility UIColorFromHexColor:colorStr]

//
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

#define XCFGlobalBackgroundColor RGB(245, 240, 215)     // 背景颜色
#define XCFLabelColorWhite RGB(255, 255, 255)           // 字体颜色：白色
#define XCFLabelColorGray [UIColor grayColor]           // 字体颜色：灰色
#define XCFCoverViewColor RGBA(0, 0, 0, 0.2)            // 黑色半透明遮盖
#define XCFTabBarNormalColor RGB(170, 170, 170)         // TabBar颜色
#define XCFThemeColor RGB(249, 103, 80)        // TabBar选中颜色
#define XCFSearchBarTintColor RGB(192, 192, 192)        // 搜索按钮背景色
#define XCFDishViewBackgroundColor RGB(235, 235, 226)   // 作品view背景色
#define XCFAddressCellColor RGB(215, 228, 225)          // 收货地址

#endif /* UIConfig_h */
