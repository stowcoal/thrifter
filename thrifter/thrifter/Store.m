//
//  store.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/19/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "Store.h"

@implementation Store
-(id)initWithData:(NSString *)name city:(NSString *)city
{
    self = [super init];
    if (self)
    {
        _name = name;
        _city = city;
        return self;
    }
    return nil;
}
-(id)initWithDataAndKey:(NSString *)name city:(NSString *)city key:(NSNumber *)key
{
    self = [super init];
    if (self)
    {
        _name = name;
        _city = city;
        _key = key;
        return self;
    }
    return nil;
}
-(id)initWithDataAndKeyAndHours:(NSString *)name city:(NSString *)city key:(NSNumber *)key mondayTime:(NSString *)monday tuesdayTime:(NSString *)tuesday wednesdayTime:(NSString *)wednesday thursdayTime:(NSString *)thursday fridayTime:(NSString *)friday saturdayTime:(NSString *)saturday sundayTime:(NSString *)sunday
{
    self = [super init];
    if (self)
    {
        _name = name;
        _city = city;
        _mondayTime = monday;
        _tuesdayTime = tuesday;
        _wednesdayTime = wednesday;
        _thursdayTime = thursday;
        _fridayTime = friday;
        _saturdayTime = saturday;
        _sundayTime = sunday;
        _key = key;

        return self;
    }
    return nil;
}
-(BOOL)isEqual:(Store *)other
{
    return _key == other.key;
}

@end
