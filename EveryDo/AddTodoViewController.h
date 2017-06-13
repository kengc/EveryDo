//
//  AddTodoViewController.h
//  EveryDo
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddTodoDelegate <NSObject>

-(void)AddNewTodo:(ToDo *)todo;

@end

@interface AddTodoViewController : UIViewController

@property (weak, nonatomic) id <AddTodoDelegate> delegate;

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextField *titleOutlet;
@property (weak, nonatomic) IBOutlet UITextField *priorityOutlet;
@property (weak, nonatomic) IBOutlet UITextView *detailOutlet;

@end
