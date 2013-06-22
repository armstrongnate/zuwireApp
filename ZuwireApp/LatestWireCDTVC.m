//
//  LatestWireCDTVC.m
//  ZuwireApp
//
//  Created by Wes Bangerter on 6/21/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "LatestWireCDTVC.h"
#import "WiresFetcher.h"
#import "Wire+Create.h"
@implementation LatestWireCDTVC

- (IBAction)refresh
{
    [self.refreshControl beginRefreshing];
    dispatch_queue_t fetchQ = dispatch_queue_create("Latest Wire Fetch", NULL);
    dispatch_async(fetchQ, ^{
        NSArray *wires = [WiresFetcher getLatestWires];
        [self.managedObjectContext performBlock:^{
            for (NSDictionary *wire in wires) {
                [Wire wireWithApiInfo:wire inManagedObjectContext:self.managedObjectContext];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.refreshControl endRefreshing];
            });
        }];
    });
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.refreshControl addTarget:self
                            action:@selector(refresh)
                  forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.managedObjectContext) [self useApiDocument];
}

- (void)useApiDocument
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:@"API Document"];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:[url path]]){
        [document saveToURL:url
            forSaveOperation:UIDocumentSaveForCreating
           completionHandler:^(BOOL success) {
               if (success){
                   self.managedObjectContext = document.managedObjectContext;
                   [self refresh];
               }
           }];
    } else if (document.documentState == UIDocumentStateClosed){
        [document openWithCompletionHandler:^(BOOL success) {
            if (success){
                self.managedObjectContext = document.managedObjectContext;
            }
        }];
    } else {
        self.managedObjectContext = document.managedObjectContext;
    }
}

@end
