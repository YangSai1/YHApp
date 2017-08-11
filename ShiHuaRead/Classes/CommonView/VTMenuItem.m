//
//  VTMenuItem.m
//  VTMagic
//
//  Created by tianzhuo on 7/8/16.
//  Copyright © 2016 tianzhuo. All rights reserved.
//

#import "VTMenuItem.h"
#import <VTMagic/VTMagic.h>

@interface VTMenuItem()

@property (nonatomic, strong) UIView *dotView;

@property(nonatomic, strong) UIView *lineView;


@end

@implementation VTMenuItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _dotHidden = YES;
        _dotView = [[UIView alloc] init];
        _dotView.translatesAutoresizingMaskIntoConstraints = NO;
        _dotView.backgroundColor = [UIColor redColor];
        _dotView.layer.masksToBounds = YES;
        _dotView.layer.cornerRadius = 4.f;
        _dotView.hidden = _dotHidden;
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = Color_E5E5E5;
        view.frame = CGRectMake(self.width - 1, 0, 1, self.height);
        _lineView = view;
        [self addSubview:view];
        
        UIView *bottomView = [[UIView alloc] init];
        bottomView.backgroundColor = Color_E5E5E5;
        bottomView.frame = CGRectMake(0, self.height - 1, self.width, 1);
        _bottomView = bottomView;
        [self addSubview:bottomView];

        
        [self addSubview:_dotView];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_dotView(8)]-20-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_dotView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_dotView(8)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_dotView)]];
    __weak typeof(self) weakSelf = self;

    
    [_lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-1);
        make.top.bottom.equalTo(weakSelf);
        make.width.equalTo(@(1));
    }];
    
    [_bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.height.equalTo(@(1));
        make.left.right.equalTo(weakSelf);
    }];

    
    [super updateConstraints];
}

- (void)vtm_prepareForReuse {
    VTLog(@"menuItem will be reused: %@", self);
}

#pragma mark - accessor methods
- (void)setDotHidden:(BOOL)dotHidden {
    _dotHidden = dotHidden;
    _dotView.hidden = dotHidden;
}

- (void)setLineHidden:(BOOL)lineHidden
{
    _lineHidden = lineHidden;
    _lineView.hidden = lineHidden;
}

@end
