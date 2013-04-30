//
//  addStoreViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 2/22/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//
#import "HoursClosedOpenButton.h"
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
- (IBAction)ButtonAMPMClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonMondayFirst;
@property (weak, nonatomic) IBOutlet UIButton *ButtonTuesdayFirst;
@property (weak, nonatomic) IBOutlet UIButton *ButtonWednesdayFirst;
@property (weak, nonatomic) IBOutlet UIButton *ButtonThursdayFirst;
@property (weak, nonatomic) IBOutlet UIButton *ButtonFridayFirst;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSaturdayFirst;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSundayFirst;
@property (weak, nonatomic) IBOutlet UIButton *ButtonMondaySecond;
@property (weak, nonatomic) IBOutlet UIButton *ButtonTuesdaySecond;
@property (weak, nonatomic) IBOutlet UIButton *ButtonWednesdaySecond;
@property (weak, nonatomic) IBOutlet UIButton *ButtonThursdaySecond;
@property (weak, nonatomic) IBOutlet UIButton *ButtonFridaySecond;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSaturdaySecond;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSundaySecond;
- (IBAction)ButtonClosedClick:(HoursClosedOpenButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonMondayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonTuesdayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonWednesdayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonThursdayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonFridayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSaturdayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSundayClosed;

@end
