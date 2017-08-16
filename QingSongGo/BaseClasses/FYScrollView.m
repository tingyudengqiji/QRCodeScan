//
//  FYScrollerView.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/15.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYScrollView.h"

@interface FYScrollView()<UIScrollViewDelegate>{
    UIImageView *_leftPageView;
    UIImageView *_middlePageView;
    UIImageView *_rightPageView;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *imagesArr;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) NSInteger pageIndex;



@end

@implementation FYScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor lightGrayColor]];
        [self setScollView];
    }
     return self;
}

-(void)setScollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width , self.frame.size.height)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize =  CGSizeMake(ScreenWidth, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
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
    _scrollView.contentSize = CGSizeMake(3*CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _pageControl.numberOfPages = _pageCount;
//    
//    CGSize size = _scrollView.frame.size;
//    for (int i = 0; i < _pageCount; i++) {
//        UIImageView *iconView = [[UIImageView alloc] init];
//        [self.scrollView addSubview:iconView];
//        iconView.image = _imagesArr[i];
//        
//        CGFloat x = i * size.width;
//        //frame
//        iconView.frame = CGRectMake(x, 0, size.width, size.height);
//        
//    }
    
    for (int i = 0; i < 3; i ++) {
        UIImageView *page = [[UIImageView alloc]init];
        page.frame = CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height);
        page.tag = 1000+i;
        [_scrollView addSubview:page];
    }
    // 设置初始展示图片
    _leftPageView= [_scrollView viewWithTag:1000];
    _middlePageView = [_scrollView viewWithTag:1001];
    _rightPageView = [_scrollView viewWithTag:1002];
    // 一开始要显示中间的第一张，所以左边放最后一张，右边放第二张
    _leftPageView.image = _imagesArr.lastObject;
    _middlePageView.image = _imagesArr.firstObject;
    _rightPageView.image = _imagesArr[1];
    
    // 设置初始偏移量和索引
    _scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    _pageIndex = 0;
     [self addTimer];
}


-(void)addTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector:@selector(nextPage)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)nextPage{
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width * 2, 0) animated:YES];
    if (_pageIndex == _pageCount - 1)
    {
        _pageControl.currentPage = 0;
    }
    else
    {
        _pageControl.currentPage = _pageIndex + 1;
    }
    
    _pageIndex = _pageControl.currentPage;


}
//正在滚动的时候
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (_pageControl.currentPage == _pageCount-1) {
        _leftPageView.image = _imagesArr[_pageControl.currentPage-1];
        _middlePageView.image = _imagesArr[_pageControl.currentPage];
        _rightPageView.image = _imagesArr.firstObject;
    }
    else if (_pageControl.currentPage == 0){
        _leftPageView.image = _imagesArr.lastObject;
        _middlePageView.image = _imagesArr.firstObject;
        _rightPageView.image = _imagesArr[1];
        
    }else{
        _leftPageView.image = _imagesArr[_pageControl.currentPage-1];
        _middlePageView.image = _imagesArr[_pageControl.currentPage];
        _rightPageView.image = _imagesArr[_pageControl.currentPage+1];
    }
    // 重新设置偏移量
    _scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
}


@end
