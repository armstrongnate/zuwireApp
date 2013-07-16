//
//  Conversation.h
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/16/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Message;

@interface Conversation : NSManagedObject

@property (nonatomic, retain) NSNumber * partnerId;
@property (nonatomic, retain) NSString * snippet;
@property (nonatomic, retain) NSNumber * unique;
@property (nonatomic, retain) NSString * updatedAt;
@property (nonatomic, retain) NSString * partnerName;
@property (nonatomic, retain) NSString * partnerAvatarURL;
@property (nonatomic, retain) NSSet *messages;
@end

@interface Conversation (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(Message *)value;
- (void)removeMessagesObject:(Message *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

@end
