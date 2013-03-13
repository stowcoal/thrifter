//
//  doodadDataController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Find.h"

@interface DataController : NSObject
@property (nonatomic, copy)NSMutableArray *findList;
@property (nonatomic, copy)NSMutableArray *storeList;
@property (nonatomic, copy)NSString *findFileString;
@property (nonatomic, copy)NSString *storeFileString;

-(id)initFromPList:(NSString *)findLocationString storeLocationString:(NSString *)storeLocationString;

-(void)addFindToFindList:(Find *)findToAdd;
-(void)addStoreToStoreList:(Store *)storeToAdd;
-(void)removeFindAtIndexPath:(NSIndexPath *)indexPath;

-(Find *)findAtIndexPath:(NSIndexPath *)indexPath;
-(Store *)storeAtIndexPath:(NSIndexPath *)indexPath;

-(Store *)storeForFind:(Find *)find;
-(Store *)storeForKey:(NSNumber *)key;

-(void)readFinds;
-(void)readStores;

@end
