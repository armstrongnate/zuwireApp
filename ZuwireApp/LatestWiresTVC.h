//
//  LatestWiresTVC.h
//  ZuwireApp
//
//  Created by Nate Armstrong on 5/29/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LatestWiresTVC : UITableViewController

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

@property (nonatomic, strong) NSArray *wires; // of NSDictionary

@end
