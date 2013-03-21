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

@interface MasterViewController : UITableViewController
@property (strong, nonatomic) DataController *dataController;
- (IBAction)AddDoodad:(UIBarButtonItem *)sender;
- (IBAction)done:(UIStoryboardSegue *)sender;
- (IBAction)cancel:(UIStoryboardSegue *)sender;
- (IBAction)buttonEditClick:(UIBarButtonItem *)sender;
@end
