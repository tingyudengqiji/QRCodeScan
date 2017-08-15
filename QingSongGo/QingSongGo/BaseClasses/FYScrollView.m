//
//  FYScrollerView.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/15.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYScrollView.h"

@interface FYScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *imagesArr;
@property (nonatomic, assign) NSInteger pageCount;

@end

@implementation FYScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor lightGrayColor]];
        [self setScollView];
        [self addTimer];

    }
     return self;
}

-(void)setScollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width , self.frame.size.height)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize =  CGSizeMake(ScreenWidth, 0);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height-50, self.frame.size.width, 50)];
    [self addSubview:_pageControl];
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
}

-(void)setupSubViewPages:(NSArray *)imagesArray withCallBackBlock:(ScrollViewBlock)block{
    _imagesArr = imagesArray;
    _pageCount = imagesArray.count;
    _scrollView.contentSize = CGSizeMake(_pageCount*CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _pageControl.numberOfPages = _pageCount;
    
    CGSize size = _scrollView.frame.size;
    for (int i = 0; i < _pageCount; i++) {
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.scrollView addSubview:iconView];
        iconView.image = _imagesArr[i];
        
        CGFloat x = i * size.width;
        //frame
        iconView.frame = CGRectMake(x, 0, size.width, size.height);
        
    }
}


-(void)addTimer{
    _timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//    [_timer fire];
}

-(void)nextPage{
    NSInteger pageIndex = _pageControl.currentPage;
    if (pageIndex == _pageControl.currentPage-1) {
        pageIndex = 0;
        _scrollView.contentOffset= CGPointMake(self.frame.size.width, 0);
        [_scrollView setContentOffset:_scrollView.contentOffset animated:YES];
    }else{
        pageIndex ++;
    }
    CGFloat offsetx = pageIndex *_scrollView.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        _scrollView.contentOffset = CGPointMake(offsetx, 0);
    }];
    
}



@end
