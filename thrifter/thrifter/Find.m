//
//  doodad.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "Find.h"

@implementation Find
-(id) initWithName:(NSString *)name cost:(NSNumber *)cost date:(NSDate *)date
{
    self = [super init];
    if (self)
    {
        _name = name;
        _cost = cost;
        _date = date;
        return self;
    }
    return nil;
}
-(id)initWithDataAndKey:(NSString *)name cost:(NSNumber *)cost date:(NSDate *)date store:(NSNumber *)storeKey description:(NSString *)description picture:(NSData *)picture key:(NSNumber *)key category:(NSNumber *)categoryKey
{
    self = [super init];
    if (self)
    {
        _name = name;
        _cost = cost;
        _date = date;
        _key = key;
        _storeKey = storeKey;
        _description = description;
        _picture = picture;
        _categoryKey = categoryKey;
        return self;
    }
    return nil;
}

@end
