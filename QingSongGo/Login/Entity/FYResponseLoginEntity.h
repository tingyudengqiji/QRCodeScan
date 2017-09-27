//
//  FYLoginResponseEntity.h
//  QingSongGo
//
//  Created by 方进 on 2017/9/26.
//  Copyright © 2017年 方进. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYUserAccount.h"

@interface FYResponseLoginEntity : NSObject

@property (nonatomic, copy)NSString *success;
@property (nonatomic, strong)FYUserAccount *user;

@end

