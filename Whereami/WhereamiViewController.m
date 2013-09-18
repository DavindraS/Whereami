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
    
    return self;
}

- (void)viewDidLoad
{
    // Create location manager object
    locationManager = [[CLLocationManager alloc] init];
    
    // Set this object to be the delegate for the CLLocationManager
    [locationManager setDelegate:self];
    
    // Set the desired accuracy to be the most accurate
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    // BRONZE CHALLENGE: Change the CLLocationManager so that it only updates its delegate with a new location
    // if the device has moved more than 50 meters
    [locationManager setDistanceFilter:50];
    
    // SILVER CHALLENGE: Tell the location manager to start updating the heading
    [locationManager startUpdatingHeading];
    
    // Tell the manager to start looking for its location immediately
    [locationManager startUpdatingLocation];
    
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
