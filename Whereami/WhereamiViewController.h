//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Davindra Sutraban on 9/17/13.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    IBOutlet UISegmentedControl *segCont;
}

- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;
- (void)didChangeSegment;

@end
