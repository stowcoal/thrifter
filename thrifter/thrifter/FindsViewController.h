//
//  MasterViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomDynamicCell.h"
#import "StoreSelectViewController.h"
#import "CategorySelectViewController.h"
#import "FilterViewController.h"
#import "DataController.h"
#import "Find.h"
#import "FindDetailViewController.h"
#import "AddFindViewController.h"

@class DataController;

@interface FindsViewController : UITableViewController
@property (strong, nonatomic) DataController *dataController;
@property (strong, nonatomic) NSMutableArray *findsList;
@property (strong, nonatomic) NSString *filterDomain;
@property (strong, nonatomic) NSNumber *filterKey;
- (IBAction)ButtonSortClick:(UIBarButtonItem *)sender;
- (IBAction)done:(UIStoryboardSegue *)sender;
- (IBAction)cancel:(UIStoryboardSegue *)sender;
@end
