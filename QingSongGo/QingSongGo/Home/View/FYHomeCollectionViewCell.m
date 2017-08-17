//
//  FYHomeCollectionViewCell.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/17.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYHomeCollectionViewCell.h"

@implementation FYHomeCollectionViewCell
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

-(void)initView
{
    _picView = [[UIImageView alloc]init];
    _picView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_picView];
    
    _labelInfo = [[UILabel alloc]init];
    _labelInfo.font = [UIFont systemFontOfSize:14];
    _labelInfo.textColor = [UIColor grayColor];
    _labelInfo.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_labelInfo];
}
@end
