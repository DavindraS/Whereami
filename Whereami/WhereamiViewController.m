//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Davindra Sutraban on 9/17/13.
//  Copyright (c) 2013 Davindra Sutraban. All rights reserved.
//

#import "WhereamiViewController.h"

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        // Create location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        // Set the desired accuracy to be the most accurate
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // Tell the manager to start looking for its location immediately
        [locationManager startUpdatingLocation];
    }
    
    return self;
}

// Since the method in the book has been deprecated. Docs say to use this method
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    // The locations array will have CLLocation objects in it
    // I get the most recent location (at the end of the array)
    // and get it's description
    NSLog(@"%@", [[locations objectAtIndex:[locations count]] description]);
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
