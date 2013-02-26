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
@property (strong, nonatomic) DataController *dataController;

@property (weak, nonatomic) IBOutlet UITextField *TextFieldName;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldCost;
@property (weak, nonatomic) IBOutlet UITextView *TextViewDescription;
@property (weak, nonatomic) IBOutlet UITextField *TextViewStoreName;
@property (weak, nonatomic) IBOutlet UITextField *TextViewStoreCity;
- (IBAction)doneSelectStore:(UIStoryboardSegue *)segue;


@end
