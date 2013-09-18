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
