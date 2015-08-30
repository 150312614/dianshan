//
//  LHHTTPClient.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/12.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHHTTPClient.h"

@implementation LHHTTPClient

//单列
+ (instancetype)shareInstance
{
    static LHHTTPClient *client = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    });
    return client;
}



//get请求
+ (void)LHGET:(NSString *)urlStr
   parameters:(NSDictionary *)param
 successBlcok:(successBlock)success
 failureBlcok:(failedBlock)failure
   errorBlcok:(errorBlock)error
{
    [[self shareInstance] GET:urlStr parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"success"]) {
            success(responseObject);
        }
        else if([responseObject[@"status"] isEqualToString:@"error"])
        {
            error(@"请求失败，请稍后在试");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}
//post请求
+ (void)LHPOST:(NSString *)urlStr
   parameters:(NSDictionary *)param
 successBlcok:(successBlock)success
 failureBlcok:(failedBlock)failure
   errorBlcok:(errorBlock)error
{
    [[self shareInstance] POST:urlStr parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"success"]) {
            success(responseObject);
        }
        else if([responseObject[@"status"] isEqualToString:@"error"])
        {
            error(@"请求失败，请稍后在试");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
