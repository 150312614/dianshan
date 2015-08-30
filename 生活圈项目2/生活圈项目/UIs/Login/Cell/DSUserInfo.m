//
//  DSUserInfo.m
//  DS04
//
//  Created by Ricky on 15/7/2.
//  Copyright (c) 2015年 Ricky. All rights reserved.
//

#import "DSUserInfo.h"

@interface DSUserInfo ()

@end

@implementation DSUserInfo

+ (instancetype)shareInatance{
    
    static DSUserInfo *user = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[DSUserInfo alloc]init];
        user.isLogin = NO;
    });
    
    return user;
}

- (void)instanceWithDictionary:(NSDictionary *)dic{
    
    if ([dic isKindOfClass:[NSDictionary class]]) {
        
        //在这里保存也行
        
        self.user_id = dic[@"user_id"];
        self.info = dic[@"info"];
        self.mobile = dic[@"mobile"];
        self.remember_me = dic[@"remember_me"];
        self.nick_name = dic[@"nick_name"];
        self.small_avatar = dic[@"small_avatar"];
        self.middle_avatar = dic[@"middle_avatar"];
        self.user_name = dic[@"user_name"];
        self.gender = dic[@"gender"];
        self.isLogin = YES;
    }
    
}


@end
