//
//  addStoreViewController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/22/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "AddStoreViewController.h"

@interface AddStoreViewController ()

@end

@implementation AddStoreViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
}

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

- (IBAction)ButtonDoneClick:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)ButtonMondayFirstClick:(UIButton *)sender {
    if( [[[self ButtonMondayFirst] titleLabel].text isEqual:@"am"])
        [[self ButtonMondayFirst] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonMondayFirst] setTitle:@"am" forState:UIControlStateNormal];

}
- (IBAction)ButtonTuesdayFirstClick:(UIButton *)sender
{
    if( [[[self ButtonTuesdayFirst] titleLabel].text isEqual:@"am"])
        [[self ButtonTuesdayFirst] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonTuesdayFirst] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonWednesdayFirstClick:(UIButton *)sender{
    if( [[[self ButtonWednesdayFirst] titleLabel].text isEqual:@"am"])
        [[self ButtonWednesdayFirst] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonWednesdayFirst] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonThursdayFirstClick:(UIButton *)sender{
    if( [[[self ButtonThursdayFirst] titleLabel].text isEqual:@"am"])
        [[self ButtonThursdayFirst] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonThursdayFirst] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonFridayFirstClick:(UIButton *)sender
{
    if( [[[self ButtonFridayFirst] titleLabel].text isEqual:@"am"])
        [[self ButtonFridayFirst] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonFridayFirst] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonSaturdayFirstClick:(UIButton *)sender{
    if( [[[self ButtonSaturdayFirst] titleLabel].text isEqual:@"am"])
        [[self ButtonSaturdayFirst] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonSaturdayFirst] setTitle:@"am" forState:UIControlStateNormal];
}

- (IBAction)ButtonSundayFirstClick:(UIButton *)sender{
    if( [[[self ButtonSundayFirst] titleLabel].text isEqual:@"am"])
        [[self ButtonSundayFirst] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonSundayFirst] setTitle:@"am" forState:UIControlStateNormal];
}

- (IBAction)ButtonMondaySecondClick:(UIButton *)sender{
    if( [[[self ButtonMondaySecond] titleLabel].text isEqual:@"am"])
        [[self ButtonMondaySecond] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonMondaySecond] setTitle:@"am" forState:UIControlStateNormal];
}

- (IBAction)ButtonTuesdaySecondClick:(UIButton *)sender{
    if( [[[self ButtonTuesdaySecond] titleLabel].text isEqual:@"am"])
        [[self ButtonTuesdaySecond] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonTuesdaySecond] setTitle:@"am" forState:UIControlStateNormal];
}

- (IBAction)ButtonWednesdaySecondClick:(UIButton *)sender{
    if( [[[self ButtonWednesdaySecond] titleLabel].text isEqual:@"am"])
        [[self ButtonWednesdaySecond] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonWednesdaySecond] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonThursdaySecondClick:(UIButton *)sender{
    if( [[[self ButtonThursdaySecond] titleLabel].text isEqual:@"am"])
        [[self ButtonThursdaySecond] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonThursdaySecond] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonFridaySecondClick:(UIButton *)sender{
    if( [[[self ButtonFridaySecond] titleLabel].text isEqual:@"am"])
        [[self ButtonFridaySecond] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonFridaySecond] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonSaturdaySecondClick:(UIButton *)sender{
    if( [[[self ButtonSaturdaySecond] titleLabel].text isEqual:@"am"])
        [[self ButtonSaturdaySecond] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonSaturdaySecond] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonSundaySecondClick:(UIButton *)sender{
    if( [[[self ButtonSundaySecond] titleLabel].text isEqual:@"am"])
        [[self ButtonSundaySecond] setTitle:@"pm" forState:UIControlStateNormal];
    else
        [[self ButtonSundaySecond] setTitle:@"am" forState:UIControlStateNormal];
}
- (IBAction)ButtonMondayClosedClick:(UIButton *)sender{
    if( [[[self ButtonMondayClosed] titleLabel].text isEqual:@"closed"])
    {
        [[self ButtonMondayClosed] setTitle:@"open" forState:UIControlStateNormal];
        [self ButtonMondayFirst].enabled = YES;
        [self ButtonMondaySecond].enabled = YES;
        [self TextViewMondayOpen].enabled = YES;
        [self TextViewMondayClose].enabled = YES;
        [self ButtonMondayFirst].alpha = 1;
        [self ButtonMondaySecond].alpha = 1;
        [self TextViewMondayOpen].alpha = 1;
        [self TextViewMondayClose].alpha = 1;
    }
    else
    {
        [[self ButtonMondayClosed] setTitle:@"closed" forState:UIControlStateNormal];
        [self ButtonMondayFirst].enabled = NO;
        [self ButtonMondaySecond].enabled = NO;
        [self TextViewMondayOpen].enabled = NO;
        [self TextViewMondayClose].enabled = NO;
        [self ButtonMondayFirst].alpha = .4;
        [self ButtonMondaySecond].alpha = .4;
        [self TextViewMondayOpen].alpha = .4;
        [self TextViewMondayClose].alpha = .4;
    }
}
- (IBAction)ButtonTuesdayClosedClick:(UIButton *)sender{
    if( [[[self ButtonTuesdayClosed] titleLabel].text isEqual:@"closed"])
    {
        [[self ButtonTuesdayClosed] setTitle:@"open" forState:UIControlStateNormal];
        [self ButtonTuesdayFirst].enabled = YES;
        [self ButtonTuesdaySecond].enabled = YES;
        [self TextViewTuesdayOpen].enabled = YES;
        [self TextViewTuesdayClose].enabled = YES;
        [self ButtonTuesdayFirst].alpha = 1;
        [self ButtonTuesdaySecond].alpha = 1;
        [self TextViewTuesdayOpen].alpha = 1;
        [self TextViewTuesdayClose].alpha = 1;
    }
    else
    {
        [[self ButtonTuesdayClosed] setTitle:@"closed" forState:UIControlStateNormal];
        [self ButtonTuesdayFirst].enabled = NO;
        [self ButtonTuesdaySecond].enabled = NO;
        [self TextViewTuesdayOpen].enabled = NO;
        [self TextViewTuesdayClose].enabled = NO;
        [self ButtonTuesdayFirst].alpha = .4;
        [self ButtonTuesdaySecond].alpha = .4;
        [self TextViewTuesdayOpen].alpha = .4;
        [self TextViewTuesdayClose].alpha = .4;
    }
}
- (IBAction)ButtonWednesdayClosedClick:(UIButton *)sender{
    if( [[[self ButtonWednesdayClosed] titleLabel].text isEqual:@"closed"])
    {
        [[self ButtonWednesdayClosed] setTitle:@"open" forState:UIControlStateNormal];
        [self ButtonWednesdayFirst].enabled = YES;
        [self ButtonWednesdaySecond].enabled = YES;
        [self TextViewWednesdayOpen].enabled = YES;
        [self TextViewWednesdayClose].enabled = YES;
        [self ButtonWednesdayFirst].alpha = 1;
        [self ButtonWednesdaySecond].alpha = 1;
        [self TextViewWednesdayOpen].alpha = 1;
        [self TextViewWednesdayClose].alpha = 1;
    }
    else
    {
        [[self ButtonWednesdayClosed] setTitle:@"closed" forState:UIControlStateNormal];
        [self ButtonWednesdayFirst].enabled = NO;
        [self ButtonWednesdaySecond].enabled = NO;
        [self TextViewWednesdayOpen].enabled = NO;
        [self TextViewWednesdayClose].enabled = NO;
        [self ButtonWednesdayFirst].alpha = .4;
        [self ButtonWednesdaySecond].alpha = .4;
        [self TextViewWednesdayOpen].alpha = .4;
        [self TextViewWednesdayClose].alpha = .4;
        
    }
}
- (IBAction)ButtonThursdayClosedClick:(UIButton *)sender{
    if( [[[self ButtonThursdayClosed] titleLabel].text isEqual:@"closed"])
    {
        [[self ButtonThursdayClosed] setTitle:@"open" forState:UIControlStateNormal];
        [self ButtonThursdayFirst].enabled = YES;
        [self ButtonThursdaySecond].enabled = YES;
        [self TextViewThursdayOpen].enabled = YES;
        [self TextViewThursdayClose].enabled = YES;
        [self ButtonThursdayFirst].alpha = 1;
        [self ButtonThursdaySecond].alpha = 1;
        [self TextViewThursdayOpen].alpha = 1;
        [self TextViewThursdayClose].alpha = 1;
    }
    else
    {
        [[self ButtonThursdayClosed] setTitle:@"closed" forState:UIControlStateNormal];
        [self ButtonThursdayFirst].enabled = NO;
        [self ButtonThursdaySecond].enabled = NO;
        [self TextViewThursdayOpen].enabled = NO;
        [self TextViewThursdayClose].enabled = NO;
        [self ButtonThursdayFirst].alpha = .4;
        [self ButtonThursdaySecond].alpha = .4;
        [self TextViewThursdayOpen].alpha = .4;
        [self TextViewThursdayClose].alpha = .4;
    }
}
- (IBAction)ButtonFridayClosedClick:(UIButton *)sender{
    if( [[[self ButtonFridayClosed] titleLabel].text isEqual:@"closed"])
    {
        [[self ButtonFridayClosed] setTitle:@"open" forState:UIControlStateNormal];
        [self ButtonFridayFirst].enabled = YES;
        [self ButtonFridaySecond].enabled = YES;
        [self TextViewFridayOpen].enabled = YES;
        [self TextViewFridayClose].enabled = YES;
        [self ButtonFridayFirst].alpha = 1;
        [self ButtonFridaySecond].alpha = 1;
        [self TextViewFridayOpen].alpha = 1;
        [self TextViewFridayClose].alpha = 1;
    }
    else
    {
        [[self ButtonFridayClosed] setTitle:@"closed" forState:UIControlStateNormal];
        [self ButtonFridayFirst].enabled = NO;
        [self ButtonFridaySecond].enabled = NO;
        [self TextViewFridayOpen].enabled = NO;
        [self TextViewFridayClose].enabled = NO;
        [self ButtonFridayFirst].alpha = .4;
        [self ButtonFridaySecond].alpha = .4;
        [self TextViewFridayOpen].alpha = .4;
        [self TextViewFridayClose].alpha = .4;
    }
}
- (IBAction)ButtonSaturdayClosedClick:(UIButton *)sender{
    if( [[[self ButtonSaturdayClosed] titleLabel].text isEqual:@"closed"])
    {
        [[self ButtonSaturdayClosed] setTitle:@"open" forState:UIControlStateNormal];
        [self ButtonSaturdayFirst].enabled = YES;
        [self ButtonSaturdaySecond].enabled = YES;
        [self TextViewSaturdayOpen].enabled = YES;
        [self TextViewSaturdayClose].enabled = YES;
        [self ButtonSaturdayFirst].alpha = 1;
        [self ButtonSaturdaySecond].alpha = 1;
        [self TextViewSaturdayOpen].alpha = 1;
        [self TextViewSaturdayClose].alpha = 1;
    }
    else
    {
        [[self ButtonSaturdayClosed] setTitle:@"closed" forState:UIControlStateNormal];
        [self ButtonSaturdayFirst].enabled = NO;
        [self ButtonSaturdaySecond].enabled = NO;
        [self TextViewSaturdayOpen].enabled = NO;
        [self TextViewSaturdayClose].enabled = NO;
        [self ButtonSaturdayFirst].alpha = .4;
        [self ButtonSaturdaySecond].alpha = .4;
        [self TextViewSaturdayOpen].alpha = .4;
        [self TextViewSaturdayClose].alpha = .4;
    }
}
- (IBAction)ButtonSundayClosedClick:(UIButton *)sender{
    if( [[[self ButtonSundayClosed] titleLabel].text isEqual:@"closed"])
    {
        [[self ButtonSundayClosed] setTitle:@"open" forState:UIControlStateNormal];
        [self ButtonSundayFirst].enabled = YES;
        [self ButtonSundaySecond].enabled = YES;
        [self TextViewSundayOpen].enabled = YES;
        [self TextViewSundayClose].enabled = YES;
        [self ButtonSundayFirst].alpha = 1;
        [self ButtonSundaySecond].alpha = 1;
        [self TextViewSundayOpen].alpha = 1;
        [self TextViewSundayClose].alpha = 1;
    }
    else
    {
        [[self ButtonSundayClosed] setTitle:@"closed" forState:UIControlStateNormal];
        [self ButtonSundayFirst].enabled = NO;
        [self ButtonSundaySecond].enabled = NO;
        [self TextViewSundayOpen].enabled = NO;
        [self TextViewSundayClose].enabled = NO;
        [self ButtonSundayFirst].alpha = .4;
        [self ButtonSundaySecond].alpha = .4;
        [self TextViewSundayOpen].alpha = .4;
        [self TextViewSundayClose].alpha = .4;
    }
}
@end
