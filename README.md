# FJPageViewController
标题的滚动效果控件

>
>简介：一款标题的滚动效果控件，可以自己定义效果。
>


![效果图](https://github.com/nuanqing/FJPageViewController/blob/master/类似网易新闻标题/gif动画.gif)


基本使用，在控制器中添加以下代码:

```
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
```
设置代理方法:
```
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
```

修改配置:

```
//标题宽度
static CGFloat const titleWidth              = 100;
//标题高度
static CGFloat const titleHeight             = 40;
//选中标题的放大效果
static BOOL    const titleScale              = YES;
//标题放大范围 0 - 1
static CGFloat const titleScaleRange         = 0.3;
//标题字的大小
static CGFloat const titleFontSize           = 16;
//是否显示指示器
static BOOL    const indicatorShow           = YES;
//指示器宽度
static CGFloat const indicatorWidth          = 110;
//指示器高度
static CGFloat const indicatorHeight         = 4;
//指示器过渡动画时间
static CGFloat const indicatorAmimationTime  = 0.2;
//标题过渡动画时间
static CGFloat const titleScrollViewAmimationTime  = 0.32;
//标题的默认选中 (不能超过数组的个数)
static NSInteger const titleDefaultSelect  = 0;
```
