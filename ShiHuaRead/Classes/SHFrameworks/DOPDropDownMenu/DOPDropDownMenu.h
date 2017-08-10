//
//  DOPDropDownMenu.h
//  DOPDropDownMenuDemo
//
//  Created by weizhou on 9/26/14.
//  Modify by tanyang on 20/3/15.
//  Copyright (c) 2014 fengweizhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOPIndexPath : NSObject

@property (nonatomic, assign) NSInteger column;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) NSInteger item;
@property (nonatomic, assign) NSInteger unit;
- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row;
// default unit = item = -1
+ (instancetype)indexPathWithCol:(NSInteger)col row:(NSInteger)row;
// default unit = -1
+ (instancetype)indexPathWithCol:(NSInteger)col row:(NSInteger)row item:(NSInteger)item;
+ (instancetype)indexPathWithCol:(NSInteger)col row:(NSInteger)row item:(NSInteger)item unit:(NSInteger)unit;
@end

@interface DOPBackgroundCellView : UIView

@end

#pragma mark - data source protocol
@class DOPDropDownMenu;

@protocol DOPDropDownMenuDataSource <NSObject>

@required

/**
 *  返回 menu 第column列有多少行
 */
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column;

/**
 *  返回 menu 第column列 每行title
 */
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath;

@optional

/**
 *  返回 menu 标题image
 */
- (NSString *)menu:(DOPDropDownMenu *)menu imageNumberOfRowsInColumn:(NSInteger)column;

/**
 *  返回 menu 标题选中image
 */
- (NSString *)menu:(DOPDropDownMenu *)menu imageSelectNumberOfRowsInColumn:(NSInteger)column;

/**
 *  返回 menu 有多少列 ，默认1列
 */
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu;

// 新增 返回 menu 第column列 每行image
- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForRowAtIndexPath:(DOPIndexPath *)indexPath;

// 新增 detailText ,right text
- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForRowAtIndexPath:(DOPIndexPath *)indexPath;

/** 新增
 *  当有column列 row 行 返回有多少个item ，如果>0，说明有二级列表 ，=0 没有二级列表
 *  如果都没有可以不实现该协议
 */
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column;

/** 新增
 *  当有column列 row 行 item项 title
 *  如果都没有可以不实现该协议
 */
- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;

// 新增 当有column列 row 行 item项 image
- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;
// 新增
- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;

#pragma mark QYNew
/** 新增
 *  当有column列 row 行 item项 返回有多少个单元，如果>0，说明有三级级列表 ，=0 没有三级列表
 *  如果都没有可以不实现该协议
 */
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfUnitsInItem:(NSInteger)item row:(NSInteger)row column:(NSInteger)column;

/** 新增
 *  当有column列 row 行 item项 unit单元 title
 *  如果都没有可以不实现该协议
 */
- (NSString *)menu:(DOPDropDownMenu *)menu titleForUnitsInItemAtIndexPath:(DOPIndexPath *)indexPath;

@end

#pragma mark - delegate
@protocol DOPDropDownMenuDelegate <NSObject>
@optional
/**
 *  点击代理，点击了第column 第row 或者item项，如果 item >=0
 */
- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath;

@end

#pragma mark - interface
@interface DOPDropDownMenu : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id <DOPDropDownMenuDataSource> dataSource;
@property (nonatomic, weak) id <DOPDropDownMenuDelegate> delegate;

@property (nonatomic, assign) UITableViewCellStyle cellStyle; // default value1
@property (nonatomic, strong) UIColor *indicatorColor;      // 三角指示器颜色
@property (nonatomic, strong) UIColor *textColor;           // 文字title颜色
@property (nonatomic, strong) UIColor *textSelectedColor;   // 文字title选中颜色
@property (nonatomic, strong) UIColor *detailTextColor;     // detailText文字颜色
@property (nonatomic, strong) UIFont *detailTextFont;       // font
@property (nonatomic, strong) UIColor *separatorColor;      // 分割线颜色
@property (nonatomic, assign) NSInteger fontSize;           // 字体大小
// 当有二级列表item时，点击row 是否调用点击代理方法
@property (nonatomic, assign) BOOL isClickHaveItemValid;

#pragma mark property_new
// 当有三级列表unit时，点击item 是否调用点击代理方法
@property (nonatomic, assign) BOOL isClickHaveUnitValid;
// 选择后是否让菜单手气
@property (nonatomic, assign) BOOL isKeepDOPMenu;

@property (nonatomic, getter=isRemainMenuTitle) BOOL remainMenuTitle; // 切换条件时是否更改menu title
@property (nonatomic, strong) NSMutableArray  *currentSelectRowArray; // 恢复之前所选行
@property (nonatomic, strong) NSMutableArray  *currentSelectItemArray; // 恢复之前所选Unit
/**
 *  the width of menu will be set to screen width defaultly
 *
 *  @param origin the origin of this view's frame
 *  @param height menu's height
 *
 *  @return menu
 */
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;

// 获取title
- (NSString *)titleForRowAtIndexPath:(DOPIndexPath *)indexPath;

// 重新加载数据
- (void)reloadData;

// 创建menu 第一次显示 不会调用点击代理，这个手动调用
- (void)selectDefalutIndexPath;

- (void)selectIndexPath:(DOPIndexPath *)indexPath; // 默认trigger delegate

- (void)selectIndexPath:(DOPIndexPath *)indexPath triggerDelegate:(BOOL)trigger; // 调用代理
@end

