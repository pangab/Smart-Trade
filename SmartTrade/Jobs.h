//
//  Jobs.h
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 14/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Jobs : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * endDate;
@property (nonatomic, retain) NSString * startDate;
@property (nonatomic, retain) NSString * quote;
@property (nonatomic, retain) NSString * jobName;
@property (nonatomic) BOOL status;

@end
