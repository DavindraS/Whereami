//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Davindra Sutraban on 9/18/13.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate, title, subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subtitle:(NSString *)date
{
    self = [super init];
    if (self) {
        coordinate = c;
        [self setTitle:t];
        [self setSubtitle:date];
    }
    return self;
}

// Override the default initializer with our own
- (id)init
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate *d = [[NSDate alloc] init];
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown" subtitle:[dateFormatter stringFromDate:d]];
}

@end
