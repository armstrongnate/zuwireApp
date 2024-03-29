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
    NSString *wiresUrlString = [NSString stringWithFormat:@"%@/%@", @"http://zuwire.com.10.0.1.7.xip.io/api/v1/wires", wireId];
    NSURL *wiresUrl = [NSURL URLWithString:wiresUrlString];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:wiresUrl];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    return dataDictionary;
}

+ (NSArray *)getLatestWires
{
    NSURL *wiresUrl = [NSURL URLWithString:@"http://zuwire.com.10.0.1.7.xip.io/api/v1/wires"];

    NSData *jsonData = [NSData dataWithContentsOfURL:wiresUrl];

    NSError *error = nil;

    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

    return dataDictionary[@"wires"];
}

+ (UIImage *)getUserAvatar:(NSString *)userAvatarUrl;
{
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:userAvatarUrl]]];
    return image;
}

@end
