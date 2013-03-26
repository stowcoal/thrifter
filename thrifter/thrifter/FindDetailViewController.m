//
//  DetailDoodadViewController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/14/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "FindDetailViewController.h"


@interface FindDetailViewController ()

@end

@implementation FindDetailViewController

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
    [self configureView];
}

- (void)configureView
{
    static NSDateFormatter *dateFormatter = nil;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    }
    static NSNumberFormatter *numberFormatter = nil;
    if (numberFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [numberFormatter setCurrencyCode:@"USD"];
    }
    Find *detailFind = [[self dataController] findForKey:[self findKey]];
    Store *detailStore = [[self dataController] storeForFind:detailFind];
    
    [self.TextLabelCost setText:[numberFormatter stringFromNumber:detailFind.cost]];
    [self.TextLabelDate setText:[dateFormatter stringFromDate:detailFind.date]];
    [self.TextLabelFind setText:detailFind.name];
    [self.TextViewDescription setText:detailFind.description];
    [self.PictureFind setImage:[[UIImage alloc] initWithData:detailFind.picture]];
    if (detailStore)
    {
        [self.TextLabelCity setText:detailStore.city];
        [self.TextLabelStore setText:detailStore.name];
    }
    else
    {
        [self.TextLabelCity setText:@"not found"];
        [self.TextLabelStore setText:@"not found"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SegueSelectNewStore"]) {
        StoreSelectViewController *storeSelectViewController = [segue destinationViewController];
        storeSelectViewController.dataController = [self dataController];
    }
}
- (IBAction)doneSelectStore:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"UnwindSelectStore"]) {
        StoreSelectViewController *storeController = [segue sourceViewController];
        self.dataController = [[DataController alloc] initFromPList:@"find.plist" storeLocationString:@"store.plist"];
        Find *detailFind = [[self dataController] findForKey:[self findKey]];
        detailFind.storeKey = [[self dataController] storeAtIndexPath:[[storeController tableView] indexPathForSelectedRow]].key;
        Store *detailStore = [[self dataController] storeForFind:detailFind];
        self.TextLabelCity.text = detailStore.city;
        self.TextLabelStore.text = detailStore.name;
        [[self dataController] writeFinds];
    }
}
    //[self dismissViewControllerAnimated:YES completion:NULL];
    
#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
*/
/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
 */
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
     
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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