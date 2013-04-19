//
//  addStoreViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/22/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStoreViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *TextViewStoreName;
@property (weak, nonatomic) IBOutlet UITextField *TextViewStoreCity;
- (IBAction)ButtonDoneClick:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextField *TextViewMondayOpen;
@property (weak, nonatomic) IBOutlet UITextField *TextViewTuesdayOpen;
@property (weak, nonatomic) IBOutlet UITextField *TextViewWednesdayOpen;
@property (weak, nonatomic) IBOutlet UITextField *TextViewThursdayOpen;
@property (weak, nonatomic) IBOutlet UITextField *TextViewFridayOpen;
@property (weak, nonatomic) IBOutlet UITextField *TextViewSaturdayOpen;
@property (weak, nonatomic) IBOutlet UITextField *TextViewSundayOpen;
@property (weak, nonatomic) IBOutlet UITextField *TextViewMondayClose;
@property (weak, nonatomic) IBOutlet UITextField *TextViewTuesdayClose;
@property (weak, nonatomic) IBOutlet UITextField *TextViewWednesdayClose;
@property (weak, nonatomic) IBOutlet UITextField *TextViewThursdayClose;
@property (weak, nonatomic) IBOutlet UITextField *TextViewFridayClose;
@property (weak, nonatomic) IBOutlet UITextField *TextViewSaturdayClose;
@property (weak, nonatomic) IBOutlet UITextField *TextViewSundayClose;

@end
