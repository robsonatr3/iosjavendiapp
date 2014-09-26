//
//  RTSearchViewController.h
//  iOSJaVendi
//
//  Created by Robson Ribeiro on 9/24/14.
//  Copyright (c) 2014 rob. All rights reserved.
//

#import "RTBaseViewController.h"

@interface RTSearchViewController : RTBaseViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *priceRanges;
@property (nonatomic, strong) IBOutlet UITableView *searchTableView;

@end
