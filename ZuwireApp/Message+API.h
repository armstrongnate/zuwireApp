//
//  Message+API.h
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/16/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "Message.h"

@interface Message (API)

+ (Message *)messageWithApiInfo:(NSDictionary *)messageDictionary
         inManagedObjectContext:(NSManagedObjectContext *)context;

@end
