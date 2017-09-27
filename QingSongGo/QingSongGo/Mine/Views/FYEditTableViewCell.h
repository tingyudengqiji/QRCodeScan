//
//  FYEditTableViewCell.h
//  QingSongGo
//
//  Created by 方进 on 2017/8/23.
//  Copyright © 2017年 方进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYEditTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *infoLabel;


-(void)creatUIWithMode:(NSDictionary*)dic;

@end
