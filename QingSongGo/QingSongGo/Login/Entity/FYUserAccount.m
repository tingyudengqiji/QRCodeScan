//
//  FYUserAccount.m
//  QingSongGo
//
//  Created by 方进 on 2017/9/26.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYUserAccount.h"

@implementation FYUserAccount
/**
将自定义类型转变为NSData类型了
*/
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.balance forKey:@"balance"];
    [aCoder encodeObject:self.cardNum forKey:@"cardNum"];
    [aCoder encodeObject:self.userAccounts forKey:@"userAccounts"];
    [aCoder encodeObject:self.userEmail forKey:@"userEmail"];
    [aCoder encodeObject:self.userIdentity forKey:@"userIdentity"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.userRealName forKey:@"userRealName"];
    [aCoder encodeObject:self.userHead forKey:@"userHead"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.balance = [aDecoder decodeObjectForKey:@"balance"];
        self.cardNum = [aDecoder decodeObjectForKey:@"cardNum"];
        self.userAccounts = [aDecoder decodeObjectForKey:@"userAccounts"];
        self.userEmail = [aDecoder decodeObjectForKey:@"userEmail"];
        self.userIdentity = [aDecoder decodeObjectForKey:@"userIdentity"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userRealName = [aDecoder decodeObjectForKey:@"userRealName"];
        self.userHead = [aDecoder decodeObjectForKey:@"userHead"];
    }
    return self;
}
@end
