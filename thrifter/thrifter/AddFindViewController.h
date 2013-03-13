//
//  AddDoodadViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/14/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Find.h"
#import "DataController.h"

@interface AddFindViewController : UITableViewController
@property (strong, nonatomic) Find *find;
@property (strong, nonatomic) NSNumber *storeKey;
@property (strong, nonatomic) DataController *dataController;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldName;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldCost;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldDescription;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldStoreName;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldStoreCity;
- (IBAction)doneSelectStore:(UIStoryboardSegue *)segue;
- (IBAction)ButtonAddPicture:(UIButton *)sender;

@end
