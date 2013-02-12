//
//  MasterViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class doodadDataController;

@interface MasterViewController : UITableViewController
@property (strong, nonatomic) doodadDataController *dataController;

@end
