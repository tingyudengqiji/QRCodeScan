//
//  FYScrollerView.h
//  QingSongGo
//
//  Created by 方进 on 2017/8/15.
//  Copyright © 2017年 方进. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ScrollViewBlock)();

@interface FYScrollView : UIView

- (void)setupSubViewPages:(NSArray *)imagesArray withCallBackBlock:(ScrollViewBlock)block;

@end
