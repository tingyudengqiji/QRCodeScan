//
//  FYHomeViewController.m
//  轻松购
//
//  Created by 方进 on 2017/8/14.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYHomeViewController.h"
#import "FYScrollView.h"

@interface FYHomeViewController ()

@property (nonatomic, strong) NSArray *imgaesArray;
@property (nonatomic, strong) FYScrollView *scrollView;


@end

@implementation FYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1]];
    _imgaesArray = @[@"page 1", @"page 2", @"page3", @"page 4", @"page 5"];
    _scrollView = [[FYScrollView alloc]initWithFrame:CGRectMake(0,64, ScreenWidth, 200)];
    [self.view addSubview:_scrollView];
    [self setScrollView];
    
}

-(void)setScrollView{
    NSMutableArray *imgArray = [NSMutableArray new];
    for (int i = 0; i < _imgaesArray.count; i ++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [imgArray addObject:img];
    }
    [_scrollView setupSubViewPages:imgArray withCallBackBlock:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
