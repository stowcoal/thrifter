//
//  storeSelectViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/21/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindDataController.h"
#import "AddStoreViewController.h"
#import "Store.h"


@interface StoreSelectViewController : UITableViewController
@property (strong, nonatomic) FindDataController *dataController;
@property (strong, nonatomic) NSArray *stores;
- (IBAction)doneAddStore:(UIStoryboardSegue *)segue;
@end
