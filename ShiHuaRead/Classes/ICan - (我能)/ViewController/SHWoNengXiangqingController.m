//
//  SHWoNengXiangqingController.m
//  qianqu
//
//  Created by 海波的电脑 on 2017/8/10.
//  Copyright © 2017年 海波的电脑. All rights reserved.
//

#import "SHWoNengXiangqingController.h"
#import "WoNengTableViewCell.h"
#import "SHBottomView.h"
@interface SHWoNengXiangqingController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIView * blueView;
@property(nonatomic,strong)UIButton * selectedBtn;
@property(nonatomic,strong)UIScrollView * xinxiScrollView;
@end

@implementation SHWoNengXiangqingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpHeadView];
    [self setUpButtonSView];
    [self setUpScrollView];
    [self setUpBootmView];
}
-(void)setUpBootmView{
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 50, kScreenWidth, 50)];
    bottomView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    bottomView.layer.borderWidth = 0.3;
    UIButton * liaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [liaoButton setTitle:@"聊一聊" forState:UIControlStateNormal];
    [liaoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    liaoButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [liaoButton setBackgroundImage:[UIImage imageNamed:@"icon-229-667.png"] forState:UIControlStateNormal];
    liaoButton.frame = CGRectMake(16, 9, 115, 33);
    [liaoButton addTarget:self action:@selector(liaoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:liaoButton];
    //点赞按钮
    UIColor * seletColor = [UIColor colorWithRed:46/255.0 green:146/255.0 blue:255/255.0 alpha:1.0];
    UIButton * dianZanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [dianZanBtn setImage:[UIImage imageNamed:@"icon-58.png"] forState:UIControlStateNormal];
    [dianZanBtn setTitle:@"点赞: 1000" forState:UIControlStateNormal];
    dianZanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [dianZanBtn setTitleColor:seletColor forState:UIControlStateNormal];
    [dianZanBtn addTarget:self action:@selector(dianzanClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:dianZanBtn];
    [dianZanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView);
        make.right.equalTo(bottomView).offset(-23);
    }];
    
    [self.view addSubview:bottomView];
}
//点击聊一聊
-(void)liaoBtnClick:(UIButton *)btn{
    
}
//点击点赞
-(void)dianzanClick:(UIButton *)btn{
    
}
-(void)setUpScrollView{
    UIScrollView * xinxiScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 238, kScreenWidth, 340)];
    xinxiScrollView.contentSize = CGSizeMake(kScreenWidth * 3, 0);
    xinxiScrollView.pagingEnabled = YES;
    xinxiScrollView.showsVerticalScrollIndicator = NO;
    xinxiScrollView.showsHorizontalScrollIndicator = NO;
    xinxiScrollView.delegate = self;
    for (int i = 0; i < 3; i ++) {
        SHBottomView * xinxiBottomView = [[SHBottomView alloc]init];
        xinxiBottomView.backgroundColor = [UIColor whiteColor];
        for (UIImageView * zhaopianImage in xinxiBottomView.imagesView.subviews) {
            zhaopianImage.image = [UIImage imageNamed:@"icon-tupian-183-221.png"];
        }
        xinxiBottomView.frame = CGRectMake(i * kScreenWidth, 0, kScreenWidth, 340);
        [xinxiScrollView addSubview:xinxiBottomView];
        xinxiBottomView.xinxiOne.text = [NSString stringWithFormat:@"详细姓名: 扯犊子%d",i];
    }
    self.xinxiScrollView = xinxiScrollView;
    [self.view addSubview:xinxiScrollView];
}
-(void)setUpButtonSView{
    UIView * BigView = [[UIView alloc]initWithFrame:CGRectMake(0, 193, kScreenWidth, 41)];
    BigView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:BigView];
    UIView * buttonView = [[UIView alloc]initWithFrame:CGRectMake(5, 193, kScreenWidth - 10, 41)];
    buttonView.layer.borderWidth = 0.5;
    buttonView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    NSArray * titles = @[@"群演演员",@"专业模特",@"武术替身"];
    CGFloat buttonW = (kScreenWidth - 13)/3;
    UIView * grayView = [[UIView alloc]initWithFrame:CGRectMake(buttonW, 5, 1, 30)];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [buttonView addSubview:grayView];
    UIView * grayViewS = [[UIView alloc]initWithFrame:CGRectMake(buttonW * 2 + 1, 5, 1, 30)];
    grayViewS.backgroundColor = [UIColor lightGrayColor];
    UIColor * seletColor = [UIColor colorWithRed:46/255.0 green:146/255.0 blue:255/255.0 alpha:1.0];
    [buttonView addSubview:grayViewS];
    for (int i = 0; i < 3; i ++) {
        UIButton * button = [[UIButton alloc]init];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:seletColor forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(i * (buttonW + 1), 0, buttonW, 40);
        button.tag = i + 5;
        [button addTarget:self action:@selector(xuanZeClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self xuanZeClick:button];
        }
        [buttonView addSubview:button];
    }
    UIView * blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, buttonW, 1)];
    blueView.backgroundColor = seletColor;
    self.blueView = blueView;
    [buttonView addSubview:blueView];
    [self.view addSubview:buttonView];
}
#pragma UIScrollViewDelegate
/**
 人气拖动的时候，滚动动画结束时调用
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.x >= 0 ) {
       NSInteger index = scrollView.contentOffset.x / scrollView.width;
       [self changeXinXiView:index];
       [self changeSelectedBtn:index + 5];
    }
}
-(void)changeSelectedBtn:(NSInteger)currentAge{
    UIButton * selectedBtn = (UIButton *)[self.view viewWithTag:currentAge];
    selectedBtn.selected = YES;
    self.selectedBtn.selected = NO;
    self.selectedBtn = selectedBtn;
}
//点击按钮
-(void)xuanZeClick:(UIButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    NSInteger number = btn.tag - 5;
    [self changeXinXiView:number];
}
//设置滚动视图和设置展示页的转换
-(void)changeXinXiView:(NSInteger)currentpage{
    CGFloat buttonW = (kScreenWidth - 13)/3;
    //下标的滚动到指定按钮下
    [UIView animateWithDuration:0.3 animations:^{
        self.blueView.frame = CGRectMake(currentpage * (buttonW + 1),40, buttonW, 1);
    }];
    //展示页的转换
    self.xinxiScrollView.contentOffset = CGPointMake(currentpage * kScreenWidth, 0);
}
-(void)setUpHeadView{
    WoNengTableViewCell * cell = [WoNengTableViewCell WoNengTableViewCell];
    cell.WoMenCellHeight.hidden = YES;
    cell.WoMenCellSex.hidden = YES;
    cell.WoMenCellNumber.hidden = YES;
    cell.heigthImage.hidden = YES;
    cell.oneview.hidden = YES;
    cell.sexImage.hidden = YES;
    cell.twoView.hidden = YES;
    cell.buzhidoaImage.hidden = YES;
    cell.frame = CGRectMake(0, 64, kScreenWidth, 130);
    [self.view addSubview:cell];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
