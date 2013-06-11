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
@property (strong, nonatomic) IBOutlet UILabel *wireStats;
@property (strong, nonatomic) IBOutlet UILabel *userFullName;
@property (strong, nonatomic) IBOutlet UILabel *userHandle;
@property (strong, nonatomic) IBOutlet UIImageView *userAvatar;
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
    self.userFullName.text = self.wireDictionary[@"user_full_name"];
    self.userHandle.text = [NSString stringWithFormat:@"@%@", self.wireDictionary[@"user_handle"]];
    self.userAvatar.image = [WiresFetcher getUserAvatar:self.wireDictionary[@"user_avatar_url"]];
    self.wireStats.text = [NSString stringWithFormat:@"Props: %lu Comments: %lu", (unsigned long)[self.wireDictionary[@"comments"] count],
    (unsigned long)[self.wireDictionary[@"props"] count]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self resetWireShow];
}

@end
