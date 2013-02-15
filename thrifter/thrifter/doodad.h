//
//  doodad.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface doodad : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *cost;
@property (nonatomic, strong) NSDate *date;
-(id)initWithName:(NSString *)name cost:(NSNumber *)cost date:(NSDate *)date;

@end
