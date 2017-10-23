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

@interface ViewController ()<UIScrollViewDelegate>


@property (nonatomic)FJContentView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titleArray = @[@"测试01",@"测试02",@"测试03",@"测试04",@"测试05",@"测试06",@"测试07",@"测试08",@"测试09",@"测试10"];
    self.contentView.titleArray = titleArray;
    self.contentView.frame = CGRectMake(0, 0, FJWidth, FJHeight);
    //添加子控制器
    for (NSInteger i = 0; i < titleArray.count; i++) {
        UIViewController *vc = [UIViewController new];
        vc.view.frame = CGRectMake(FJWidth*i, 0, FJWidth,self.contentView.scrollView.frame.size.height);
        vc.view.backgroundColor = RandColor; //随机色
        [self.contentView.scrollView addSubview:vc.view];
        [self addChildViewController:vc];
    }
    
}
// 添加标题滚动视图
- (FJContentView *)contentView
{
    if (!_contentView) {
        _contentView = [[FJContentView alloc]init];
        [self.view addSubview:_contentView];
    }
    return _contentView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
