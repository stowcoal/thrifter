//
//  DetailDoodadViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/14/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doodad.h"

@interface DetailDoodadViewController : UITableViewController
@property (strong, nonatomic) Doodad *detailDoodad;

@property (weak, nonatomic) IBOutlet UILabel *TextLabelStore;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelCity;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelDate;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelCost;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelFind;
@property (weak, nonatomic) IBOutlet UITextView *TextViewDescription;

@end
