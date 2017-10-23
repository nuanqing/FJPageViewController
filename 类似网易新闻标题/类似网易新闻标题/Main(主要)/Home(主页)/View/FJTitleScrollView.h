//
//  FJTitleScrollView.h
//  类似网易新闻标题
//
//  Created by webplus on 17/10/18.
//  Copyright © 2017年 sanyi. All rights reserved.
//

#import <UIKit/UIKit.h>
//选中标题的回调，使页面跳到正确的位置
typedef void(^FJTitleScrollViewSelectIdxHandler)(NSInteger selectIdx);

@interface FJTitleScrollView : UIScrollView

//标题数组
@property (strong , nonatomic)NSMutableArray *titleArray;
//标题按钮数组
@property (nonatomic, strong) NSMutableArray *buttonArray;

@property (nonatomic, copy)FJTitleScrollViewSelectIdxHandler titleViewSelectIdxHandler;

- (void)titleButtonClick:(UIButton *)button;


@end
