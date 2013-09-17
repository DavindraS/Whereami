//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Davindra Sutraban on 9/17/13.
//  Copyright (c) 2013 Davindra Sutraban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@end
