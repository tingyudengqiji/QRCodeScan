//
//  FYTabBarController.m
//  轻松购
//
//  Created by 方进 on 2017/8/14.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYTabBarController.h"
#import "FYBaseNavController.h"


#define kController     @"rootVCClassString"
#define kTitle          @"title"
#define kImage          @"imageName"
#define kSelImage       @"selectedImageName"

@interface FYTabBarController ()

@end

@implementation FYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *itemsArray = @[
                            @{kController:@"FYHomeViewController",
                              kTitle:@"首页",
                              kImage:@"tabbar_home",
                              kSelImage:@"tabbar_homeHL"},
                            @{kController:@"FYClassifyViewController",
                              kTitle:@"分类",
                              kImage:@"tabbar_classify",
                              kSelImage:@"tabbar_classifyHL"},
                            @{kController:@"FYDiscoveryViewController",
                              kTitle:@"发现",
                              kImage:@"tabbar_discover",
                              kSelImage:@"tabbar_discoverHL"},
                            @{kController:@"FYMineViewController",
                              kTitle:@"我的",
                              kImage:@"tabbar_mine",
                              kSelImage:@"tabbar_mineHL"},
                            ];
    [itemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict,NSUInteger idx,BOOL *stop){
        UIViewController *VC = [NSClassFromString(dict[kController])new];
        VC.title = dict[kTitle];
        FYBaseNavController *nav = [[FYBaseNavController alloc]initWithRootViewController:VC];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitle];
        item.image = [UIImage imageNamed:dict[kImage]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImage]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBA(30, 170, 60, 1)} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
