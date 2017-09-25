//
//  FYRequestEntity.m
//  QingSongGo
//
//  Created by 方进 on 2017/9/25.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYRequestEntity.h"
#import "AFNetworking.h"
#import "YYModel.h"


@implementation FYRequestEntity

- (void)requestWithUrl:(NSString *)url andDic:(NSDictionary *)dic requestWithSuccessBlock:(RequestSuccessBlock)successBlock failBlock:(RequestFailBlock)failBlock{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    [manger POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *requestClassStr = NSStringFromClass(self.class);
        NSString *responseClassStr = [requestClassStr stringByReplacingOccurrencesOfString:@"Req" withString:@"Res"];
        Class reponseClass = NSClassFromString(responseClassStr);
        if (reponseClass) {
            id resObject = [reponseClass yy_modelWithJSON:responseObject];
            if (resObject) {
                successBlock(resObject, responseObject);
            }else{
                successBlock(nil,responseObject);
            }
        }else{
            successBlock(nil,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock(error,nil);
    }];
}
@end
