//
//  StoresViewController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 3/21/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "StoresViewController.h"

@interface StoresViewController ()

@end

@implementation StoresViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
     NSLog(@"load");
    self.dataController = [[DataController alloc] initFromPList:@"find.plist" storeLocationString:@"store.plist" categoryLocationString:@"category.plist"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"appear");
    [self.dataController refresh];
    [[self dataController] sortStores];
    [[self tableView] reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[[self dataController] storeList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellStore";
    CustomDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell.mainLabel setText:[[self dataController] storeAtIndexPath:indexPath].name];
    [cell.secondaryLabel setText:[[self dataController] storeAtIndexPath:indexPath].city];
    cell.storeKey = [[self dataController] storeAtIndexPath:indexPath].key;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SegueStoreDetail"]) {
        StoreDetailViewController *detailViewController = [segue destinationViewController];
        //Store *detailStore = [self.dataController storeAtIndexPath:[self.tableView indexPathForSelectedRow]];
        detailViewController.storeKey = ((CustomDynamicCell *)[[self tableView] cellForRowAtIndexPath:[[self tableView] indexPathForSelectedRow]]).storeKey;
        detailViewController.dataController = [self dataController];
    }
}
- (IBAction)doneAddStore:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"UnwindAddStore"]) {
        AddStoreViewController *addController = [segue sourceViewController];
        if (![[[addController TextViewStoreCity] text] isEqualToString:@""] && ![[[addController TextViewStoreName] text] isEqualToString:@""])
        {
            NSString *mondayString = [[NSString alloc] init];
            NSString *tuesdayString = [[NSString alloc] init];
            NSString *wednesdayString = [[NSString alloc] init];
            NSString *thursdayString = [[NSString alloc] init];
            NSString *fridayString = [[NSString alloc] init];
            NSString *saturdayString = [[NSString alloc] init];
            NSString *sundayString = [[NSString alloc] init];
            
            if( [[[addController ButtonMondayClosed] titleLabel].text isEqual:@"open"])
            {
                mondayString = [[NSString alloc] initWithFormat:@"%@%@ - %@%@", [[addController TextViewMondayOpen].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonMondayFirst].titleLabel.text, [[addController TextViewMondayClose].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonMondaySecond].titleLabel.text];
            }
            else
            {
                mondayString = @"closed";
            }
            if( [[[addController ButtonTuesdayClosed] titleLabel].text isEqual:@"open"])
            {
                tuesdayString = [[NSString alloc] initWithFormat:@"%@%@ - %@%@", [[addController TextViewTuesdayOpen].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonTuesdayFirst].titleLabel.text, [[addController TextViewTuesdayClose].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonTuesdaySecond].titleLabel.text];
            }
            else
            {
                tuesdayString = @"closed";
            }
            if( [[[addController ButtonWednesdayClosed] titleLabel].text isEqual:@"open"])
            {
                wednesdayString = [[NSString alloc] initWithFormat:@"%@%@ - %@%@", [[addController TextViewWednesdayOpen].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonWednesdayFirst].titleLabel.text, [[addController TextViewWednesdayClose].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonWednesdaySecond].titleLabel.text];
            }
            else
            {
                wednesdayString = @"closed";
            }
            if( [[[addController ButtonThursdayClosed] titleLabel].text isEqual:@"open"])
            {
                thursdayString = [[NSString alloc] initWithFormat:@"%@%@ - %@%@", [[addController TextViewThursdayOpen].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonThursdayFirst].titleLabel.text, [[addController TextViewThursdayClose].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonThursdaySecond].titleLabel.text];
            }
            else
            {
                thursdayString = @"closed";
            }
            if( [[[addController ButtonFridayClosed] titleLabel].text isEqual:@"open"])
            {
                fridayString = [[NSString alloc] initWithFormat:@"%@%@ - %@%@", [[addController TextViewFridayOpen].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonFridayFirst].titleLabel.text, [[addController TextViewFridayClose].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonFridaySecond].titleLabel.text];
            }
            else
            {
                fridayString = @"closed";
            }
            if( [[[addController ButtonSaturdayClosed] titleLabel].text isEqual:@"open"])
            {
                saturdayString = [[NSString alloc] initWithFormat:@"%@%@ - %@%@", [[addController TextViewSaturdayOpen].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonSaturdayFirst].titleLabel.text, [[addController TextViewSaturdayClose].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonSaturdaySecond].titleLabel.text];
            }
            else
            {
                saturdayString = @"closed";
            }
            if( [[[addController ButtonSundayClosed] titleLabel].text isEqual:@"open"])
            {
                sundayString = [[NSString alloc] initWithFormat:@"%@%@ - %@%@", [[addController TextViewSundayOpen].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonSundayFirst].titleLabel.text, [[addController TextViewSundayClose].text stringByPaddingToLength:1 withString:@"?" startingAtIndex:0], [addController ButtonSundaySecond].titleLabel.text];
            }
            else
            {
                sundayString = @"closed";
            }
            
            Store *storeToAdd = [[Store alloc] initWithDataAndKeyAndHours:addController.TextViewStoreName.text city:addController.TextViewStoreCity.text key:[[self dataController] StoreKey] mondayTime:mondayString  tuesdayTime:tuesdayString wednesdayTime:wednesdayString thursdayTime:thursdayString fridayTime:fridayString saturdayTime:saturdayString sundayTime:sundayString];
            [[self dataController] addStoreToStoreList:storeToAdd];
            [[self tableView] reloadData];
        }
    }
    //[self dismissViewControllerAnimated:YES completion:NULL];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[self dataController] removeStoreAtIndexPath:indexPath];
        [[self tableView] reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
