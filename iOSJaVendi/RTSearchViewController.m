//
//  RTSearchViewController.m
//  iOSJaVendi
//
//  Created by Robson Ribeiro on 9/24/14.
//  Copyright (c) 2014 rob. All rights reserved.
//

#import "RTSearchViewController.h"
#import "RTSwipeableAdsViewController.h"

@interface RTSearchViewController ()
@end

@implementation RTSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.priceRanges = @[@"até 300", @"300 - 700", @"700 - 1000", @"Mais de 1000"];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)searchTableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)searchTableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)searchTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *searchCell = [[UITableViewCell alloc]init];
    switch (indexPath.row) {
        case 0:
            searchCell = [searchTableView dequeueReusableCellWithIdentifier:@"KeyWordCell" forIndexPath:indexPath];
            break;
        case 1:
            searchCell = [searchTableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
            break;
        case 2:
            searchCell = [searchTableView dequeueReusableCellWithIdentifier:@"PriceCell" forIndexPath:indexPath];
            break;
        case 3:
            searchCell = [searchTableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
            break;
        default:
            break;
    }
    
    return searchCell;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int count = 0;
    for (int i = 0; i <= 2; i++)
    {
        if ([pickerView.restorationIdentifier isEqualToString:@"CategoriesPicker"])
        {
            count = (int)self.categories.count;
        }
        else
        {
            count = (int)self.priceRanges.count;
        }
        
    }
    return count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [[NSString alloc]init];
    for (int i = 0; i <= 2; i++)
    {
        if ([pickerView.restorationIdentifier isEqualToString:@"CategoriesPicker"])
        {
            title = [self.categories objectAtIndex:row];
        }
        else
        {
            title = [self.priceRanges objectAtIndex:row];
        }
        
    }
    return title;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushFromSearch"]) {
        UITextField *keyWord = (UITextField *)[self.view viewWithTag:31];
        
        UIPickerView *categoryPicker = (UIPickerView *)[self.view viewWithTag:21];
        UIPickerView *pricesPicker = (UIPickerView *) [self.view viewWithTag:22];
        
        NSString *selectedCategory = [self.categories objectAtIndex:[categoryPicker selectedRowInComponent:0]];
        NSString *selectedPrice = [self.priceRanges objectAtIndex:[pricesPicker selectedRowInComponent:0]];
        NSString *inputKeyWord = (NSString *)keyWord.text;
        
        RTSwipeableAdsViewController *svc = [segue destinationViewController];
        svc.stringOne = inputKeyWord;
        svc.stringTwo = selectedCategory;
        svc.stringThree = selectedPrice;
    }
    
}

- (IBAction)searchButtonPressed:(id)sender
{
    UITextField *keyWord = (UITextField *)[self.view viewWithTag:31];
    
    UIPickerView *categoryPicker = (UIPickerView *)[self.view viewWithTag:21];
    UIPickerView *pricesPicker = (UIPickerView *) [self.view viewWithTag:22];
    
    NSString *selectedCategory = [self.categories objectAtIndex:[categoryPicker selectedRowInComponent:0]];
    NSString *selectedPrice = [self.priceRanges objectAtIndex:[pricesPicker selectedRowInComponent:0]];
    NSString *inputKeyWord = (NSString *)keyWord.text;
    NSString *alertString = [[NSString alloc]initWithFormat:@"%@ %@ %@", selectedCategory, selectedPrice, inputKeyWord];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:alertString message:@"yay" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
}
@end
