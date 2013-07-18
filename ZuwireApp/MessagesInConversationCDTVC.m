//
//  MessagesInConversationCDTVC.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/18/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "MessagesInConversationCDTVC.h"
#import "Message.h"

@implementation MessagesInConversationCDTVC

- (void)setConversation:(Conversation *)conversation
{
    _conversation = conversation;
    [self setupFetchedResultsController];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Message"];
    Message *message = [self.fetchedResultsController objectAtIndexPath:indexPath];

    cell.textLabel.text = message.content;
    return cell;
}

- (void)setupFetchedResultsController
{
    if (self.conversation.managedObjectContext) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Message"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"receivedAt" ascending:YES]];
        request.predicate = [NSPredicate predicateWithFormat:@"conversation = %@", self.conversation];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:self.conversation.managedObjectContext sectionNameKeyPath:nil
                                                                                       cacheName:nil];
    } else {
        self.fetchedResultsController = nil;
    }
}

@end
