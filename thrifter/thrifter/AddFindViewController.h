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
#import "CategorySelectViewController.h"

@interface AddFindViewController : UITableViewController
@property (strong, nonatomic) Find *find;
@property (strong, nonatomic) NSNumber *storeKey;
@property (strong, nonatomic) NSArray *categoryKeys;
@property (strong, nonatomic) NSNumber *categoryKey;
@property (strong, nonatomic) NSData *imageData;
@property (strong, nonatomic) DataController *dataController;

@property (weak, nonatomic) IBOutlet UITextField *TextFieldName;
@property (weak, nonatomic) IBOutlet UILabel *LabelStore;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldCost;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldDescription;
@property (weak, nonatomic) IBOutlet UITableViewCell *CellStoreData;
@property (weak, nonatomic) IBOutlet UITableViewCell *CellStoreSelect;
@property (weak, nonatomic) IBOutlet UILabel *LabelCity;
@property (weak, nonatomic) IBOutlet UILabel *LabelName;
@property (weak, nonatomic) IBOutlet UILabel *LabelCategory;
@property (weak, nonatomic) IBOutlet UITextView *TextViewCategories;
@property (weak, nonatomic) IBOutlet UIButton *ButtonTakePicture;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSelectPicture;
@property (weak, nonatomic) IBOutlet UIImageView *ImageFind;
- (IBAction)ClickTakePicture:(UIButton *)sender;
- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)ClickSelectPicture:(UIButton *)sender;

@end
