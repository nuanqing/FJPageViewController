//
//  FJBaseConfigure.h
//  类似网易新闻标题
//
//  Created by webplus on 17/10/23.
//  Copyright © 2017年 sanyi. All rights reserved.
//

#ifndef FJBaseConfigure_h
#define FJBaseConfigure_h

#define FJWidth [UIScreen mainScreen].bounds.size.width

#define FJHeight [UIScreen mainScreen].bounds.size.height
//导航高度
#define NAVHeight 64

//颜色的定义
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

#define RandColor RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))


//标题颜色
#define TitleNormalColor [UIColor blackColor]
//标题选中颜色
#define TitleSelectColor [UIColor blueColor]
//标题背景色
#define TitleScrollBackGroundColor   [UIColor whiteColor]
//指示器颜色
#define IndicatorColor   [UIColor grayColor]

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

#endif /* FJBaseConfigure_h */
