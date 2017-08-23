//
//  FYInfoHeadTableViewCell.h
//  QingSongGo
//
//  Created by 方进 on 2017/8/23.
//  Copyright © 2017年 方进. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FYInfoHeadTableViewCell;
@protocol FYInfoHeadDelegate <NSObject>

- (void)chooseHeadIcon:(FYInfoHeadTableViewCell *)cell;

@end
@interface FYInfoHeadTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImg;
@property (nonatomic, assign) id<FYInfoHeadDelegate>delegate;

@end
