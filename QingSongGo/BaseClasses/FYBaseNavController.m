//
//  FYBaseNavController.m
//  轻松购
//
//  Created by 方进 on 2017/8/14.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYBaseNavController.h"

@interface FYBaseNavController ()

@end

@implementation FYBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//设置导航栏
+ (void)initialize
{
    //设置导航栏的主题
    UINavigationBar * navBar = [UINavigationBar appearance];
    
    //设置导航栏的颜色
    navBar.barTintColor = [UIColor colorWithRed:10/255.0 green:199/255.0 blue:196/255.0 alpha:1];
    
    //设置导航栏内图标颜色
    navBar.tintColor = [UIColor whiteColor];
    
    //设置导航栏背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    
    //设置文字的属性和文字的背景颜色
    [navBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

//设置push的时候隐藏下边菜单栏
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        //如果push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
        
    }
    
    [super pushViewController:viewController animated:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
