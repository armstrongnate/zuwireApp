//
//  WiresFetcher.h
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/29/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiresFetcher : NSObject

#define CURRENT_AVATAR_URL @"http://zuwire.com.dev/system/avatars/1/profile/rails.png?1369432354"

+ (NSDictionary *)getWireWithId:(NSString *)wireId;
+ (NSArray *)getLatestWires;
@end
