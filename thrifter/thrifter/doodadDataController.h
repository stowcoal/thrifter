//
//  doodadDataController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>
@class doodad;

@interface doodadDataController : NSObject
@property (nonatomic, copy) NSMutableArray *doodadList;
-(void)addDoodadToDoodadList:(doodad *)doodadToAdd;
-(doodad *)doodadAtIndexPath:(NSIndexPath *) indexPath;

@end
