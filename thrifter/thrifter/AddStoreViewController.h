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
@property (weak, nonatomic) IBOutlet UIButton *ButtonMondayFirst;
- (IBAction)ButtonMondayFirstClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonTuesdayFirst;
- (IBAction)ButtonTuesdayFirstClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonWednesdayFirst;
- (IBAction)ButtonWednesdayFirstClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonThursdayFirst;
- (IBAction)ButtonThursdayFirstClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonFridayFirst;
- (IBAction)ButtonFridayFirstClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSaturdayFirst;
- (IBAction)ButtonSaturdayFirstClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSundayFirst;
- (IBAction)ButtonSundayFirstClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonMondaySecond;
- (IBAction)ButtonMondaySecondClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonTuesdaySecond;
- (IBAction)ButtonTuesdaySecondClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonWednesdaySecond;
- (IBAction)ButtonWednesdaySecondClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonThursdaySecond;
- (IBAction)ButtonThursdaySecondClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonFridaySecond;
- (IBAction)ButtonFridaySecondClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSaturdaySecond;
- (IBAction)ButtonSaturdaySecondClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSundaySecond;
- (IBAction)ButtonSundaySecondClick:(UIButton *)sender;
- (IBAction)ButtonMondayClosedClick:(UIButton *)sender;
- (IBAction)ButtonTuesdsayClosedClick:(UIButton *)sender;
- (IBAction)ButtonWednesdayClosedClick:(UIButton *)sender;
- (IBAction)ButtonThursdayClosedClick:(UIButton *)sender;
- (IBAction)ButtonFridayClosedClick:(UIButton *)sender;
- (IBAction)ButtonSaturdayClosedClick:(UIButton *)sender;
- (IBAction)ButtonSundayClosedClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ButtonMondayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonTuesdayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonWednesdayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonThursdayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonFridayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSaturdayClosed;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSundayClosed;

@end
