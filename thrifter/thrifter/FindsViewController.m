//
//  MasterViewController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/12/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "FindsViewController.h"


@interface FindsViewController ()

@end

@implementation FindsViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.filterDomain = @"all";
    self.dataController = [[DataController alloc] initFromPList:@"find.plist" storeLocationString:@"store.plist" categoryLocationString:@"category.plist"];
    self.findsList = self.dataController.findList;
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
    [[self dataController] sortFinds];
    self.findsList = [[self dataController] filterBy:[self filterDomain] key:[self filterKey]];
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
    return [[self findsList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellFind";
    CustomDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Find *findForCell = [[self findsList] objectAtIndex:indexPath.row];
    NSLog(@"%@",findForCell.name);
    Category *detailCategory = [self.dataController categoryForKey:findForCell.categoryKey];
    [cell.mainLabel setText:findForCell.name];
    [cell.secondaryLabel setText:detailCategory.name];
    cell.findKey = findForCell.key;
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
        //[self.dataController findAtIndexPath:[self.tableView indexPathForSelectedRow]];
        //detailViewController.findKey = [self.dataController findAtIndexPath:[self.tableView indexPathForSelectedRow]].key;
        detailViewController.findKey = ((CustomDynamicCell *)[[self tableView] cellForRowAtIndexPath:[[self tableView] indexPathForSelectedRow]]).findKey;
        detailViewController.dataController = [self dataController];
    }
    if ([[segue identifier] isEqualToString:@"SegueAddFind"])
    {
        AddFindViewController *addViewController = [segue destinationViewController];
        addViewController.dataController = self.dataController;
    }
    if ([[segue identifier] isEqualToString:@"SegueSelectFilter"])
    {
        FilterViewController *filterViewController = [segue destinationViewController];
        filterViewController.dataController = self.dataController;
    }
}
- (IBAction)ButtonSortClick:(UIBarButtonItem *)sender {
    
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"UnwindAddSegue"]) {
        AddFindViewController *addController = [segue sourceViewController];
        NSNumberFormatter *numberFormater = [[NSNumberFormatter alloc] init];
        NSNumber *cost = [numberFormater numberFromString:[[addController TextFieldCost] text]];
        Find *findToAdd = [[Find alloc] initWithDataAndKey:[[addController TextFieldName] text] cost:cost date:[NSDate date] store:[addController storeKey] description:[[addController TextFieldDescription] text] picture:[addController imageData] key:[[self dataController] FindKey] category:[addController categoryKey]];
        [self.dataController addFindToFindList:findToAdd];
        NSLog(@"%d",[[self dataController] findKey]);
        [[self tableView] reloadData];
        NSLog(@"done");
        
    }
    if ([[segue identifier] isEqualToString:@"UnwindSelectStore"]) {
        NSLog(@"FilterByStore");
        self.filterDomain = @"store";
        StoreSelectViewController *selectController = [segue sourceViewController];
        self.filterKey = ((CustomDynamicCell *)[[selectController tableView] cellForRowAtIndexPath:[[selectController tableView] indexPathForSelectedRow]]).storeKey;
        
    }
    if ([[segue identifier] isEqualToString:@"UnwindSelectCategory"]) {
        NSLog(@"FilterByCategory");
        self.filterDomain = @"category";
        CategorySelectViewController *categoryController = [segue sourceViewController];
        self.filterKey = ((CustomDynamicCell *)[[categoryController tableView] cellForRowAtIndexPath:[[categoryController tableView] indexPathForSelectedRow]]).categoryKey;
    }
    if ([[segue identifier] isEqualToString:@"UnwindFilterAll"]) {
        NSLog(@"FilterByCategory");
        self.filterDomain = @"all";
        self.filterKey = [[NSNumber alloc] initWithInt:-1];
    }
    [self dismissViewControllerAnimated:YES completion:NULL];

    
}
- (IBAction)cancel:(UIStoryboardSegue *)sender
{
    NSLog(@"cancel");
}
@end
