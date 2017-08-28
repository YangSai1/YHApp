//
//  SHICanTableViewCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHICanTableViewCell.h"
#import "SHICanTopView.h"

@interface SHICanTableViewCell ()

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) SHICanTopView *topView;

@property(nonatomic, strong) UIImageView *hightLeftV;

@property(nonatomic, strong) UILabel *hightLb;

@property(nonatomic, strong) UIView *firstView;

@property(nonatomic, strong) UIImageView *sexLeftV;

@property(nonatomic, strong) UILabel *sexLb;

@property(nonatomic, strong) UIView *secoundView;

@property(nonatomic, strong) UIImageView *weightLeftView;

@property(nonatomic, strong) UILabel *weightLb;

@end

@implementation SHICanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = gray_f3f3f3;
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor whiteColor];
    
    _topView = [[SHICanTopView alloc] init];
    
    _hightLeftV = [[UIImageView alloc] init];
    _hightLeftV.image = [UIImage imageNamed:@"icon-shengao-34"];
    _hightLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    _firstView = [[UIView alloc] init];
    _firstView.backgroundColor = Color_E5E5E5;
    
    _sexLeftV = [[UIImageView alloc] init];
    _sexLeftV.image = [UIImage imageNamed:@"icon-xingbie-30"];
    _sexLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    _secoundView = [[UIView alloc] init];
    _secoundView.backgroundColor = Color_E5E5E5;

    _weightLeftView = [[UIImageView alloc] init];
    _weightLeftView.image = [UIImage imageNamed:@"icon-tizhong-34"];
    _weightLb = [UILabel labelWithFont:fontCommon_12 textColor:Color_a4a5a4 numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    [self addSubview:_bgView];
    [_bgView addSubview:_topView];
    [_bgView addSubview:_hightLeftV];
    [_bgView addSubview:_hightLb];
    [_bgView addSubview:_firstView];
    [_bgView addSubview:_sexLeftV];
    [_bgView addSubview:_sexLb];
    [_bgView addSubview:_secoundView];
    [_bgView addSubview:_weightLeftView];
    [_bgView addSubview:_weightLb];
    
    __weak typeof(self) weakSelf = self;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(zScaleH(10));
        make.left.equalTo(weakSelf).offset(zScaleW(5));
        make.right.equalTo(weakSelf).offset(zScaleW(-5));
        make.bottom.equalTo(weakSelf);
    }];
    
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.bgView);
        make.height.equalTo(@(zScaleH(125)));
    }];

    [_hightLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.topView.nameLb);
        make.top.equalTo(weakSelf.topView.mas_bottom).offset(zScaleH(8));
        make.width.height.equalTo(@(zScaleH(10)));
    }];
    [_hightLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.hightLeftV.mas_right).offset(2);
        make.centerY.equalTo(weakSelf.hightLeftV);
    }];
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.hightLb.mas_right).offset(zScaleW(20));
        make.top.equalTo(weakSelf.topView.mas_bottom).offset(zScaleH(8));
        make.bottom.equalTo(weakSelf.mas_bottom).offset(zScaleH(-8));
        make.width.equalTo(@(1));
    }];
    
    [_sexLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.firstView.mas_right).offset(zScaleW(20));
        make.top.equalTo(weakSelf.hightLeftV);
        make.width.height.equalTo(@(zScaleH(10)));
    }];
    [_sexLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.sexLeftV.mas_right).offset(2);
        make.centerY.equalTo(weakSelf.sexLeftV);
    }];
    [_secoundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.sexLb.mas_right).offset(zScaleW(20));
        make.top.equalTo(weakSelf.topView.mas_bottom).offset(zScaleH(8));
        make.bottom.equalTo(weakSelf.mas_bottom).offset(zScaleH(-8));
        make.width.equalTo(@(1));
    }];
    
    [_weightLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.secoundView.mas_right).offset(zScaleW(20));
        make.top.equalTo(weakSelf.hightLeftV);
        make.width.height.equalTo(@(zScaleH(10)));
    }];
    [_weightLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.weightLeftView.mas_right).offset(2);
        make.centerY.equalTo(weakSelf.weightLeftView);
    }];


}

- (void)cofigModel:(SHICanListData *)model
{
    
    if (model.pics.count != 0) {
        SHICanListImages *imageM = model.pics[0];
        NSString *path = [NSString stringWithFormat:@"%@%@",BASE_URL,imageM.location];
        [_topView.iconImageView setHeaderWithURL:[NSURL URLWithString:path]];
    }else{
        _topView.iconImageView.image = [UIImage imageNamed:@"icon-60@2x"];
    }
    
    _topView.nameLb.text = model.realName;
    _topView.skillLb.text = @"12334";
    
    NSString *fadanNumStr = [NSString stringWithFormat:@"发单:%u   成交:%u   投单:%u   中单:%u",arc4random() % 100,arc4random() % 100,arc4random() % 100,arc4random() % 100];
    _topView.fadanNumLb.text = fadanNumStr;
    _topView.fadanGoodLb.text = [NSString stringWithFormat:@"发单好评:%d",arc4random() % 100];
    _topView.fadanBadLb.text = [NSString stringWithFormat:@"发单差评:%d",arc4random() % 100];
    _topView.toudanGoodLb.text = [NSString stringWithFormat:@"投单好评:%d",arc4random() % 100];
    
    _topView.toudanBadLb.text = [NSString stringWithFormat:@"投单差评:%d",arc4random() % 100];
    _topView.detailLb.text = model.intro;
    
    _hightLb.text = model.height;
    
    int sex = [self getRandomNumber:0 to:2];
    if (sex == 0) {
        _sexLb.text = @"男";
    }else{
        _sexLb.text = @"女";
    }
    _weightLb.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
}

-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

@end
