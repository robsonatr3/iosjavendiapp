//
//  RTSwipeableAdsViewController.h
//  iOSJaVendi
//
//  Created by Robson Ribeiro on 9/25/14.
//  Copyright (c) 2014 rob. All rights reserved.
//

#import "RTBaseViewController.h"

@interface RTSwipeableAdsViewController : RTBaseViewController

@property (strong, nonatomic) NSString *stringOne;
@property (strong, nonatomic) NSString *stringTwo;
@property (strong, nonatomic) NSString *stringThree;

@property (strong, nonatomic) IBOutlet UILabel *labelOne;
@property (strong, nonatomic) IBOutlet UILabel *labelTwo;
@property (strong, nonatomic) IBOutlet UILabel *labelThree;

@end
