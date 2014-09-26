//
//  ViewController.m
//  iOSJaVendi
//
//  Created by Robson Ribeiro on 9/24/14.
//  Copyright (c) 2014 rob. All rights reserved.
//

#import "RTBaseViewController.h"

@interface RTBaseViewController ()

@end

@implementation RTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackground:self.background];
    self.categories = @[@"Celulares", @"Informática", @"Carros",
                        @"Para Casa", @"Arte e Lazer", @"Tablets",
                        @"Moda e Beleza", @"Eletrônicos", @"Bebê e Criança",
                        @"Vídeo-Game", @"Esportes", @"Outros"];
}

-(void)setBackground:(UIImageView *)background
{
    UIImage *bg = [UIImage imageNamed:@"background.png"];
    background = [[UIImageView alloc]initWithImage:bg];
    background.frame = CGRectMake(0, 0, 400, 800);
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
}

@end
