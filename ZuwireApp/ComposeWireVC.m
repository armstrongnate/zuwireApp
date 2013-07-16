//
//  ComposeWireVC.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/11/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "ComposeWireVC.h"

@interface ComposeWireVC ()
@property (strong, nonatomic) IBOutlet UILabel *header;

@end

@implementation ComposeWireVC

- (void)viewDidLoad
{
    NSLog(@"View did load");
    self.title = @"Compose";
    self.header.text = @"Compose new Wire";
}
@end
