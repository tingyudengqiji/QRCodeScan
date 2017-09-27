//
//  FYMyHeadTableViewCell.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/18.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYMyHeadTableViewCell.h"

@implementation FYMyHeadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
//        _setUpBtn = [[UIButton alloc]initWithFrame:CGRectMake(20,50 , 40, 20)];
//        [_setUpBtn setTitle:@"登录" forState:UIControlStateNormal];
//        [_setUpBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
        
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(40,90, 50, 50)];
        _headImg.layer.cornerRadius = 25;
        _headImg.layer.masksToBounds = YES;
        _headImg.clipsToBounds = YES;
        _headImg.image = [UIImage imageNamed:@"myHead"];
        [_headImg setUserInteractionEnabled:YES];

        _nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(_headImg.frame.origin.x+_headImg.frame.size.width + 10, _headImg.frame.origin.y, 100, 20)];
        _nameLbl.textColor = [UIColor whiteColor];
        _nameLbl.font = [UIFont systemFontOfSize:16];
        _nameLbl.text = @"听雨等奇迹";
        
        _infoLbl = [[UILabel alloc]initWithFrame:CGRectMake(_headImg.frame.origin.x+_headImg.frame.size.width + 10, _nameLbl.frame.origin.y+_nameLbl.frame.size.height+5, 100, 20)];
        _infoLbl.textColor = [UIColor whiteColor];
        _infoLbl.font = [UIFont systemFontOfSize:13];
        _infoLbl.text = @"雨迹";
        
//        [self.contentView addSubview:_setUpBtn];
        [self.contentView addSubview:_headImg];
        [self.contentView addSubview:_nameLbl];
        [self.contentView addSubview:_infoLbl];
    }
    return self;
}

//- (void)login:(id)sender{
//    if(_delegate && [_delegate respondsToSelector:@selector(jumpLogin:)]){
//        [_delegate jumpLogin:self];
//    }
//}

-(void)creatUIWithMode:(FYUserAccount*)dic{
    _nameLbl.text = dic.userRealName;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
