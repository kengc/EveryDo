//
//  ToDo.m
//  ToDoList
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString *)title andDescription:(NSString *)desc andPriority:(int)priority
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = desc;
        _isCompleted = NO;
        _priorityNumber = priority;
    }
    return self;
}


@end
