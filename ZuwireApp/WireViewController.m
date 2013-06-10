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
    self.wireDictionary = [WiresFetcher getWireWithId:[self.wireURL absoluteString]];
    [self resetWireShow];
}

- (void)resetWireShow
{
    self.wirePostLabel.text = @"";
    self.wirePostLabel.text = self.wireDictionary[@"post"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self resetWireShow];
}

@end
