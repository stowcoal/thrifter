//
//  doodadDataController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "doodad.h"

@interface doodadDataController : NSObject
@property (nonatomic, copy)NSMutableArray *doodadList;
@property (nonatomic, copy)NSString *locationString;
-(id)initFromPList:(NSString *)locationString;

-(void)addDoodadToDoodadList:(doodad *)doodadToAdd;
-(void)removeDoodadAtIndexPath:(NSIndexPath *)indexPath;

-(doodad *)doodadAtIndexPath:(NSIndexPath *)indexPath;

-(void)writeToPList;
-(NSMutableArray *)readFromPList;
-(NSSet *)readStores;
@end
