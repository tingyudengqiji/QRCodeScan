//
//  FYLoginRequestEntity.m
//  QingSongGo
//
//  Created by 方进 on 2017/9/26.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYRequestLoginEntity.h"

@implementation FYRequestLoginEntity

- (instancetype)init{
    self = [super init];
    if (self) {
        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@%@",BASEURL,@"user/userlogin"] forKey:@"FYServerURL"];
    }
    return self;
}


/**
将自定义类型转变为NSData类型了
 */
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userAccounts forKey:@"userAccounts"];
    [aCoder encodeObject:self.userPassword forKey:@"userPassword"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userAccounts = [aDecoder decodeObjectForKey:@"userAccounts"];
        self.userPassword = [aDecoder decodeObjectForKey:@"userPassword"];
    }
    return self;
}


@end
