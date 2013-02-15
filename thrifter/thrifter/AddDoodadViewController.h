//
//  AddDoodadViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/14/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "doodad.h"

@interface AddDoodadViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *TextFieldName;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldCost;
@property (weak, nonatomic) doodad *doodad;

@end
