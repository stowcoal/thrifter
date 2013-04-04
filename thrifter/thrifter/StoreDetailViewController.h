//
//  StoreDetailViewController.h
//  thrifter
//
//  Created by CURTIS STOCHL on 3/22/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface StoreDetailViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *LabelStoreName;
@property (weak, nonatomic) IBOutlet UILabel *LabelStoreCity;
@property (strong, nonatomic) DataController *dataController;
@property (weak, nonatomic) NSNumber *storeKey;
@end
