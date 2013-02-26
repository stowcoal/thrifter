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
-(BOOL)isEqual:(Store *)other
{
    return _city == other.city && _name == other.name;
}

@end