//
//  WiresFetcher.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/29/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "WiresFetcher.h"

@implementation WiresFetcher

+ (NSDictionary *)getWireWithId:(NSString *)wireId
{
    NSString *wiresUrlString = [NSString stringWithFormat:@"%@/%@", @"http://zuwire.com.dev/api/v1/wires", wireId];
    NSLog(wiresUrlString);
    NSURL *wiresUrl = [NSURL URLWithString:wiresUrlString];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:wiresUrl];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    return dataDictionary;
}

@end
