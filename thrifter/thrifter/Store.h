//
//  store.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/19/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
@property (nonatomic, strong)NSNumber *key;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *city;
@property (nonatomic, strong)NSString *mondayTime;
@property (nonatomic, strong)NSString *tuesdayTime;
@property (nonatomic, strong)NSString *wednesdayTime;
@property (nonatomic, strong)NSString *thursdayTime;
@property (nonatomic, strong)NSString *fridayTime;
@property (nonatomic, strong)NSString *saturdayTime;
@property (nonatomic, strong)NSString *sundayTime;
-(id)initWithData:(NSString *)name city:(NSString *)city;
-(id)initWithDataAndKey:(NSString *)name city:(NSString *)city key:(NSNumber *)key;
-(id)initWithDataAndKeyAndHours:(NSString *)name city:(NSString *)city key:(NSNumber *)key mondayTime:(NSString *)monday tuesdayTime:(NSString *)tuesday wednesdayTime:(NSString *)wednesday thursdayTime:(NSString *)thursday fridayTime:(NSString *)friday saturdayTime:(NSString *)saturday sundayTime:(NSString *)sunday;
-(BOOL)isEqual:(id)other;
@end
