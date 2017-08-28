//
//  SHPulishZhongDanCell.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHPulishZhongDanCell.h"

#import "SHICanTopView.h"

@interface SHPulishZhongDanCell ()

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) SHICanTopView *topView;

@property(nonatomic, strong) UILabel *zhongdanLiyou;

@end

@implementation SHPulishZhongDanCell

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
    _topView.detailRightV.hidden = YES;
    _topView.detailLb.hidden = YES;
    
    _zhongdanLiyou = [UILabel labelWithFont:fontCommon_12 textColor:Color_157efb numberOfLines:1 textAlignment:NSTextAlignmentLeft];
    
    
    [self addSubview:_bgView];
    [_bgView addSubview:_topView];
    [_bgView addSubview:_zhongdanLiyou];
    
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
    
    [_zhongdanLiyou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.topView.nameLb);
        make.top.equalTo(weakSelf.topView.lineView.mas_bottom).offset(zScaleH(8));
    }];
    
    
}

- (void)cofigModel:(id)model
{
    
//    if (model.pics.count != 0) {
//        SHICanListImages *imageM = model.pics[0];
//        NSString *path = [NSString stringWithFormat:@"%@%@",BASE_URL,imageM.location];
//        [_topView.iconImageView setHeaderWithURL:[NSURL URLWithString:path]];
//    }else{
        _topView.iconImageView.image = [UIImage imageNamed:@"icon-60@2x"];
//    }
    
    _topView.nameLb.text = @"测试";
    _topView.skillLb.text = @"12334";
    
    NSString *fadanNumStr = [NSString stringWithFormat:@"发单:%u   成交:%u   投单:%u   中单:%u",arc4random() % 100,arc4random() % 100,arc4random() % 100,arc4random() % 100];
    _topView.fadanNumLb.text = fadanNumStr;
    _topView.fadanGoodLb.text = [NSString stringWithFormat:@"发单好评:%d",arc4random() % 100];
    _topView.fadanBadLb.text = [NSString stringWithFormat:@"发单差评:%d",arc4random() % 100];
    _topView.toudanGoodLb.text = [NSString stringWithFormat:@"投单好评:%d",arc4random() % 100];
    
    _topView.toudanBadLb.text = [NSString stringWithFormat:@"投单差评:%d",arc4random() % 100];
//    _topView.detailLb.text = model.intro;
    _zhongdanLiyou.text = @"中单理由:专业水平较高";
}

-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

@end
