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
-(id)initFromPList:(NSString *)find storeLocationString:(NSString *)store categoryLocationString:(NSString *)category
{
    if (self = [super init]) {
        _findFileString = find;
        [self readFinds];
        _storeFileString = store;
        [self readStores];
        _categoryFileString = category;
        [self readCategories];
        return self;
    }
    return nil;
}
-(void)refresh
{
    [self readFinds];
    [self readStores];
    [self readCategories];
}
-(void)addFindToFindList:(Find *)findToAdd
{
    [_findList addObject:findToAdd];
    [self writeFinds];
}
-(void)addStoreToStoreList:(Store *)storeToAdd
{
    [_storeList addObject:storeToAdd];
    [self writeStores];
}
-(void)addCategoryToCategoryList:(Category *)categoryToAdd
{
    [_categoryList addObject:categoryToAdd];
    [self writeCategories];
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
-(void)removeCategoryAtIndexPath:(NSIndexPath *)indexPath
{
    [_categoryList removeObjectAtIndex:indexPath.row];
    [self writeCategories];
}
-(Find *)findAtIndexPath:(NSIndexPath *)indexPath
{
    return [_findList objectAtIndex:[indexPath row]];
}
-(Store *)storeAtIndexPath:(NSIndexPath *)indexPath
{
    return [_storeList objectAtIndex:[indexPath row]];
}
-(Category *)categoryAtIndexPath:(NSIndexPath *)indexPath
{
    return [_categoryList objectAtIndex:[indexPath row]];
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
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:f.name, @"name", f.cost, @"cost", f.date, @"date", f.storeKey, @"store", f.description, @"description", f.picture, @"picture", f.key, @"key", f.categoryKey, @"category", f.categoryKeys, @"categories", nil];
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
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:s.key, @"key", s.name, @"name", s.city, @"city", s.mondayTime, @"monday", s.tuesdayTime, @"tuesday", s.wednesdayTime, @"wednesday", s.thursdayTime, @"thursday", s.fridayTime, @"friday", s.saturdayTime, @"saturday", s.sundayTime, @"sunday", nil];
        [array addObject:tempDictionary];
    }
    [array writeToFile:plistPath atomically:YES];
}
-(void)writeCategories
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_categoryFileString];
    NSMutableArray  *array = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [_categoryList objectEnumerator];
    Category *c;
    while ( c = [enumerator nextObject])
    {
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:c.key, @"key", c.name, @"name", nil];
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
            Find *f = [[Find alloc] initWithDataAndKey:[findDictionary objectForKey:@"name"] cost:[findDictionary objectForKey:@"cost"] date:[findDictionary objectForKey:@"date"] store:[findDictionary objectForKey:@"store"] description:[findDictionary objectForKey:@"description"] picture:[findDictionary objectForKey:@"picture"] key:[findDictionary objectForKey:@"key"] category:[findDictionary objectForKey:@"category"] categoryKeys:[findDictionary objectForKey:@"categories"]];
            if ( [f.key integerValue] > [self findKey])
                self.findKey = [f.key integerValue];
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
            Store *s = [[Store alloc] initWithDataAndKeyAndHours:[findDictionary objectForKey:@"name"] city:[findDictionary objectForKey:@"city"] key:[findDictionary objectForKey:@"key"] mondayTime:[findDictionary objectForKey:@"monday"] tuesdayTime:[findDictionary objectForKey:@"tuesday"] wednesdayTime:[findDictionary objectForKey:@"wednesday"] thursdayTime:[findDictionary objectForKey:@"thursday"] fridayTime:[findDictionary objectForKey:@"friday"] saturdayTime:[findDictionary objectForKey:@"saturday"] sundayTime:[findDictionary objectForKey:@"sunday"]];
            if ( [s.key integerValue] > [self storeKey])
                self.storeKey = [s.key integerValue];
            [stores addObject:s];
        }
    }
    _storeList = stores;
}
-(void)readCategories
{
    NSMutableArray *categories = [[NSMutableArray alloc] init];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:_categoryFileString];
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        NSArray *readArray = [NSArray arrayWithContentsOfFile:plistPath];
        NSEnumerator *enumerator = [readArray objectEnumerator];
        NSDictionary *findDictionary = [[NSDictionary alloc] init];
        while ( findDictionary = [enumerator nextObject])
        {
            Category *c = [[Category alloc] initWithDataAndKey:[findDictionary objectForKey:@"name"] key:[findDictionary objectForKey:@"key"]];
            if ( [c.key integerValue] > [self categoryKey])
                self.categoryKey = [c.key integerValue];
            [categories addObject:c];
        }
    }
    _categoryList = categories;
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
-(Category *)categoryForKey:(NSNumber *)key
{
    Category *c = [[Category alloc] init];
    NSEnumerator *categoryEnumerator = [[self categoryList] objectEnumerator];
    while ( c = [categoryEnumerator nextObject])
    {
        if( c.key == key)
        {
            return c;
        }
    }
    return c;
}
-(NSNumber *)FindKey
{
    if ([[self findList] lastObject])
        _findKey = _findKey + 1;
    else
        _findKey = 0;
    return [[NSNumber alloc] initWithInteger:_findKey];
}
-(NSNumber *)StoreKey
{
    if ([[self storeList] lastObject])
        _storeKey = _storeKey + 1;
    else
        _storeKey = 0;
    return [[NSNumber alloc] initWithInteger:_storeKey];
}
-(NSNumber *)CategoryKey
{
    if ([[self categoryList] lastObject])
        _categoryKey = _categoryKey + 1;
    else
        _categoryKey = 0;
    return [[NSNumber alloc] initWithInteger:_categoryKey];
}
NSInteger categorySort(id f1, id f2, void *context)
{
    Find *find1 = (Find *)f1;
    Find *find2 = (Find *)f2;
    DataController *dc = (__bridge DataController *)context;
    
    if ([[dc categoryForKey:[find1 categoryKey]].name compare:[dc categoryForKey:[find2 categoryKey]].name] == NSOrderedSame)
    {
        return [[find1 name] compare:[find2 name]];
    }
    else
        return [[dc categoryForKey:[find1 categoryKey]].name compare:[dc categoryForKey:[find2 categoryKey]].name];
}
-(void)sortFinds
{
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [[self findList] sortUsingDescriptors:[[NSArray alloc] initWithObjects:nameSort, nil]];
    [self writeFinds];
}
-(void)sortStores
{
    NSSortDescriptor *citySort = [[NSSortDescriptor alloc] initWithKey:@"city" ascending:YES];
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [[self storeList] sortUsingDescriptors:[[NSArray alloc] initWithObjects:citySort, nameSort, nil]];
    [self writeStores];
}
-(void)sortCategories
{
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [[self categoryList] sortUsingDescriptors:[[NSArray alloc] initWithObjects:nameSort, nil]];
    [self writeCategories];
}
-(NSMutableArray *)filterBy:(NSString *)domain key:(NSNumber *)key
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    Find *f = [[Find alloc] init];
    NSEnumerator *findEnumerator = [[self findList] objectEnumerator];
    if ([domain isEqualToString:@"all"])
        return [self findList];
    else
    {
        while ( f = [findEnumerator nextObject])
        {
            if([domain isEqualToString:@"store"])
            {
                if (f.storeKey == key || key == [[NSNumber alloc] initWithInt:-1])
                    [returnArray addObject:f];
            }
            else
            {
                if ([f.categoryKeys containsObject:key] || key == [[NSNumber alloc] initWithInt:-1])
                    [returnArray addObject:f];
            }
        }
        return returnArray;
    }

}
@end
