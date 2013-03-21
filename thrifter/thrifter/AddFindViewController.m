//
//  AddDoodadViewController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/14/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "AddFindViewController.h"
#import "StoreSelectViewController.h"
#import "DataController.h"
#import "Store.h"

@interface AddFindViewController ()

@end

@implementation AddFindViewController

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
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [[self ButtonTakePicture] setEnabled:NO];
        [[self ButtonTakePicture] setAlpha:.4];
    }
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        [[self ButtonSelectPicture] setEnabled:NO];
        [[self ButtonSelectPicture] setAlpha:.4];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ( (textField == self.TextFieldCost)
        || (textField == self.TextFieldName)
        || (textField == self.TextFieldDescription)) {
        [textField resignFirstResponder];
    }
    return YES;
    
}
/*
- (BOOL)textViewShouldReturn:(UITextView *)textView {
    if (textView == self.TextFieldDescription)
    {
        [textView resignFirstResponder];
    }
    return YES;
}
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Done"]) {
        NSNumberFormatter *numberFormater = [[NSNumberFormatter alloc] init];
        NSNumber *cost = [numberFormater numberFromString:self.TextFieldCost.text];
        Find *findToAdd = [[Find alloc] initWithData:self.TextFieldName.text cost:cost date:[NSDate date] store:_storeKey description:self.TextFieldDescription.text picture:self.imageData];
        self.find = findToAdd;
    }
    if([[segue identifier] isEqualToString:@"SegueStoreSelect"]){
        StoreSelectViewController *storeSelect = [segue destinationViewController];
        storeSelect.dataController = self.dataController;
    }
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
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

- (IBAction)doneSelectStore:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"UnwindSelectStore"]) {
        StoreSelectViewController *storeController = [segue sourceViewController];
        _storeKey = [[self dataController] storeAtIndexPath:[storeController.tableView indexPathForSelectedRow]].key;
        Store *storeForFind = [[self dataController] storeForKey:_storeKey];
        if (storeForFind) {
            self.LabelName.hidden = NO;
            self.LabelCity.hidden = NO;
            self.LabelStore.hidden = YES;
            self.LabelCity.text = storeForFind.city;
            self.LabelName.text = storeForFind.name;
        }
    }
    //[self dismissViewControllerAnimated:YES completion:NULL];
    
    NSLog(@"done");
}
- (IBAction)ClickTakePicture:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        
        imagePicker.delegate = (id)self;
        
        [self presentViewController:imagePicker animated:YES completion:NULL];
    }
}
- (IBAction)ClickSelectPicture:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        imagePicker.delegate = (id)self;
        
        [self presentViewController:imagePicker animated:YES completion:NULL];
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    _imageData = UIImagePNGRepresentation(image);
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    [[self ImageFind] setImage:[[UIImage alloc] initWithData:_imageData]];
}

@end
