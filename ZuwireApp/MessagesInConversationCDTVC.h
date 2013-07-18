//
//  MessagesInConversationCDTVC.h
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/18/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Conversation.h"

@interface MessagesInConversationCDTVC : CoreDataTableViewController

@property (nonatomic, strong) Conversation *conversation;

@end
