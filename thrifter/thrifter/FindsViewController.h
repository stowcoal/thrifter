//
//  MasterViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindCell.h"
@class DataController;

@interface FindsViewController : UITableViewController
@property (strong, nonatomic) DataController *dataController;
- (IBAction)done:(UIStoryboardSegue *)sender;
- (IBAction)cancel:(UIStoryboardSegue *)sender;
@end