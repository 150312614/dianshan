//
//  LHFunction.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/11.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHFunction : NSObject


//时间戳
+ (NSString *)getTimeScamp;

//MD5
+ (NSString *)md5StringFromArray:(NSArray *)array;

//存取BOOL数据
+ (BOOL)getBoolWith:(NSString *)key;
+ (void)saveBoolWith:(BOOL)Bool forKey:(NSString *)key;


+ (CGFloat)hightForText:(NSString *)text andFontSize:(CGFloat)texteSize;

+(BOOL)getBoolForKey:(NSString *)str;

+ (id)getObjectValueFromKey:(NSString *)key;

+ (void)saveObjectValue:(id)object withKey:(NSString *)key;

+ (void)saveUserInfo:(NSDictionary *)dic;
@end
