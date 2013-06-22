//
//  WireCDTVC.m
//  ZuwireApp
//
//  Created by Wes Bangerter on 6/21/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "WireCDTVC.h"
#import "Wire.h"

@implementation WireCDTVC

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    if (managedObjectContext) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Wire"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = nil;
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
    } else {
        self.fetchedResultsController = nil;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"Show Wire"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setWireURL:)]) {
                    Wire *wire = [self.fetchedResultsController objectAtIndexPath:indexPath];
                    NSURL *url = [NSURL URLWithString:wire.id];
                    [segue.destinationViewController performSelector:@selector(setWireURL:) withObject:url];
                    //[segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
                }
            }
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Wire Row" forIndexPath:indexPath];
 
    Wire *wire = [self.fetchedResultsController objectAtIndexPath:indexPath];

    cell.textLabel.text = wire.post;
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:wire.userAvatarURL]]];
    cell.imageView.image = image;

    return cell;
}

@end
