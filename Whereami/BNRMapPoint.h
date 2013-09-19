//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Davindra Sutraban on 9/18/13.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>
{
}

// Designated initializer for instances of BNRMapPoint
- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

// Required property for MKAnnotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// Optional property for MKAnnotation
@property (nonatomic, copy) NSString *title;

@end
