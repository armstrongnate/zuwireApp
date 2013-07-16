//
//  Conversation+Create.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/16/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "Conversation+Create.h"
#import "Message+API.h"

@implementation Conversation (Create)

+ (Conversation *)conversationWithApiInfo:(NSDictionary *)conversationDictionary
                   inManagedObjectContext:(NSManagedObjectContext *)context
{
    Conversation *conversation = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Conversation"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", conversationDictionary[@"id"]];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || [matches count] > 1) {
        // handle error
    } else if (![matches count]) {
        conversation = [NSEntityDescription insertNewObjectForEntityForName:@"Conversation" inManagedObjectContext:context];
        conversation.unique = conversationDictionary[@"id"];
        conversation.snippet = conversationDictionary[@"snippet"];
        conversation.updatedAt = conversationDictionary[@"last_message_at"];
        conversation.partnerId = conversationDictionary[@"user"][@"id"];
        conversation.partnerName = conversationDictionary[@"user"][@"name"];
        conversation.partnerAvatarURL = conversationDictionary[@"user"][@"avatar_url"];
        for (NSDictionary *messageDictionary in conversationDictionary[@"messages"])
        {
            Message *message = [Message messageWithApiInfo:messageDictionary inManagedObjectContext:context];
            message.conversation = conversation;
        }
    } else {
        conversation = [matches lastObject];
    }
    
    
    
    return conversation;
}

@end
