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
        // handle errors
    } else if (![matches count]) {
        conversation = [NSEntityDescription insertNewObjectForEntityForName:@"Conversation" inManagedObjectContext:context];
        [conversation updateConversationAttributes:conversationDictionary inManagedObjectContext:context];
        
    } else {
        conversation = [matches lastObject];
        if (![(NSString*)conversationDictionary[@"last_message_at"] isEqualToString:conversation.updatedAt]) {
            [conversation updateConversationAttributes:conversationDictionary inManagedObjectContext:context];
        }
    }
    
    return conversation;
}

- (Conversation *)updateConversationAttributes:(NSDictionary *)conversationDictionary
            inManagedObjectContext:(NSManagedObjectContext *)context
{
    self.unique = conversationDictionary[@"id"];
    self.snippet = conversationDictionary[@"snippet"];
    self.updatedAt = conversationDictionary[@"last_message_at"];
    self.partnerId = conversationDictionary[@"user"][@"id"];
    self.partnerName = conversationDictionary[@"user"][@"name"];
    self.partnerAvatarURL = conversationDictionary[@"user"][@"avatar_url"];
    for (NSDictionary *messageDictionary in conversationDictionary[@"messages"])
    {
        Message *message = [Message messageWithApiInfo:messageDictionary inManagedObjectContext:context];
        message.conversation = self;
    }

    return self;
}

@end
