//
//  FYInfoHeadTableViewCell.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/23.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYInfoHeadTableViewCell.h"

@implementation FYInfoHeadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(25,5, 50, 50)];
        _headImg.layer.cornerRadius = 25;
        _headImg.layer.masksToBounds = YES;
        _headImg.clipsToBounds = YES;
        _headImg.image = [UIImage imageNamed:@"myHead"];
        [_headImg setUserInteractionEnabled:YES];
        UITapGestureRecognizer *singelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseHeadIcon:)];
        [_headImg addGestureRecognizer:singelTap];
        [self.contentView addSubview:_headImg];
    }
    return self;
}

-(void)chooseHeadIcon:(UITapGestureRecognizer *)gestureRecognizer{
    if(_delegate &&[_delegate respondsToSelector:@selector(chooseHeadIcon:)])
    {
        [_delegate chooseHeadIcon:self];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
