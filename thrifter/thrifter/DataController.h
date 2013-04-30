//
//  doodadDataController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Find.h"

@interface DataController : NSObject
@property (nonatomic, copy)NSMutableArray *findList;
@property (nonatomic, copy)NSMutableArray *storeList;
@property (nonatomic, copy)NSMutableArray *categoryList;
@property (nonatomic, copy)NSString *findFileString;
@property (nonatomic, copy)NSString *storeFileString;
@property (nonatomic, copy)NSString *categoryFileString;
@property (nonatomic)NSInteger storeKey;
@property (nonatomic)NSInteger findKey;
@property (nonatomic)NSInteger categoryKey;

-(id)initFromPList:(NSString *)findLocationString storeLocationString:(NSString *)storeLocationString categoryLocationString:(NSString *)category;

-(void)addFindToFindList:(Find *)findToAdd;
-(void)addStoreToStoreList:(Store *)storeToAdd;
-(void)addCategoryToCategoryList:(Category *)categoryToAdd;

-(void)removeFindAtIndexPath:(NSIndexPath *)indexPath;
-(void)removeStoreAtIndexPath:(NSIndexPath *)indexPath;
-(void)removeCategoryAtIndexPath:(NSIndexPath *)indexPath;

-(Find *)findAtIndexPath:(NSIndexPath *)indexPath;
-(Store *)storeAtIndexPath:(NSIndexPath *)indexPath;
-(Category *)categoryAtIndexPath:(NSIndexPath *)indexPath;

-(Store *)storeForFind:(Find *)find;
-(Store *)storeForKey:(NSNumber *)key;
-(Category *)categoryForKey:(NSNumber *)key;
-(Find *)findForKey:(NSNumber *)key;

-(NSMutableArray *)filterBy:(NSString *)domain key:(NSNumber *)key;

-(void)sortFinds;
-(void)sortStores;
-(void)sortCategories;

-(NSNumber *)FindKey;
-(NSNumber *)StoreKey;
-(NSNumber *)CategoryKey;

-(void)readCategories;
-(void)readFinds;
-(void)readStores;
-(void)writeFinds;
-(void)writeStores;
-(void)writeCategories;
-(void)refresh;

@end
