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
        _findKey = [[[self findList] lastObject] key];
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
    if ([[self storeList] lastObject])
        storeToAdd.key = [self StoreKey];
    else
        storeToAdd.key = [NSNumber numberWithInteger:0];
    [_storeList addObject:storeToAdd];
    [self writeStores];
}
-(void)removeFindAtIndexPath:(NSIndexPath *)indexPath
{
    [_findList removeObjectAtIndex:indexPath.row];
    [self writeFinds];
}
-(void)removeStoreAtIndexPath:(NSIndexPath *)indexPath
{
    [_storeList removeObjectAtIndex:indexPath.row];
    [self writeStores];
}
-(Find *)findAtIndexPath:(NSIndexPath *)indexPath
{
    return [_findList objectAtIndex:[indexPath row]];
}
-(Store *)storeAtIndexPath:(NSIndexPath *)indexPath
{
    return [_storeList objectAtIndex:[indexPath row]];
}
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
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:f.name, @"name", f.cost, @"cost", f.date, @"date", f.storeKey, @"store", f.description, @"description", f.picture, @"picture", f.key, @"key", nil];
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
        if (s.name != NULL && s.city != NULL)
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
            Find *f = [[Find alloc] initWithDataAndKey:[findDictionary objectForKey:@"name"] cost:[findDictionary objectForKey:@"cost"] date:[findDictionary objectForKey:@"date"] store:[findDictionary objectForKey:@"store"] description:[findDictionary objectForKey:@"description"] picture:[findDictionary objectForKey:@"picture"] key:[findDictionary objectForKey:@"key"]];
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
            Store *storeToAdd = [[Store alloc] initWithDataAndKey:[findDictionary objectForKey:@"name"] city:[findDictionary objectForKey:@"city"] key:[findDictionary objectForKey:@"key"]];
            [stores addObject:storeToAdd];
        }
    }
    _storeList = stores;
}
-(Store *)storeForFind:(Find *)find
{
    Store *s = [[Store alloc] init];
    NSEnumerator *storeEnumerator = [[self storeList] objectEnumerator];
    while ( s = [storeEnumerator nextObject])
    {
        if( s.key == find.storeKey)
        {
            return s;
        }
    }
    return nil;
}
-(Store *)storeForKey:(NSNumber *)key
{
    Store *s = [[Store alloc] init];
    NSEnumerator *storeEnumerator = [[self storeList] objectEnumerator];
    while ( s = [storeEnumerator nextObject])
    {
        if( s.key == key)
        {
            return s;
        }
    }
    return s;
}
-(Find *)findForKey:(NSNumber *)key
{
    Find *f = [[Find alloc] init];
    NSEnumerator *findEnumerator = [[self findList] objectEnumerator];
    while ( f = [findEnumerator nextObject])
    {
        if( f.key == key)
        {
            return f;
        }
    }
    return f;
}
-(NSNumber *)FindKey
{
    if ([[self findList] lastObject])
        _findKey = [NSNumber numberWithInteger:_findKey.integerValue + 1];
    else
        _findKey = [NSNumber numberWithInteger:0];
    return _findKey;
}
-(NSNumber *)StoreKey
{
    if ([[self findList] lastObject])
        _storeKey = [NSNumber numberWithInteger:_storeKey.integerValue + 1];
    else
        _storeKey = [NSNumber numberWithInteger:0];
    return _storeKey;
}
@end
