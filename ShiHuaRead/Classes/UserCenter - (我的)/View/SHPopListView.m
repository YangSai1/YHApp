//
//  SHPopListView.m
//  ShiHuaRead
//
//  Created by Mac on 2017/8/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SHPopListView.h"

@interface SHPopListView ()<UITableViewDelegate , UITableViewDataSource>

@property(nonatomic, copy) SHChangBlock block;

@property(nonatomic, copy) SHChangModelBlock modelBlock;

@end

@implementation SHPopListView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
        //初始化数据
        self.backgroundColor = [UIColor whiteColor];
        [self initData];
    }
    
    return self;
}

#pragma mark - 初始化数据

- (void)initData{
    
    self.backgroundColor = [UIColor clearColor];
    
    self.delegate = self;
    
    self.dataSource = self;
    
//    self.bounces = NO;
    
    self.allowsMultipleSelectionDuringEditing = YES; //支持同时选中多行
    
    self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    
    self.separatorColor = [[UIColor grayColor] colorWithAlphaComponent:0.2f];
    
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)setArray:(NSArray *)array{
    
    _array = array;
    
    [self reloadData];
    
    
//    CGRect selfFrame = self.frame;
//    
//    selfFrame.size.height = array.count * 50.0f;
    
//    self.frame = selfFrame;
}

- (void)setModelArr:(NSArray<SHQuerySkillListData *> *)modelArr
{
    _modelArr = modelArr;
    _array = nil;
    [self reloadData];
}

#pragma mark - UITableViewDelegate , UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (_modelArr) {
        return _modelArr.count;
    }
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    SHQuerySkillListData *model;
    NSString *title;
    if (_modelArr) {
        model = _modelArr[indexPath.row];
        title = model.name;
    }else{
        title = _array[indexPath.row];
    }
    
    cell.textLabel.text = title;
    
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.selectedBackgroundView = [UIView new];
    
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1.0f];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SHQuerySkillListData *model;

    if (_modelArr) {
        
        model = _modelArr[indexPath.row];
        if (_modelBlock) {
            _modelBlock(model);
        }
    }else{
        
        NSString *title = self.array[indexPath.row];
        
        if (_block) {
            _block(title);
        }
  
    }
    
    

}

- (void)registBlock:(SHChangBlock)block
{
    _block = block;
}

- (void)registModelBlock:(SHChangModelBlock)block
{
    _modelBlock = block;
}
@end
