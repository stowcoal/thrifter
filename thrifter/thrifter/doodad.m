//
//  doodad.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "doodad.h"

@implementation doodad
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


@end
