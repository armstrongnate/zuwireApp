//
//  ProfileViewController.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 6/3/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "ProfileViewController.h"
#import "WiresFetcher.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:CURRENT_AVATAR_URL]]];
    self.profilePicture.image = image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
