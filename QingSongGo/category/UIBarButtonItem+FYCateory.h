//
//  UIBarButtonItem+FYCateory.h
//  QingSongGo
//
//  Created by 方进 on 2017/8/17.
//  Copyright © 2017年 方进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FYCateory)

+(instancetype)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImgName target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
