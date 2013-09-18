//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Davindra Sutraban on 9/17/13.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@end
