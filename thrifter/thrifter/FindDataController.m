//
//  doodadDataController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "FindDataController.h"

@implementation FindDataController
- (id)init {
    if (self = [super init]) {
        _findList = [[NSMutableArray alloc] init];
        return self;
    }
    return nil;
}
-(id)initFromPList:(NSString *)locationString
{
    if (self = [super init]) {
        _locationString = locationString;
        _findList = [self readFromPList];
        return self;
    }
    return nil;
}
-(void)addFindToFindList:(Find *)findToAdd
{
    [_findList addObject:findToAdd];
    [self writeToPList];
}
-(void)removeFindAtIndexPath:(NSIndexPath *)indexPath
{
    [_findList removeObjectAtIndex:indexPath.row];
    [self writeToPList];
}
-(Find *)findAtIndexPath:(NSIndexPath *)indexPath
{
    return [_findList objectAtIndex:[indexPath row]];
}
-(void)writeToPList
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_locationString];
    NSMutableArray  *array = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [_findList objectEnumerator];
    Find *f;
    while ( f = [enumerator nextObject])
    {
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:f.name, @"name", f.cost, @"cost", f.date, @"date", f.store.name, @"store", f.store.city, @"city", f.description, @"description", nil];
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
        NSDictionary *findDictionary = [[NSDictionary alloc] init];
        while ( findDictionary = [enumerator nextObject])
        {
            Find *f = [[Find alloc] initWithData:[findDictionary objectForKey:@"name"] cost:[findDictionary objectForKey:@"cost"] date:[findDictionary objectForKey:@"date"] store:[findDictionary objectForKey:@"store"] city:[findDictionary objectForKey:@"city"] description:[findDictionary objectForKey:@"description"]];
            [returnArray addObject:f];
        }
    }
    return returnArray;
}
-(NSMutableArray *)readStores
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_locationString];
    NSMutableArray *stores = [[NSMutableArray alloc] init];
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        NSArray *readArray = [NSArray arrayWithContentsOfFile:plistPath];
        NSDictionary *findDictionary = [[NSDictionary alloc] init];
        NSEnumerator *readEnumerator = [readArray objectEnumerator];
        while( findDictionary = [readEnumerator nextObject] )
        {
            SStore *storeToAdd = [[SStore alloc] initWithData:[findDictionary objectForKey:@"store"] city:[findDictionary objectForKey:@"city"]];
            NSEnumerator *storesEnumerator = [stores objectEnumerator];
            SStore *s = [[SStore alloc] init];
            BOOL found = NO;
            while ( (s = [storesEnumerator nextObject]) && !found)
                found = [s isEqual:storeToAdd];
            if (!found)
                [stores addObject:storeToAdd];
        }
    }
    return stores;
}

@end
