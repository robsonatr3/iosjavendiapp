//
//  RTSwipeableAdsViewController.m
//  iOSJaVendi
//
//  Created by Robson Ribeiro on 9/25/14.
//  Copyright (c) 2014 rob. All rights reserved.
//

#import "RTSwipeableAdsViewController.h"

@interface RTSwipeableAdsViewController ()

@end

@implementation RTSwipeableAdsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    self.labelOne.text = self.stringOne;
    self.labelTwo.text = self.stringTwo;
    self.labelThree.text = self.stringThree;
}

@end
