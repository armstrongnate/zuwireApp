//
//  WiresFetcher.h
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/29/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiresFetcher : NSObject
+ (NSDictionary *)getWireWithId:(NSString *)wireId;
+ (NSArray *)getLatestWires;
@end
