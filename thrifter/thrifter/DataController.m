//
//  doodadDataController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "DataController.h"

@implementation DataController
- (id)init {
    if (self = [super init]) {
        _findList = [[NSMutableArray alloc] init];
        return self;
    }
    return nil;
}
-(id)initFromPList:(NSString *)find storeLocationString:(NSString *)store
{
    if (self = [super init]) {
        _findFileString = find;
        [self readFinds];
        _storeFileString = store;
        [self readStores];
        return self;
    }
    return nil;
}
-(void)addFindToFindList:(Find *)findToAdd
{
    [_findList addObject:findToAdd];
    [self writeFinds];
}
-(void)addStoreToStoreList:(Store *)storeToAdd
{
    storeToAdd.key = [NSNumber numberWithInteger:((Store *)[_storeList lastObject]).key.integerValue + 1];
    [_storeList addObject:storeToAdd];
    [self writeStores];
}
-(void)removeFindAtIndexPath:(NSIndexPath *)indexPath
{
    [_findList removeObjectAtIndex:indexPath.row];
    [self writeFinds];
}
-(Find *)findAtIndexPath:(NSIndexPath *)indexPath
{
    return [_findList objectAtIndex:[indexPath row]];
}
-(Store *)storeAtIndexPath:(NSIndexPath *)indexPath
{
    return [_storeList objectAtIndex:[indexPath row]];
}
/*
-(void)writeToPList
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *findsPlistPath = [documentsDirectory stringByAppendingPathComponent:_locationString];
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
*/
-(void)writeFinds
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_findFileString];
    NSMutableArray  *array = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [_findList objectEnumerator];
    Find *f;
    while ( f = [enumerator nextObject])
    {
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:f.name, @"name", f.cost, @"cost", f.date, @"date", f.storeKey, @"store", f.description, @"description", nil];
        [array addObject:tempDictionary];
    }
    [array writeToFile:plistPath atomically:YES];
}
-(void)writeStores
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_storeFileString];
    NSMutableArray  *array = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [_storeList objectEnumerator];
    Store *s;
    while ( s = [enumerator nextObject])
    {
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:s.key, @"key", s.name, @"name", s.city, @"city", nil];
        [array addObject:tempDictionary];
    }
    [array writeToFile:plistPath atomically:YES];
}
-(void)readFinds
{
    NSMutableArray *finds = [[NSMutableArray alloc] init];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_findFileString];
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        NSArray *readArray = [NSArray arrayWithContentsOfFile:plistPath];
        NSEnumerator *enumerator = [readArray objectEnumerator];
        NSDictionary *findDictionary = [[NSDictionary alloc] init];
        while ( findDictionary = [enumerator nextObject])
        {
            Find *f = [[Find alloc] initWithData:[findDictionary objectForKey:@"name"] cost:[findDictionary objectForKey:@"cost"] date:[findDictionary objectForKey:@"date"] store:[findDictionary objectForKey:@"store"] description:[findDictionary objectForKey:@"description"]];
            [finds addObject:f];
        }
    }
    _findList = finds;
}
-(void)readStores
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_storeFileString];
    NSMutableArray *stores = [[NSMutableArray alloc] init];
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        NSArray *readArray = [NSArray arrayWithContentsOfFile:plistPath];
        NSDictionary *findDictionary = [[NSDictionary alloc] init];
        NSEnumerator *readEnumerator = [readArray objectEnumerator];
        while( findDictionary = [readEnumerator nextObject] )
        {
            Store *storeToAdd = [[Store alloc] initWithDataAndKey:[findDictionary objectForKey:@"store"] city:[findDictionary objectForKey:@"city"] key:[findDictionary objectForKey:@"key"]];
            [stores addObject:storeToAdd];
        }
    }
    _storeList = stores;
}


@end
