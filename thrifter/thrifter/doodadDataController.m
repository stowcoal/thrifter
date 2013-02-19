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
-(id)initFromPList:(NSString *)locationString
{
    if (self = [super init]) {
        _locationString = locationString;
        _doodadList = [self readFromPList];
        return self;
    }
    return nil;
}
-(void)addDoodadToDoodadList:(doodad *)doodadToAdd
{
    [_doodadList addObject:doodadToAdd];
    [self writeToPList];
}
-(void)removeDoodadAtIndexPath:(NSIndexPath *)indexPath
{
    [_doodadList removeObjectAtIndex:indexPath.row];
    [self writeToPList];
}
-(doodad *)doodadAtIndexPath:(NSIndexPath *)indexPath
{
    return [_doodadList objectAtIndex:[indexPath row]];
}
-(void)writeToPList
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_locationString];
    NSMutableArray  *array = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [_doodadList objectEnumerator];
    doodad *d;
    while ( d = [enumerator nextObject])
    {
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:d.name, @"name", d.cost, @"cost", d.date, @"date", d.store.Name, @"store", d.store.City, @"city", d.description, @"description", nil];
        [array addObject:tempDictionary];
    }
    [array writeToFile:plistPath atomically:YES];
}
-(NSMutableArray *)readFromPList
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_locationString];
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        NSArray *readArray = [NSArray arrayWithContentsOfFile:plistPath];
        NSEnumerator *enumerator = [readArray objectEnumerator];
        NSDictionary *doodadDictionary = [[NSDictionary alloc] init];
        while ( doodadDictionary = [enumerator nextObject])
        {
            doodad *d = [[doodad alloc] initWithData:[doodadDictionary objectForKey:@"name"] cost:[doodadDictionary objectForKey:@"cost"] date:[doodadDictionary objectForKey:@"date"] store:[doodadDictionary objectForKey:@"store"] city:[doodadDictionary objectForKey:@"city"] description:[doodadDictionary objectForKey:@"description"]];
            [returnArray addObject:d];
        }
    }
    return returnArray;
}
-(NSSet *)readStores
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_locationString];
    NSSet *stores = [[NSSet alloc] init];
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        NSArray *readArray = [NSArray arrayWithContentsOfFile:plistPath];
        NSDictionary *doodadDictionary = [[NSDictionary alloc] init];
        NSEnumerator *enumerator = [readArray objectEnumerator];
        while( doodadDictionary = [enumerator nextObject] )
        {
            stores = [stores setByAddingObject:[[store alloc] initWithData:[doodadDictionary objectForKey:@"store"] city:[doodadDictionary objectForKey:@"city"]]];
        }
    }
    return stores;
}

@end
