//
//  Category.m
//  thrifter
//
//  Created by CURTIS STOCHL on 3/28/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "Category.h"

@implementation Category
-(id)initWithDataAndKey:(NSString *)name key:(NSNumber *)key
{
    self = [super init];
    if (self)
    {
        _name = name;
        _key = key;
        return self;
    }
    return nil;
}
@end
