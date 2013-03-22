//
//  doodad.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Store.h"

@interface Find : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *cost;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSNumber *key;
@property (nonatomic, copy) NSNumber *storeKey;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSData *picture;
@property (nonatomic, copy) NSString *category;
-(id)initWithName:(NSString *)name cost:(NSNumber *)cost date:(NSDate *)date;
-(id)initWithDataAndKey:(NSString *)name cost:(NSNumber *)cost date:(NSDate *)date store:(NSNumber *)storeKey description:(NSString *)description picture:(NSData *)picture key:(NSNumber *)key;
@end
