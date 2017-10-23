//
//  FJTitleScrollView.m
//  类似网易新闻标题
//
//  Created by webplus on 17/10/18.
//  Copyright © 2017年 sanyi. All rights reserved.
//

#import "FJTitleScrollView.h"
#import "FJBaseConfigure.h"

#define Tager 100

@interface FJTitleScrollView ()

@property (nonatomic, assign)NSInteger buttonSelectIdx;
//指示器
@property (nonatomic, strong)UIView *indicatorView;

@property (nonatomic, assign) CGFloat space;


@end

@implementation FJTitleScrollView


- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray.mutableCopy;
    [self setupUI];
}

- (id)initWithTitleArray:(NSArray *)titleArray{
    if (self = [super init]) {
        _titleArray = titleArray.mutableCopy;
        [self setupUI];
    }
    return self;
}
//设置标题按钮与指示器
- (void)setupUI{
    
    _space = (titleWidth - indicatorWidth)/2;
    //标题按钮
    [_titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *titleButton = [[UIButton alloc]init];
        [titleButton setTitle:_titleArray[idx] forState:UIControlStateNormal];
        [titleButton setTitleColor: TitleNormalColor  forState:UIControlStateNormal];
        [titleButton setTitleColor:TitleSelectColor forState:UIControlStateSelected];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
        titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        titleButton.backgroundColor = [UIColor clearColor];
        titleButton.tag = idx + Tager;
        CGFloat space = _space > 0? 0: fabs(_space);
        titleButton.frame = CGRectMake(space +idx * titleWidth, 0, titleWidth, titleHeight);
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonArray addObject:titleButton];
        [self addSubview:titleButton];
        //默认选中
        if (idx == titleDefaultSelect) {
            titleButton.selected = YES;
            if (titleScale) {
                titleButton.transform = CGAffineTransformMakeScale(1 + titleScaleRange , 1 + titleScaleRange);
            }
        }
    }];
    
    //指示器
    self.indicatorView.frame = CGRectMake(_space, titleHeight, indicatorWidth, indicatorHeight);
    self.indicatorView.backgroundColor = IndicatorColor;
    if (!indicatorShow) {
        self.indicatorView.hidden = YES;
    }else{
        self.indicatorView.hidden = NO;
    }
    CGFloat space = _space > 0? 0: fabs(_space);
    self.contentSize = CGSizeMake(space*2 + _titleArray.count * titleWidth, 0);
}
//标题点击后滚动到的位置
- (void)titleButtonClick:(UIButton *)button{
    
    NSInteger idx = button.tag - Tager;
    
    for (UIButton *btn in _buttonArray) {
        if (button == btn) {
            btn.selected = YES;
            if (titleScale) {
                //放大效果
                button.transform = CGAffineTransformMakeScale(1 + titleScaleRange , 1 + titleScaleRange);
            }
            //设置标题位置
            [self setTitleScrollViewContentOffWithButton:button];
            //指示器位置
            [self changeIndicatorViewFrameWithButtonIdx:idx];
            self.titleViewSelectIdxHandler(idx);
        }else{
            btn.selected = NO;
            if (titleScale) {
                //返回原来的大小
                btn.transform = CGAffineTransformIdentity;
            }
        }
    }
}


- (void)setTitleScrollViewContentOffWithButton:(UIButton *)button{
    
    CGFloat contentOffsetX = button.center.x - FJWidth * 0.5;
    CGFloat contentOffsetMax = self.contentSize.width - FJWidth;
    contentOffsetX = contentOffsetX < 0 ? 0 : contentOffsetX;
    contentOffsetX = contentOffsetX > contentOffsetMax ? contentOffsetMax :contentOffsetX;
    
    [UIView animateWithDuration:titleScrollViewAmimationTime animations:^{
        self.contentOffset = CGPointMake(contentOffsetX, 0);
    }];
    
    
}

- (void)changeIndicatorViewFrameWithButtonIdx:(NSInteger)idx{
  
    [UIView animateWithDuration:indicatorAmimationTime animations:^{
        CGFloat space = _space > 0 ? _space : 0;
        _indicatorView.frame = CGRectMake(space + idx * titleWidth, titleHeight, indicatorWidth, indicatorHeight);
    }];
}

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}


- (UIView *)indicatorView{
       if (!_indicatorView) {
        _indicatorView = [UIView new];
       // 添加标题滚动View
        [self addSubview:_indicatorView];
    }
    return _indicatorView;
}

@end
