//
//  LatestWiresTVC.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/29/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "LatestWiresTVC.h"
#import "WiresFetcher.h"

@interface LatestWiresTVC ()

@end

@implementation LatestWiresTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.wires = [WiresFetcher getLatestWires];
}


@end
