//
//  Category.h
//  thrifter
//
//  Created by CURTIS STOCHL on 3/28/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject
@property (nonatomic, copy)NSNumber *key;
@property (nonatomic, copy)NSString *name;
-(id)initWithDataAndKey:(NSString *)category key:(NSNumber *)key;
@end
