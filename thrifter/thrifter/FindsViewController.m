//
//  MasterViewController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "FindsViewController.h"
#import "DataController.h"
#import "Find.h"
#import "FindDetailViewController.h"
#import "AddFindViewController.h"

@interface FindsViewController ()

@end

@implementation FindsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.dataController = [[DataController alloc] init];
    }
    return self;
}

/*
- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.dataController = [[DataController alloc] initFromPList:@"find.plist" storeLocationString:@"store.plist"];
    [[self tableView] reloadData];
}
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"appear");
    self.dataController = [[DataController alloc] initFromPList:@"find.plist" storeLocationString:@"store.plist"];
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
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.dataController.findList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellFind";
    FindCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Find *findForCell = [self.dataController findAtIndexPath:indexPath];
    NSLog(@"%@",findForCell.name);
    [cell.customLabel setText:findForCell.name];
    // Configure the cell...
    
    return cell;
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
        [self.dataController removeFindAtIndexPath:indexPath];
        [tableView reloadData];
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SegueDetail"]) {
        FindDetailViewController *detailViewController = [segue destinationViewController];
        NSLog(@"%@", [self.tableView indexPathForSelectedRow]);
        [self.dataController findAtIndexPath:[self.tableView indexPathForSelectedRow]];
        detailViewController.findKey = [self.dataController findAtIndexPath:[self.tableView indexPathForSelectedRow]].key;
        detailViewController.dataController = [self dataController];
    }
    if ([[segue identifier] isEqualToString:@"SegueAddFind"])
    {
        AddFindViewController *addViewController = [segue destinationViewController];
        addViewController.dataController = self.dataController;
    }
}
- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"Done"]) {
        AddFindViewController *addController = [segue sourceViewController];
        if (addController.find) {
            [self.dataController addFindToFindList:addController.find];
            NSLog(@"%d",[[self dataController] findKey]);
            [[self tableView] reloadData];
        }
    }
    [self dismissViewControllerAnimated:YES completion:NULL];

    NSLog(@"done");
}
- (IBAction)cancel:(UIStoryboardSegue *)sender
{
    NSLog(@"cancel");
}
@end