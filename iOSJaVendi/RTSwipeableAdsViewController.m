//
//  RTSwipeableAdsViewController.m
//  iOSJaVendi
//
//  Created by Robson Ribeiro on 9/25/14.
//  Copyright (c) 2014 rob. All rights reserved.
//

#import "RTSwipeableAdsViewController.h"

@interface RTSwipeableAdsViewController ()

@property (nonatomic, strong) NSMutableData *webData;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation RTSwipeableAdsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getJson];
    
    self.valueIndex = 0;
    
    NSDictionary *feed = [self.adsArray objectAtIndex:self.valueIndex];
    NSDictionary *dicOfEntry = [feed objectForKey:@"ad"];
    int ad = [dicOfEntry[@"id"] integerValue];
}

- (void) viewWillAppear:(BOOL)animated
{
    self.labelOne.text = self.stringOne;
    self.labelTwo.text = self.stringTwo;
    self.labelThree.text = self.stringThree;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"fail with error");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.adsArray = [NSJSONSerialization JSONObjectWithData:self.webData options:0 error:nil];
//    for (int i = 0; i < self.adsArray.count; i++) {
//        NSDictionary *feed = [self.adsArray objectAtIndex:i];
//        NSDictionary *dicOfEntry = [feed objectForKey:@"ad"];
//        int ad = [dicOfEntry[@"id"] integerValue];
//        NSLog(@"%i",ad);
//    }
   
    
//    for (NSDictionary *ad in arrayOfEntry) {
//        NSDictionary *title = [ad objectForKey:@"ad"];
//        NSString *label = [title objectForKey:@"title"];
//        NSLog(label);
//    }
}

- (void)getJson{
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.138:3000/ads.json?category_name=Celulares"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (self.connection) {
        self.webData = [[NSMutableData alloc]init];
    }
    
}
@end
