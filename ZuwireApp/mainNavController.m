//
//  mainNavController.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/31/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "mainNavController.h"

@interface mainNavController ()

@end

@implementation mainNavController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.mainTitleBar.title = @"Hello?";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
