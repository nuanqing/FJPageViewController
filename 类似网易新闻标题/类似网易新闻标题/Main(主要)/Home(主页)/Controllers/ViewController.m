//
//  ViewController.m
//  类似网易新闻标题
//
//  Created by webplus on 17/10/18.
//  Copyright © 2017年 sanyi. All rights reserved.
//

#import "ViewController.h"
#import "FJContentView.h"
#import "FJBaseConfigure.h"
#import "FJTopicViewController.h"

@interface ViewController ()<ContentViewDelegate>

@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) FJContentView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加子控制器
    [self.titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        FJTopicViewController *vc = [FJTopicViewController new];
        [self addChildViewController:vc];
    }];
    
    self.contentView.delegate = self;
    self.contentView.frame = CGRectMake(0, 0, FJWidth, FJHeight);
    [self.view addSubview:self.contentView];
    //第一次需要加载控制器
    [self loadChildViewControllers];
}

#pragma mark - contentViewDelegate

- (void)loadChildViewControllers{
    NSInteger idx = self.contentView.scrollView.contentOffset.x / FJWidth;
    UIViewController *ShowVc = self.childViewControllers[idx];
    // 加载过的控制器，就直接返回(同一个view添加多次只会添加一次,没有必要每次添加)
    if (![ShowVc isViewLoaded]){
        ShowVc.view.frame = CGRectMake(FJWidth*idx, 0, FJWidth,self.contentView.scrollView.frame.size.height);
        ShowVc.title = _titleArray[idx];
        [self.contentView.scrollView addSubview:ShowVc.view];
    }
}

#pragma mark - 懒加载
- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"测试01",@"测试02",@"测试03",@"测试04",@"测试05",@"测试06",@"测试07",@"测试08",@"测试09",@"测试10"];
    }
    return _titleArray;
}

- (FJContentView *)contentView
{
    if (!_contentView) {
        _contentView = [[FJContentView alloc]initWithTitleArray:_titleArray];
    }
    return _contentView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
