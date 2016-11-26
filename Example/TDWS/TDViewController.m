//
//  TDViewController.m
//  TDWS
//
//  Created by Anonymous on 11/26/2016.
//  Copyright (c) 2016 Anonymous. All rights reserved.
//

#import "TDViewController.h"
#import <TDWS/TDWS.h>

@interface TDViewController ()

@end

@implementation TDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [TDService callAPI:HTTP_METHOD_GET path:@"p" parameters:@{@"appversion": @"v3"} completed:^(id res, NSError *error) {
        NSLog(@"%@",res);
    }];
}

@end
