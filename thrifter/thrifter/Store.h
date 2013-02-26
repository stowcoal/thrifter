//
//  store.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/19/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *city;
-(id)initWithData:(NSString *)name city:(NSString *)city;
-(BOOL)isEqual:(id)other;
@end
