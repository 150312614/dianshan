//
//  LHHTTPClient.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/12.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^successBlock)(id data);

typedef void(^failedBlock)(NSError *error);

typedef void(^errorBlock)(id error);

@interface LHHTTPClient : AFHTTPSessionManager


+ (instancetype)shareInstance;


+ (void)LHGET:(NSString *)urlStr
   parameters:(NSDictionary *)param
      successBlcok:(successBlock)success
      failureBlcok:(failedBlock)failure
        errorBlcok:(errorBlock)error;

+ (void)LHPOST:(NSString *)urlStr
   parameters:(NSDictionary *)param
 successBlcok:(successBlock)success
 failureBlcok:(failedBlock)failure
   errorBlcok:(errorBlock)error;


@end
