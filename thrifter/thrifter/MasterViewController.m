//
//  MasterViewController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "MasterViewController.h"
#import "doodadDataController.h"
#import "Doodad.h"
#import "DetailDoodadViewController.h"
#import "AddDoodadViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.dataController = [[doodadDataController alloc] init];
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
    self.dataController = [[doodadDataController alloc] initFromPList:@"data.plist"];
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
    return [self.dataController.doodadList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellDoodad";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Doodad *doodadForCell = [self.dataController doodadAtIndexPath:indexPath];
    NSLog(@"%@",doodadForCell.name);
    [[cell textLabel] setText:doodadForCell.name];
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
        [self.dataController removeDoodadAtIndexPath:indexPath];
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
        DetailDoodadViewController *detailViewController = [segue destinationViewController];
        NSLog(@"%@", [self.tableView indexPathForSelectedRow]);
        [self.dataController doodadAtIndexPath:[self.tableView indexPathForSelectedRow]];
        detailViewController.detailDoodad = [self.dataController doodadAtIndexPath:[self.tableView indexPathForSelectedRow]];        
    }
    if ([[segue identifier] isEqualToString:@"SegueAdd"])
    {
        AddDoodadViewController *addViewController = (AddDoodadViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        addViewController.dataController = self.dataController;
    }
}
- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"Done"]) {
        AddDoodadViewController *addController = [segue sourceViewController];
        if (addController.doodad) {
            [self.dataController addDoodadToDoodadList:addController.doodad];
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

- (IBAction)buttonEditClick:(UIBarButtonItem *)sender {
    if (self.tableView.editing)
        [[self tableView] setEditing:NO animated:YES];
    else
        [[self tableView] setEditing:YES animated:YES];
}
- (IBAction)AddDoodad:(UIBarButtonItem *)sender {
}
@end
