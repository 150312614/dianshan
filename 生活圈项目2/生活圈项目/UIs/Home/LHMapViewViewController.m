//
//  LHMapViewViewController.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHMapViewViewController.h"
#import "ZAnnotation.h"
#import "LHLocationManage.h"


@interface LHMapViewViewController ()<MKMapViewDelegate>

@property (nonatomic,strong) CLGeocoder *geocoder;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation LHMapViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%@",[[CLLocation alloc] initWithLatitude:37.001 longitude:122.4064]);
    
    
    
//    _mapView.delegate = self;
    NSLog(@"%@",self.location);
    CLLocation *location = self.location;
    [self.geocoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:37.001 longitude:122.4064]
      completionHandler:^(NSArray *placemarks, NSError *error)  {
//        if (placemarks.count <= 0) {
//            return ;
//        }
        CLPlacemark *sorceMark = placemarks.lastObject;
        ZAnnotation *sorcrAnnotation = [ZAnnotation annotationWithTitle:@"你的位置" subtitle:nil Coordinate:sorceMark.location.coordinate];
        [self.mapView addAnnotation:sorcrAnnotation];
        
        
        [self.geocoder geocodeAddressString:self.model.address completionHandler:^(NSArray *placemarks, NSError *error) {
            CLPlacemark *destinationMark = placemarks.lastObject;
            ZAnnotation *destAnnotation = [ZAnnotation annotationWithTitle:self.model.name subtitle:nil Coordinate:destinationMark.location.coordinate];
            [self.mapView addAnnotation:destAnnotation];
            
            [self navigationWithSorceMark:(CLPlacemark *)sorceMark andDestinationMark:(CLPlacemark *)destinationMark];
            
        }];
    }];
    
    
   
    
   
    
}

- (void)navigationWithSorceMark:(CLPlacemark *)sorceMark andDestinationMark:(CLPlacemark *)destinationMark
{
    
    MKMapItem *sourceItem = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithPlacemark:sorceMark]];
    
    MKMapItem *destinationItem = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithPlacemark:destinationMark]];
    
    [self.mapView setRegion:MKCoordinateRegionMake(destinationMark.location.coordinate, MKCoordinateSpanMake(0.1, 0.1)) animated:YES];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    
    request.source = sourceItem;
    request.destination = destinationItem;
    
    MKDirections *direstion = [[MKDirections alloc] initWithRequest:request];
    
    [direstion calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        
        
        MKRoute *route = response.routes[0];
//        for (MKRoute *route in response.routes)
//        {
//            
////            NSLog(@"名称：%@----距离：%f---时间：%f",route.name, route.distance / 1000,route.expectedTravelTime / 3600);
            for (MKRouteStep *step in route.steps)
            {
                
//                NSLog(@"%@ --- %@ --- %f",step.instructions,step.notice,step.distance / 1000);
                [self.mapView addOverlay:step.polyline];
            }
//        }
    }];
}

#pragma mark - MKMapViewDelegate

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.lineWidth = 5;
    
    CGFloat red = arc4random_uniform(255);
    CGFloat blue = arc4random_uniform(255);
    CGFloat green = arc4random_uniform(255);
    
    renderer.strokeColor = [UIColor colorWithRed:red / 255.0 green:blue / 255.0 blue:green / 255.0 alpha:1.0];
    
    return renderer;
}

#pragma  mark - getter & setter

- (CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}


-(void)backMethod
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
