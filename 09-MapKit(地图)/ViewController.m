//
//  ViewController.m
//  09-MapKit(地图)
//
//  Created by  hzy on 2017/4/13.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>
@property(nonatomic,strong)MKMapView *mapView;//地图
@property(nonatomic,strong)CLLocationManager *locationM;//定位管理者


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //定位授权
    [self requestUserLocationAuthor];
    //地图
    [self creatMapView];
    
    
}

- (void)requestUserLocationAuthor{
    //如果没有获得定位授权，获取定位授权请求
    self.locationM = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]) {
        if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
            [self.locationM requestWhenInUseAuthorization];
        }
    }
}

- (void)creatMapView{
    //创建MKMapView
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(10,60,300,400)];
    //设置地图类型
    mapView.mapType = MKMapTypeStandard;
    //设置代理
    mapView.delegate = self;
    //属性设置
    mapView.showsUserLocation=YES;
    mapView.showsTraffic=YES;
    mapView.showsCompass=YES;
    mapView.showsScale=YES;
    
    [self.view addSubview:mapView];
    self.mapView = mapView;
}

#pragma mark - MKMapViewDelegate
/* 更新用户位置会调用 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocation *location = userLocation.location;
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"经度：%f，纬度：%f",coordinate.latitude,coordinate.longitude);
}



@end
