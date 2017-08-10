//
//  ILSettingCell.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILSettingCell.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingLabelItem.h"

@interface ILSettingCell()


@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UILabel *labelView;

@property (nonatomic, weak) UIView *divider;

@property(nonatomic, strong) UIView *lableRightView;

@property (nonatomic, strong) UIImageView *leftImageView;

@property(nonatomic, strong) UILabel *titleLb;

@end

@implementation ILSettingCell

- (UIView *)divider
{
    if (_divider == nil) {
        UIView *divider  = [[UIView alloc] init];
        divider.backgroundColor = gray_e6e6e6;        
        [self.contentView addSubview:divider];
        _divider = divider;
    }
    
    return _divider;
}

- (UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 100, 44);
        _labelView.textColor = [UIColor redColor];
        _labelView.textAlignment = NSTextAlignmentRight;
    }
    return _labelView;
}

- (UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = TabbarNorColer;
        _titleLb.font = font_14;
    }
    return _titleLb;
}


- (UIView *)lableRightView
{
    if (!_lableRightView) {
        _lableRightView = [[UIView alloc] init];
        [_lableRightView addSubview:self.imgView];
    }
    return _lableRightView;
}

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_gray"]];
    }
    return _imgView;
}

- (UIImageView *)leftImageView
{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-denglumima-39"]];
    }
    return _leftImageView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}


- (void)setItem:(ILSettingItem *)item
{
    _item = item;
    
    
    // 1.设置cell的子控件的数据
    [self setUpData];
    
    // 2.设置右边视图
    [self setUpAccessoryView];

}

// 设置cell的子控件的数据
- (void)setUpData
{
    if (_item.icon.length) {
        
        self.leftImageView.image = [UIImage imageNamed:_item.icon];
    }
    self.titleLb.text = _item.title;
    
}

// 设置右边视图
- (void)setUpAccessoryView
{
    if ([_item isKindOfClass:[ILSettingArrowItem class]]) { // 箭头
        _labelView.hidden = YES;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([_item isKindOfClass:[ILSettingSwitchItem class]]){ // Switch
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if ([_item isKindOfClass:[ILSettingLabelItem class]]){
        _labelView.hidden = NO;
        ILSettingLabelItem *labelItem = (ILSettingLabelItem *)_item;
        self.labelView.text = labelItem.text;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;}
//    }else{
//        self.accessoryView = nil;
//        self.selectionStyle = UITableViewCellSelectionStyleDefault;
//    }
}

#warning 快速创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    ILSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[ILSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)setIsShowDivider:(BOOL)isShowDivider
{
    _isShowDivider = isShowDivider;
    self.divider.hidden = !isShowDivider;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 237 233 218
       
        // 设置背景
        [self setUpBg];
        
        
        [self initView];
        
    }
    
    return self;
}

- (void)initView
{
    [self addSubview:self.leftImageView];
    [self addSubview:self.divider];
    [self addSubview:self.titleLb];
    [self addSubview:self.lableRightView];
    [_lableRightView addSubview:self.imgView];
    [_lableRightView addSubview:self.labelView];
    __weak typeof(self) weakSelf = self;
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.divider).offset(0);
        make.centerY.equalTo(weakSelf);
        make.width.height.equalTo(@(20));
    }];
    
    [_divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(25);
        make.bottom.equalTo(weakSelf).offset(-1);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@(1));
    }];
    
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImageView.mas_right).offset(10);
        make.centerY.equalTo(weakSelf);
    }];

    [_lableRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-23);
        make.centerY.equalTo(weakSelf);
        make.width.equalTo(@(180));
        make.height.equalTo(weakSelf);
    }];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.lableRightView);
        make.centerY.equalTo(weakSelf);
        make.width.equalTo(@(6));
        make.height.equalTo(@(12));
    }];
    
    [_labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.imgView.mas_left).offset(-10);
        make.centerY.equalTo(weakSelf.contentView);
    }];
    
}

#warning 设置背景
- (void)setUpBg
{
    // 设置背景图片
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    
    
    // 设置选中的背景图片
    UIView *selectedBg = [[UIView alloc] init];
    self.selectedBackgroundView = selectedBg;
}

#warning 清空子控件的背景颜色


@end
