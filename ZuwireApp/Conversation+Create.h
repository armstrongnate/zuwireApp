//
//  Conversation+Create.h
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/16/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "Conversation.h"

@interface Conversation (Create)

+ (Conversation *)conversationWithApiInfo:(NSDictionary *)conversationDictionary
              inManagedObjectContext:(NSManagedObjectContext *)context;

@end
