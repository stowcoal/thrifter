//
//  CategorySelectViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 4/3/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "CustomDynamicCell.h"

@interface CategorySelectViewController : UITableViewController
@property (nonatomic, strong) DataController *dataController;
@property (nonatomic, strong) NSMutableArray *selections;
@end
