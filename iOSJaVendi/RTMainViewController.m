//
//  RTMainViewController.m
//  iOSJaVendi
//
//  Created by Robson Ribeiro on 9/24/14.
//  Copyright (c) 2014 rob. All rights reserved.
//

#import "RTMainViewController.h"

@interface RTMainViewController ()

@end

@implementation RTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)categoriesTableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)categoriesTableView numberOfRowsInSection:(NSInteger)section
{
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)categoriesTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *categoriesCell = [categoriesTableView dequeueReusableCellWithIdentifier:@"CategoriesCell" forIndexPath:indexPath];
    
    UILabel *categoryName = (UILabel *)[self.view viewWithTag:1];
    categoryName.text = self.categories[indexPath.row];
    
    return categoriesCell;
}

@end
