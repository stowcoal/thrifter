//
//  CategoriesViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 3/28/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "FindCell.h"
#import "AddCategoryViewController.h"

@interface CategoriesViewController : UITableViewController
@property (nonatomic, strong) DataController *dataController;
-(IBAction)doneAddCategory:(UIStoryboardSegue *)segue;
@end
