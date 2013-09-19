//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Davindra Sutraban on 9/17/13.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@implementation WhereamiViewController

- (void)viewDidLoad
{
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    // Action for when a segment is clicked
    [segCont addTarget:self action:@selector(didChangeSegment) forControlEvents:UIControlEventValueChanged];
    
    // MKMapView determines location
    [worldView setShowsUserLocation:YES];
}

// Method locationManager:didUpdateToLocation:fromLocation is deprecated
// Replaced by locationManager:didUpdateLocations
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [[locations objectAtIndex:([locations count] - 1)] description]);
    
    // How many seconds ago was this new location created?
    CLLocation *c = [locations objectAtIndex:([locations count] - 1)];
    NSTimeInterval t = [[c timestamp] timeIntervalSinceNow];
    
    // If the locaiton was made more than 3 minutes ago, ignore it.
    if (t < -180) {
        // This is cached data, keep looking
        return;
    }
    
    [self foundLocation:c];
    
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

// Delegate method that gets called when the mapView has found the users location
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

// UITextField delegate protocol method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // When you finished typing
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    // Gold Challenge: Create a DateFormatter to show the date in the annotation
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    // Create an instance of BNRMapPoint with current data
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text] subtitle:[formatter stringFromDate:[loc timestamp]]];
    
    // Add the BNRMapPoint to the worldView
    [worldView addAnnotation:mp];
    
    // Zoom to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    // Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

- (void)didChangeSegment
{
    
    if ([segCont selectedSegmentIndex] == 0) {
        
        [worldView setMapType:MKMapTypeStandard];
    }
    else if([segCont selectedSegmentIndex] == 1){
        
        [worldView setMapType:MKMapTypeSatellite];
    }
    else if([segCont selectedSegmentIndex] == 2){
        
        [worldView setMapType:MKMapTypeHybrid];
    }
}

@end
