//
//  FJContentView.h
//  类似网易新闻标题
//
//  Created by webplus on 17/10/19.
//  Copyright © 2017年 sanyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FJTitleScrollView.h"

@interface FJContentView : UIView
//标题的视图
@property (nonatomic, strong)FJTitleScrollView *titleScrollView;
//承载子控制器的视图
@property (nonatomic, strong)UIScrollView *scrollView;

@property (nonatomic, strong)NSArray *titleArray;


@end
