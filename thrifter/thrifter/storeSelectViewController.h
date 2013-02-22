//
//  storeSelectViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/21/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "doodadDataController.h"
#import "addStoreViewController.h"
#import "store.h"


@interface storeSelectViewController : UITableViewController
@property (strong, nonatomic) doodadDataController *dataController;
@property (strong, nonatomic) NSArray *stores;
- (IBAction)doneAddStore:(UIStoryboardSegue *)segue;
@end
