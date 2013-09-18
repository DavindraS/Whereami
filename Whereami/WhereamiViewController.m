//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Davindra Sutraban on 9/17/13.
//

#import "WhereamiViewController.h"

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    }
    return self;
}

- (void)viewDidLoad
{
    // MKMapView determines location
    [worldView setShowsUserLocation:YES];
}

// Method locationManager:didUpdateToLocation:fromLocation is deprecated
// Replaced by locationManager:didUpdateLocations
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [[locations objectAtIndex:([locations count] - 1)] description]);
}

// SILVER CHALLENGE: Using delegation, retrieve the heading information from the CLLocationManager
// and print it to the console
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"%@", newHeading);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void)dealloc
{
    [locationManager setDelegate:nil];
}

@end
