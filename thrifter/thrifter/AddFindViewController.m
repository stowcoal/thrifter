//
//  AddDoodadViewController.m
//  thrifter
//
//  Created by CURTIS STOCHL on 2/14/13.
//  Copyright (c) 2013 CURTIS STOCHL. All rights reserved.
//

#import "AddFindViewController.h"
#import "StoreSelectViewController.h"
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
    if ([[self find] key] != nil)
    {
        self.storeKey = [[self find] storeKey];
        self.categoryKeys = [[self find] categoryKeys];
        self.imageData = [[self find] picture];
        [self setTitle:@"edit find"];
        [[self TextFieldName] setText:[[self find] name]];
        [[self TextFieldCost] setText:[[[self find] cost] stringValue]];
        [[self TextFieldDescription] setText:[[self find] description]];
        [[self ImageFind] setImage:[[UIImage alloc] initWithData:[self imageData]]];
        Store *s = [[self dataController] storeForKey:[self storeKey]];
        [[self LabelCity] setText:[s city]];
        [[self LabelName] setText:[s name]];
    }
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"UnwindAddSegue"]) {
        if ([[[self TextFieldCost] text] length] == 0)
        {
            [[self TextFieldCost] setText:@"0.00"];
        }
        if ([[[self TextFieldName] text] length] == 0)
        {
            [[self TextFieldName] setText:@"unnamed"];
        }
        if (![[self TextFieldDescription] hasText])
        {
            [[self TextFieldDescription] setText:@"uninteresting"];
        }
    }
    if([[segue identifier] isEqualToString:@"SegueStoreSelect"]){
        StoreSelectViewController *storeSelect = [segue destinationViewController];
        storeSelect.dataController = self.dataController;
    }
    if([[segue identifier] isEqualToString:@"SegueSelectCategory"]){
        CategorySelectViewController *categorySelect = [segue destinationViewController];
        categorySelect.dataController = self.dataController;
    }
}
/*
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
    return 6;
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
/*
- (IBAction)doneSelectStore:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"UnwindSelectStore"]) {
        StoreSelectViewController *storeController = [segue sourceViewController];
        [self.dataController  refresh];
        _storeKey = ((CustomDynamicCell *)[[storeController tableView] cellForRowAtIndexPath:[[storeController tableView] indexPathForSelectedRow]]).storeKey;
        Store *storeForFind = [[self dataController] storeForKey:_storeKey];
        if (storeForFind) {
            self.LabelCity.text = storeForFind.city;
            self.LabelName.text = storeForFind.name;
        }
    }
    
    NSLog(@"done");
}*/
- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"UnwindSelectCategory"]) {
        CategorySelectViewController *categoryController = [segue sourceViewController];
        [self.dataController refresh];
        /*NSArray *selectedRows = [[categoryController tableView] indexPathsForSelectedRows];
        NSEnumerator *row = [selectedRows objectEnumerator];
        NSIndexPath *indexPath = [[NSIndexPath alloc] init];
        NSMutableArray *tempCategoryArray = [[NSMutableArray alloc] init];
        while ( indexPath = [row nextObject])
        {
            CustomDynamicCell *cdc = [[categoryController tableView] cellForRowAtIndexPath:indexPath];
            if (cdc.categoryKey != nil)
            {
                [tempCategoryArray addObject:cdc.categoryKey];
            }
        }
         */
        //_categoryKeys = [[NSArray alloc] initWithArray:tempCategoryArray];
        _categoryKeys = [[NSArray alloc] initWithArray:[categoryController selections]];
        _categoryKey = [[self categoryKeys] objectAtIndex:0];
        //Category *categoryForFind = [[self dataController] categoryForKey:_categoryKey];
        NSEnumerator *categories = [_categoryKeys objectEnumerator];
        NSNumber *c = [[NSNumber alloc] init];
        NSString *categoryList = [[NSString alloc] init];
        c = [categories nextObject];
        //Category *cat = [[self dataController] categoryForKey:c];
        categoryList = [categoryList stringByAppendingString:[[[self dataController] categoryForKey:c] name]];
        while ( c = [categories nextObject] )
        {
            categoryList = [categoryList stringByAppendingString:@", "];
            categoryList = [categoryList stringByAppendingString:[[[self dataController] categoryForKey:c] name]];
        }
        NSLog(@"%@", categoryList);
        [[self TextViewCategories] setText:categoryList];
 
    }
    if ([[segue identifier] isEqualToString:@"UnwindSelectStore"]) {
        StoreSelectViewController *storeController = [segue sourceViewController];
        [self.dataController  refresh];
        _storeKey = ((CustomDynamicCell *)[[storeController tableView] cellForRowAtIndexPath:[[storeController tableView] indexPathForSelectedRow]]).storeKey;
        Store *storeForFind = [[self dataController] storeForKey:_storeKey];
        if (storeForFind) {
            self.LabelCity.text = storeForFind.city;
            self.LabelName.text = storeForFind.name;
        }
    }
    
    
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
