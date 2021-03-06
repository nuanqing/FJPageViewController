//
//  FJContentView.m
//  类似网易新闻标题
//
//  Created by webplus on 17/10/19.
//  Copyright © 2017年 sanyi. All rights reserved.
//

#import "FJContentView.h"
#import "FJBaseConfigure.h"
//指示器距离标题视图底部的位置
#define Padding 2

@interface FJContentView ()<UIScrollViewDelegate>

@end

@implementation FJContentView

- (id)initWithTitleArray:(NSArray *)titleArray{
    if (self = [super init]) {
        self.titleScrollView.titleArray = titleArray.mutableCopy;
        _titleArray = titleArray;
        self.buttonArray = self.titleScrollView.buttonArray;
        [self setupUI];
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray{
    self.titleScrollView.titleArray = titleArray.mutableCopy;
    _titleArray = titleArray;
    self.buttonArray = self.titleScrollView.buttonArray;
    [self setupUI];
}

//初始化标题视图和承载子控制器的视图
- (void)setupUI{
    
    CGFloat titleViewHeight = titleHeight+indicatorHeight+Padding;
    self.scrollView.frame = CGRectMake(0,titleViewHeight, FJWidth, FJHeight -titleViewHeight-NAVHeight);
    self.scrollView.contentSize = CGSizeMake(self.titleArray.count*FJWidth, FJHeight -titleViewHeight-NAVHeight);
     self.titleScrollView.frame = CGRectMake(0, 0, FJWidth, titleViewHeight);
    __weak typeof(self) weakSelf = self;
    //承载子控制器的视图滚动到正确控制器位置
    self.titleScrollView.titleViewSelectIdxHandler = ^(NSInteger selectIdx){
       [weakSelf.scrollView setContentOffset:CGPointMake(selectIdx * FJWidth, 0) animated:YES];
    };
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if ([_delegate respondsToSelector:@selector(loadChildViewControllers)]) {
        [_delegate loadChildViewControllers];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:self.scrollView];
    NSInteger idx = scrollView.contentOffset.x / FJWidth;
    self.scrollView.contentOffset = CGPointMake(idx * FJWidth, 0);
    [self.titleScrollView titleButtonClick:self.buttonArray[idx]];
}

#pragma mark - 懒加载
- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
//承载子控制器的视图
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}
//标题视图
- (FJTitleScrollView *)titleScrollView{
    if (!_titleScrollView) {
        _titleScrollView = [[FJTitleScrollView alloc]init];
        _titleScrollView.showsHorizontalScrollIndicator = NO;
        _titleScrollView.backgroundColor = TitleScrollBackGroundColor;
        
        [self addSubview:_titleScrollView];
    }
    return _titleScrollView;
}

@end
