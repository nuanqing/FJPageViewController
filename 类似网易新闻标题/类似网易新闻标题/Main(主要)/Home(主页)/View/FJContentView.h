//
//  FJContentView.h
//  类似网易新闻标题
//
//  Created by webplus on 17/10/19.
//  Copyright © 2017年 sanyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FJTitleScrollView.h"

@protocol ContentViewDelegate <NSObject>

- (void)loadChildViewControllers;

@end

@interface FJContentView : UIView
//标题的视图
@property (nonatomic, strong) FJTitleScrollView *titleScrollView;
//承载子控制器的视图
@property (nonatomic, strong) UIScrollView *scrollView;
//标题数组
@property (nonatomic, strong) NSArray *titleArray;
//按钮数组
@property (nonatomic, strong) NSMutableArray *buttonArray;
//代理
@property (nonatomic, weak) id<ContentViewDelegate> delegate;
//初始化方法
- (id)initWithTitleArray:(NSArray *)titleArray;

@end
