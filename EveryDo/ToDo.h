//
//  ToDo.h
//  ToDoList
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *todoDescription;
@property (nonatomic) int priorityNumber;
@property (nonatomic) BOOL  isCompleted;

- (instancetype)initWithTitle:(NSString *)title andDescription:(NSString *)desc andPriority:(int)priority;

@end
