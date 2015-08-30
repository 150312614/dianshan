//
//  LHMapViewViewController.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHNavBaseViewController.h"
#import "LHShopDetailModel.h"
#import <MapKit/MapKit.h>

@interface LHMapViewViewController : LHNavBaseViewController


@property (nonatomic,strong) LHShopDetailModel *model;

@property (nonatomic,strong) CLLocation *location;



@end
