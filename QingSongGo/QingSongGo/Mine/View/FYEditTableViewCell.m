//
//  FYEditTableViewCell.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/23.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYEditTableViewCell.h"

@implementation FYEditTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 12, (ScreenWidth-60)/2, 20)];
        _titleLabel.text = @"昵称";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLabel];
        _infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(_titleLabel.frame.origin.x+_titleLabel.frame.size.width, 12, (ScreenWidth-60)/2, 20)];
        _infoLabel.text = @"听雨等奇迹";
        _infoLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_infoLabel];
    }
    return self;
}

-(void)creatUIWithMode:(NSDictionary*)dic{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
