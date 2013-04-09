//
//  storeSelectViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/21/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "AddStoreViewController.h"
#import "CustomDynamicCell.h"
#import "Store.h"


@interface StoreSelectViewController : UITableViewController
@property (strong, nonatomic) DataController *dataController;
@property (strong, nonatomic) NSNumber *storeKey;


@end
