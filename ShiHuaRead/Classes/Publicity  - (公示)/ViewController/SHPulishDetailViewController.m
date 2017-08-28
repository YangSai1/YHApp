//
//  SHPulishDetailViewController.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHPulishDetailViewController.h"
#import "SHHomeDetailTopView.h"
#import "SHSkillView.h"

#import "SHPulishDetailBottomView.h"

@interface SHPulishDetailViewController ()<UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) SHHomeDetailTopView *topView;

@property(nonatomic, strong) SHSkillView *skillView;

@property(nonatomic, strong) UIView *blueView;

@property(nonatomic, strong) UIButton *selectedBtn;

@property(nonatomic, strong) UIScrollView *bgScrollView;

@property(nonatomic, strong) UILabel *zhongDanDetailLb;

@end

@implementation SHPulishDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公示详情";
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    
    _bgScrollView = [[UIScrollView alloc] init];
    _bgScrollView.contentSize = CGSizeMake(0, kScreenHeight + zScaleH(250));
    _bgScrollView.showsVerticalScrollIndicator = NO;
    
    _topView = [[SHHomeDetailTopView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, zScaleH(260))];
    
    [_topView text];
    
    _skillView = [[SHSkillView alloc] initWithFrame:CGRectMake(zScaleH(5), _topView.bottom + zScaleH(8), kScreenWidth - zScaleW(10), zScaleH(40))];
    _skillView.titleArray = @[@"哈哈哈哈",@"哈哈哈啥",@"好好",@"啥也是个",@"婚纱",@"沙克斯"];
    
    
    [_bgScrollView addSubview:_topView];
    [_bgScrollView addSubview:_skillView];
    [self.view addSubview:_bgScrollView];

    __weak typeof(self) weakSelf = self;

    [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    [self setUpButtonSView];
    [self setUpScrollView];

}

-(void)setUpButtonSView
{
    UIView * BigView = [[UIView alloc]initWithFrame:CGRectMake(0, zScaleH(260 + 40 + 8 + 8), kScreenWidth, zScaleH(40))];
    
    BigView.backgroundColor = [UIColor whiteColor];
    [_bgScrollView addSubview:BigView];
    
    UIView * buttonView = [[UIView alloc]initWithFrame:CGRectMake(zScaleW(5), 0, kScreenWidth - zScaleW(10), zScaleH(40))];
    
    buttonView.backgroundColor = [UIColor whiteColor];
    
    NSArray * titles = @[@"公示结果",@"公告详情"];
    CGFloat buttonW = (kScreenWidth - zScaleW(10))/2;
    UIView * grayView = [[UIView alloc]initWithFrame:CGRectMake(buttonW, zScaleH(5), 1, zScaleH(30))];
    grayView.backgroundColor = Color_E5E5E5;
    [buttonView addSubview:grayView];
    
    for (int i = 0; i < titles.count; i ++) {
        
        UIButton * button = [[UIButton alloc]init];
        
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:Color_157efb forState:UIControlStateSelected];
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
    UIView * blueView = [[UIView alloc]initWithFrame:CGRectMake(0, zScaleH(40), buttonW, 1)];
    blueView.backgroundColor = Color_157efb;
    self.blueView = blueView;
    [buttonView addSubview:blueView];
    [BigView addSubview:buttonView];
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
    CGFloat buttonW = (kScreenWidth - zScaleW(10))/2;
    //下标的滚动到指定按钮下
    [UIView animateWithDuration:0.3 animations:^{
        self.blueView.frame = CGRectMake(currentpage * (buttonW + 1),zScaleH(40), buttonW, 1);
    }];
    //展示页的转换
    self.scrollView.contentOffset = CGPointMake(currentpage * kScreenWidth, 0);
}

-(void)setUpScrollView
{
    UIScrollView * xinxiScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, zScaleH(260 + 40 + 40 + 8 + 8), kScreenWidth,kScreenHeight - zScaleH(40 + 64 + 8))];
    xinxiScrollView.contentSize = CGSizeMake(kScreenWidth * 2, 0);
    xinxiScrollView.pagingEnabled = YES;
    xinxiScrollView.showsVerticalScrollIndicator = NO;
    xinxiScrollView.showsHorizontalScrollIndicator = NO;
    xinxiScrollView.delegate = self;
    for (int i = 0; i < 2; i ++) {
    
        UIView *view = [[UIView alloc] init];
        if (i == 0) {
            SHPulishDetailBottomView *detailBottomView = [[SHPulishDetailBottomView alloc] init];
            detailBottomView.frame = CGRectMake(i * kScreenWidth, zScaleH(8), kScreenWidth, kScreenHeight - zScaleH(40 + 8 + 64));
            [detailBottomView config:nil];
            [xinxiScrollView addSubview:detailBottomView];

        }else if (i == 1){
            view.frame = CGRectMake(i * kScreenWidth, zScaleH(8), kScreenWidth, kScreenHeight - zScaleH(40 + 8 + 64));
            view.backgroundColor = [UIColor whiteColor];
            _zhongDanDetailLb = [UILabel labelWithFont:font_11 textColor:Color_a4a5a4 numberOfLines:0 textAlignment:NSTextAlignmentLeft];
            
            _zhongDanDetailLb.text = @"  般都是负责影片前期的市场调查，看类似的影片的电影市场是否有前景（比如说票房情况、受欢迎程度、续集的可能性等），通过调查来决定是否值得出品该影片。如果答案是肯定的，那他们就找到所属的电影集团投资制片人及相关人员，开始选导演、剧本、演员、赞助商等。般都是负责影片前期的市场调查，看类似的影片的电影市场是否有前景（比如说票房情况、受欢迎程度、续集的可能性等），通过调查来决定是否值得出品该影片。如果答案是肯定的，那他们就找到所属的电影集团投资制片人及相关人员，开始选导演、剧本、演员、赞助商等。般都是负责影片前期的市场调查，看类似的影片的电影市场是否有前景（比如说票房情况、受欢迎程度、续集的可能性等），通过调查来决定是否值得出品该影片。如果答案是肯定的，那他们就找到所属的电影集团投资制片人及相关人员，开始选导演、剧本、演员、赞助商等。";
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = 5;// 字体的行间距
            paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
            
            NSDictionary *attributes = @{
                                         NSParagraphStyleAttributeName:paragraphStyle,
                                         };
            _zhongDanDetailLb.attributedText = [[NSAttributedString alloc] initWithString:_zhongDanDetailLb.text attributes:attributes];
            
            [xinxiScrollView addSubview:view];
            [view addSubview:_zhongDanDetailLb];

            [_zhongDanDetailLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(view);
                make.left.equalTo(view).offset(zScaleW(13));
                make.right.equalTo(view).offset(zScaleW(-13));
            }];
            
        }
    }
    self.scrollView = xinxiScrollView;
    [_bgScrollView addSubview:_scrollView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
