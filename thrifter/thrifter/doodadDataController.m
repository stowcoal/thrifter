//
//  doodadDataController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "doodadDataController.h"

@implementation doodadDataController
- (id)init {
    if (self = [super init]) {
        _doodadList = [[NSMutableArray alloc] init];
        return self;
    }
    return nil;
}
-(void)addDoodadToDoodadList:(doodad *)doodadToAdd
{
    [_doodadList addObject:doodadToAdd];
}
-(doodad *)doodadAtIndexPath:(NSIndexPath *)indexPath
{
    return [_doodadList objectAtIndex:[indexPath row]];
}

@end
