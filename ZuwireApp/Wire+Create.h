//
//  Wire+Create.h
//  ZuwireApp
//
//  Created by Wes Bangerter on 6/21/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "Wire.h"

@interface Wire (Create)

+ (Wire *)wireWithApiInfo:(NSDictionary *)wireDictionary
   inManagedObjectContext:(NSManagedObjectContext *)context;

@end
