//
//  Comment.h
//  7_2_coredata
//
//  Created by Shinya Hirai on 2015/08/18.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * body;

@end
