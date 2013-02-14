//
//  DetailDoodadViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/14/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "doodad.h"

@interface DetailDoodadViewController : UITableViewController
@property (strong, nonatomic) doodad *detailDoodad;
@property (weak, nonatomic) IBOutlet UITableViewCell *CellName;
@property (weak, nonatomic) IBOutlet UITableViewCell *CellCost;
@property (weak, nonatomic) IBOutlet UITableViewCell *CellDate;

@end
