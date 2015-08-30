//
//  ZAnnotation.m
//  08-自定义大头针
//
//  Created by 林彦佐 on 8/7/15.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ZAnnotation.h"


@implementation ZAnnotation

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle Coordinate:(CLLocationCoordinate2D)coordinate {
    
    if (self = [super init]) {
        self.title = title;
        self.subtitle = subtitle;
        self.coordinate = coordinate;
    }
    return self;
}

+ (ZAnnotation *)annotationWithTitle:(NSString *)title subtitle:(NSString *)subtitle Coordinate:(CLLocationCoordinate2D)coordinate {
    
    return [[ZAnnotation alloc] initWithTitle:title subtitle:subtitle Coordinate:coordinate];
}

@end
