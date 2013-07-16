//
//  ConversationCDTVC.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 7/16/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "ConversationCDTVC.h"
#import "Conversation.h"

@implementation ConversationCDTVC

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    if (managedObjectContext) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Conversation"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"updatedAt" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = nil;
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
    } else {
        self.fetchedResultsController = nil;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Conversation Row" forIndexPath:indexPath];
    
    Conversation *conversation = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", conversation.partnerName];
    cell.detailTextLabel.text = conversation.snippet;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:conversation.partnerAvatarURL]]];
    cell.imageView.image = image;
    
    return cell;
}


@end
