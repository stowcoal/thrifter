//
//  doodadDataController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "doodadDataController.h"

@implementation doodadDataController
-(void)addDoodadToDoodadList:(doodad *)doodadToAdd
{
    [self.doodadList addObject:doodadToAdd];
}
-(doodad *)doodadAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self doodadList] objectAtIndex:[indexPath row]];
}

@end
