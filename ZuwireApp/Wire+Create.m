//
//  Wire+Create.m
//  ZuwireApp
//
//  Created by Wes Bangerter on 6/21/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "Wire+Create.h"
#import "WiresFetcher.h"

@implementation Wire (Create)

+ (Wire *)wireWithApiInfo:(NSDictionary *)wireDictionary inManagedObjectContext:(NSManagedObjectContext *)context
{
    Wire *wire = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Wire"];
    request.predicate = [NSPredicate predicateWithFormat:@"id = %@", wireDictionary[@"id"]];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if(!matches || ([matches count] > 1)) {
        // errors
    } else if(![matches count]){
        // wire isn't in db, create it
        wire = [NSEntityDescription insertNewObjectForEntityForName:@"Wire" inManagedObjectContext:context];
        wire.id = wireDictionary[@"id"];
        wire.post = wireDictionary[@"post"];
        wire.userHandle = wireDictionary[@"user_handle"];
        wire.userName = wireDictionary[@"user_name"];
        wire.userAvatarURL = wireDictionary[@"user_avatar_url"];
        wire.commentsCount = wireDictionary[@"comments_count"];
        wire.propsCount = wireDictionary[@"props_count"];
        wire.rewiresCount = wireDictionary[@"rewires_count"];
        wire.createdAt = wireDictionary[@"created_at"];
    } else {
        wire = [matches lastObject];
    }
    
    return wire;
}

@end
