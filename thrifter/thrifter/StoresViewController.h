//
//  StoresViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 3/21/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "StoreCell.h"
#import "AddStoreViewController.h"

@interface StoresViewController : UITableViewController
@property (nonatomic, strong) DataController *dataController;


@end
