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
        // Create the location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        // We want to be as accurate as possible
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // Set this viewcontroller as the delegate to CLLocationManager
        [locationManager setDelegate:self];
        
        // Tell our manager to start looking for its location immediately
        [locationManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations objectAtIndex:0]);
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

// Testing Testing 1 2 3

@end
