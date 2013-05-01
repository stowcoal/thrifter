//
//  DetailDoodadViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/14/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Find.h"
#import "DataController.h"
#import "StoreSelectViewController.h"
#import "CategorySelectViewController.h"

@interface FindDetailViewController : UITableViewController
@property (strong, nonatomic) NSNumber *findKey;
@property (strong, nonatomic) DataController *dataController;

@property (weak, nonatomic) IBOutlet UILabel *TextLabelStore;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelCity;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelDate;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelCost;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelFind;
@property (weak, nonatomic) IBOutlet UILabel *TextLabelCategory;
@property (weak, nonatomic) IBOutlet UITextView *TextViewDescription;
@property (weak, nonatomic) IBOutlet UIImageView *PictureFind;
- (IBAction)ClickTakePicture:(UIButton *)sender;
- (IBAction)ClickSelectPicture:(UIButton *)sender;
@end
