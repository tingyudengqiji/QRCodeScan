//
//  UIBarButtonItem+FYCateory.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/17.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "UIBarButtonItem+FYCateory.h"

@implementation UIBarButtonItem (FYCateory)

+(instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:highImgName] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:controlEvents];
    
    return [[self alloc] initWithCustomView:button];
}

@end
