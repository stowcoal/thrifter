//
//  MasterViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomDynamicCell.h"
#import "FilterViewController.h"

@class DataController;

@interface FindsViewController : UITableViewController
@property (strong, nonatomic) DataController *dataController;
@property (strong, nonatomic) NSArray *findArray;
- (IBAction)ButtonSortClick:(UIBarButtonItem *)sender;
- (IBAction)done:(UIStoryboardSegue *)sender;
- (IBAction)cancel:(UIStoryboardSegue *)sender;
@end
