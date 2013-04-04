//
//  FindCustomCell.h
//  thrifter
//
//  Created by CURTIS STOCHL on 3/21/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomDynamicCell : UITableViewCell
@property (nonatomic) IBOutlet UILabel* mainLabel;
@property (nonatomic) IBOutlet UILabel* secondaryLabel;
@property (nonatomic) NSNumber *findKey;
@property (nonatomic) NSNumber *storeKey;
@property (nonatomic) NSNumber *categoryKey;
@end
