//
//  FYRequestEntity.h
//  QingSongGo
//
//  Created by 方进 on 2017/9/25.
//  Copyright © 2017年 方进. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSuccessBlock)(id res, NSDictionary *options);

typedef void(^RequestFailBlock)(NSError *error, NSDictionary *options);

@interface FYRequestEntity : NSObject

- (void)requestWithSuccessBlock:(RequestSuccessBlock)successBlock failBlock:(RequestFailBlock)failBlock;

//- (void)uploadData:(NSData *)data successBlack:(RequestSuccessBlock)successBlock failBlock:(RequestFailBlock)failBlock;

@end
