//
//  store.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/19/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "store.h"

@implementation store
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
-(BOOL)isEqual:(store *)other
{
    return _city == other.City && _name == other.Name;
}
-(NSString *)City
{
    return _city;
}
-(NSString *)Name
{
    return _name;
}

@end
