//
//  LHFunction.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/11.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHFunction.h"
#import "MD5.h"

@implementation LHFunction

//时间戳
+ (NSString *)getTimeScamp
{
    return [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];
}

//MD5
+ (NSString *)md5StringFromArray:(NSArray *)array
{
    NSMutableString *restr = [NSMutableString string];
    
    [array enumerateObjectsUsingBlock:^(NSString *str, NSUInteger idx, BOOL *stop)
    {
        [restr appendString:str];
    }];
    
    return [MD5 MD5Encrypt:restr];
}

//存取BOOL数据
+ (BOOL)getBoolWith:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}
+ (void)saveBoolWith:(BOOL)Bool forKey:(NSString *)key
{
    if (key == nil || [key isEqualToString:@""])
    {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setBool:Bool forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
   

}

+ (CGFloat)hightForText:(NSString *)text andFontSize:(CGFloat)texteSize
{
   return [text boundingRectWithSize:CGSizeMake(kUIScreenWidth - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:texteSize]} context:nil].size.height;
}

+(BOOL)getBoolForKey:(NSString *)str
{
    if (str != nil) {
        return [[NSUserDefaults standardUserDefaults] boolForKey:str];
    }else {
        
        return NULL;
        
    }
}

+ (void)saveObjectValue:(id)object withKey:(NSString *)key{
    
    if (key != nil) {
        [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
    
}

+ (id)getObjectValueFromKey:(NSString *)key{
    
    if (key != nil) {
        return [[NSUserDefaults standardUserDefaults]objectForKey:key];
    }else
        //return nil;
        return NULL;
}

+ (void)saveUserInfo:(NSDictionary *)dic{
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"user.info"];
    
    [dic writeToFile:path atomically:YES];
    
}
@end
