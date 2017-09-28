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


- (void)requestWithSuccessBlock:(RequestSuccessBlock)successBlock failBlock:(RequestFailBlock)failBlock{
    NSString *strServerUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"FYServerURL"];
    NSMutableDictionary *params = [self yy_modelToJSONObject];
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    UIWindow * window = [UIApplication sharedApplication].keyWindow ;
    
    [MBProgressHUD showHUDAddedTo:window animated:YES];
    [manger POST:strServerUrl parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"*********%@",jsonString);
        
        NSString *requestClassStr = NSStringFromClass(self.class);
        NSString *responseClassStr = [requestClassStr stringByReplacingOccurrencesOfString:@"FYRequest" withString:@"FYResponse"];
        id reponseClass = NSClassFromString(responseClassStr);
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
        [MBProgressHUD hideAllHUDsForView:window animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideAllHUDsForView:window animated:YES];
        failBlock(error,nil);
    }];
}
@end
