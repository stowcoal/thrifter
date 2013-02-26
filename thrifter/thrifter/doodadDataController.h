//
//  doodadDataController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doodad.h"

@interface doodadDataController : NSObject
@property (nonatomic, copy)NSMutableArray *doodadList;
@property (nonatomic, copy)NSString *locationString;
-(id)initFromPList:(NSString *)locationString;

-(void)addDoodadToDoodadList:(Doodad *)doodadToAdd;
-(void)removeDoodadAtIndexPath:(NSIndexPath *)indexPath;

-(Doodad *)doodadAtIndexPath:(NSIndexPath *)indexPath;

-(void)writeToPList;
-(NSMutableArray *)readFromPList;
-(NSMutableArray *)readStores;
@end
