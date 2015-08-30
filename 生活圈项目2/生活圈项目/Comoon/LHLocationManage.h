//
//  LHLocationManage.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/12.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^successLocationBlock)(CLLocation *locat);
typedef void(^failedLocationBlock)(NSError *error);

@interface LHLocationManage : NSObject

+ (instancetype)shareInstance;

+ (void)getLocationSuccess:(successLocationBlock)successLocationBlock
                    failed:(failedLocationBlock)failedLocationBlock;

@end
