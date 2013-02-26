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
@property (nonatomic, copy)NSString *locationString;


-(id)initFromPList:(NSString *)locationString;

-(void)addFindToFindList:(Find *)findToAdd;
-(void)removeFindAtIndexPath:(NSIndexPath *)indexPath;

-(Find *)findAtIndexPath:(NSIndexPath *)indexPath;

-(void)writeToPList;
-(NSMutableArray *)readFinds;
-(NSMutableArray *)readStores;
@end
