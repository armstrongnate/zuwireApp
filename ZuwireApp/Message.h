//
//  Message.h
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/16/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Conversation;

@interface Message : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * receivedAt;
@property (nonatomic, retain) NSString * sender;
@property (nonatomic, retain) NSString * senderAvatarURL;
@property (nonatomic, retain) NSNumber * unique;
@property (nonatomic, retain) Conversation *conversation;

@end
