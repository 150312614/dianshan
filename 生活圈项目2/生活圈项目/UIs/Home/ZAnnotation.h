//
//  ZAnnotation.h
//  08-自定义大头针
//
//  Created by 林彦佐 on 8/7/15.
//  Copyright (c) 2015年 itcast. All rights reserved.
//
//  大头针数据模型

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ZAnnotation : NSObject <MKAnnotation>

/**
 *  大头针的位置
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
/**
 *  大头针标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  大头针的子标题
 */
@property (nonatomic, copy) NSString *subtitle;


- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle Coordinate:(CLLocationCoordinate2D)coordinate;
+ (ZAnnotation *)annotationWithTitle:(NSString *)title subtitle:(NSString *)subtitle Coordinate:(CLLocationCoordinate2D)coordinate;

@end
