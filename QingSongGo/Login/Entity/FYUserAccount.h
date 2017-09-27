//
//  FYUserAccount.h
//  QingSongGo
//
//  Created by 方进 on 2017/9/26.
//  Copyright © 2017年 方进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYUserAccount : NSObject<NSCoding>
@property (nonatomic, copy) NSString *balance;
@property (nonatomic, copy) NSString *cardNum;
@property (nonatomic, copy) NSString *userAccounts;
@property (nonatomic, copy) NSString *userEmail;
@property (nonatomic, copy) NSString *userIdentity;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userRealName;
@property (nonatomic, copy) NSString *userHead;
@end
