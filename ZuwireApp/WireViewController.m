//
//  WireViewController.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/29/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "WireViewController.h"
#import "WiresFetcher.h"

@interface WireViewController ()
@property (strong, nonatomic) IBOutlet UILabel *wirePostLabel;
@end

@implementation WireViewController

- (void)setWireURL:(NSURL *)wireURL
{
    _wireURL = wireURL;
    [self resetWireShow];
}

- (void)resetWireShow
{
    self.wirePostLabel.text = @"";
    self.wirePostLabel.text = [WiresFetcher getWireWithId:[self.wireURL absoluteString][@"post"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self resetWireShow];
}

@end
