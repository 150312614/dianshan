//
//  LHLocationManage.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/12.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHLocationManage.h"

@interface LHLocationManage ()<CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *manager;

@property (nonatomic,copy) successLocationBlock sBlock;

@property (nonatomic,copy) failedLocationBlock fBlock;

@property (nonatomic, assign) BOOL flag;
@end

@implementation LHLocationManage

- (instancetype)init
{
    if (self = [super init])
    {
        _manager = [[CLLocationManager alloc] init];
        
        if ([_manager respondsToSelector:@selector(requestAlwaysAuthorization)])
        {
            [_manager requestAlwaysAuthorization];
            [_manager requestWhenInUseAuthorization];
        }
        _manager.delegate = self;
    }
    return self;
}

+ (instancetype)shareInstance
{
    
    static LHLocationManage *man = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        man = [[LHLocationManage alloc] init];
    });
    
    return man;
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusDenied)
    {
        
        _fBlock(nil);
        [self.manager stopUpdatingLocation];
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (self.flag)
    {
        return;
    }
    CLLocation *location = [locations lastObject];
    _sBlock(location);
    self.flag = YES;
    
    [self.manager stopUpdatingLocation];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    _fBlock(error);
    [self.manager stopUpdatingLocation];
}



#pragma mark - 回调方法
+ (void)getLocationSuccess:(successLocationBlock)successLocationBlock
                    failed:(failedLocationBlock)failedLocationBlock
{
    
    return [[self shareInstance] getLocationSuccess:successLocationBlock failed:failedLocationBlock];
    
}

- (void)getLocationSuccess:(successLocationBlock)successLocationBlock
                failed:(failedLocationBlock)failedLocationBlock
{
    _sBlock = successLocationBlock;
    
    _fBlock = failedLocationBlock;
    
    [_manager startUpdatingLocation];
    
}

@end
