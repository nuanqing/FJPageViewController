# FJPageViewController
最近类似网易新闻，腾讯视频，今日头条等标题的滚动效果控件非常火，自己工作闲暇之余也写了一个类似的效果（OC与Swift两个版本），虽然简单，但希望能够帮助到需要的朋友~

>作者：nuanqing
>
>版本：1.0.0
>
>简介：类似网易新闻，腾讯视频，今日头条等标题的滚动效果控件，可以自己定义效果。
>


![效果图](https://github.com/nuanqing/FJPageViewController/blob/master/类似网易新闻标题/pageView.png)


基本使用，在控制器中添加以下代码:

```
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
有用的话，不妨给个**Star**吧！~
