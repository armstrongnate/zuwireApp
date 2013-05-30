//
//  ZuwireTVC.m
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/29/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "ZuwireTVC.h"

@interface ZuwireTVC ()

@end

@implementation ZuwireTVC

- (void)setWires:(NSArray *)wires
{
    _wires = wires;
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"Show Wire"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setWireURL:)]) {
                    NSURL *url = [NSURL URLWithString:self.wires[indexPath.row][@"id"]];
                    [segue.destinationViewController performSelector:@selector(setWireURL:) withObject:url];
                }
            }
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSString *)titleForRow:(NSUInteger)row
{
    return self.wires[row][@"post"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Wire Row";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self titleForRow:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    
    return cell;
}

@end
