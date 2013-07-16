//
//  ConversationsFetcher.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/16/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "ConversationsFetcher.h"

@implementation ConversationsFetcher

+ (NSArray *)getLatestConversations
{
    NSURL *wiresUrl = [NSURL URLWithString:@"http://zuwire.com.dev/api/v1/conversations"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:wiresUrl];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    return dataDictionary[@"conversations"];
}

@end
