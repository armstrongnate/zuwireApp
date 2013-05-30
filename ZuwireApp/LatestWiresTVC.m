//
//  LatestWiresTVC.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/29/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "LatestWiresTVC.h"

@interface LatestWiresTVC ()

@end

@implementation LatestWiresTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSURL *wiresUrl = [NSURL URLWithString:@"http://zuwire.com.dev/api/v1/wires"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:wiresUrl];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.wires = dataDictionary[@"wires"];
}


@end
