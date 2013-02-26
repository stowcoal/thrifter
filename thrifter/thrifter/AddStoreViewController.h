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

@end
