//
//  Wire.h
//  ZuwireApp
//
//  Created by Wes Bangerter on 6/21/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Wire : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * post;
@property (nonatomic, retain) NSString * createdAt;
@property (nonatomic, retain) NSString * userHandle;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSNumber * commentsCount;
@property (nonatomic, retain) NSNumber * propsCount;
@property (nonatomic, retain) NSNumber * rewiresCount;
@property (nonatomic, retain) NSString * userAvatarURL;

@end
