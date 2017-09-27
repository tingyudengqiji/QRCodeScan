//
//  FYLoginRequestEntity.h
//  QingSongGo
//
//  Created by 方进 on 2017/9/26.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYRequestEntity.h"

@interface FYRequestLoginEntity : FYRequestEntity<NSCoding>

@property (nonatomic, copy) NSString *userAccounts;
@property (nonatomic, copy) NSString *userPassword;

@end
