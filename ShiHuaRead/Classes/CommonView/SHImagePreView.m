//
//  SHImagePreView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHImagePreView.h"
#import "SHImagePreViewCell.h"

@interface SHImagePreView () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SHImagePreView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    [self configCollectionView];
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setImage:[UIImage imageNamed:@"icon-44"] forState:UIControlStateNormal];
    [rightBtn addActionBlock:^(UIButton *sender) {
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_dateImages.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }];
    
    [self addSubview:rightBtn];
    __weak typeof(self) weakSelf = self;

    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(zScaleW(-5));
        make.centerY.equalTo(weakSelf);
        make.width.equalTo(@(zScaleW(12)));
        make.height.equalTo(@(zScaleW(16)));
    }];
}


- (void)setDateImages:(NSArray *)dateImages
{
    _dateImages = dateImages;
    [self.collectionView reloadData];
}

- (void)configCollectionView
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat margin = zScaleW(10);
    CGFloat itemWH = zScaleH(80);
    layout.itemSize = CGSizeMake(itemWH + zScaleW(20), itemWH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - zScaleW(33), zScaleH(80)) collectionViewLayout:layout];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.alwaysBounceHorizontal = YES;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.contentInset = UIEdgeInsetsMake(4, zScaleW(13), 4, zScaleW(13));
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[SHImagePreViewCell class] forCellWithReuseIdentifier:@"SHImagePreViewCell"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dateImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SHImagePreViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SHImagePreViewCell" forIndexPath:indexPath];
    NSString *pathUrl = _dateImages[indexPath.row];
    cell.backgroundColor = [UIColor greenColor];
    [cell.imageView setHeaderWithURL:[NSURL URLWithString:pathUrl]];
    return cell;
}

@end
