//
//  Message+API.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/16/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "Message+API.h"
#import "Conversation+Create.h"

@implementation Message (API)

+ (Message *)messageWithApiInfo:(NSDictionary *)messageDictionary inManagedObjectContext:(NSManagedObjectContext *)context
{
    Message *message = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Message"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", messageDictionary[@"id"]];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || [matches count] > 1) {
        // handle error
    } else if (![matches count]) {
        message = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:context];
        message.unique = messageDictionary[@"id"];
        message.content = messageDictionary[@"content"];
        message.receivedAt = messageDictionary[@"created_at"];
        message.sender = messageDictionary[@"sender_full_name"];
        message.senderAvatarURL = messageDictionary[@"sender_avatar_url"];
        
    } else {
        message = [matches lastObject];
    }
    

    
    return message;
}

@end
