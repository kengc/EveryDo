//
//  AddTodoViewController.m
//  EveryDo
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "AddTodoViewController.h"


@interface AddTodoViewController ()



@end

@implementation AddTodoViewController


- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
//        self.detailTitle.text = [self.detailItem title];
//        
//        NSString *isDone = [NSString stringWithFormat:@"Complete: %s", [self.detailItem isCompleted]? "YES" : "NO"];
//        self.detailIsDone.text = isDone;
//        
//        self.DetailPriority.text = [NSString  stringWithFormat:@"Priority: %d", [self.detailItem priorityNumber]];
//        self.detailDescription.text = [self.detailItem todoDescription];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addNewTodo:(UIButton *)sender {
    ToDo *todo = [[ToDo alloc] init];
    
    todo.title = self.titleOutlet.text;

    todo.priorityNumber = [self.priorityOutlet.text integerValue];
    todo.todoDescription = self.detailOutlet.text;
    todo.isCompleted = NO;
    
    //delegate back to VC
    [self.delegate AddNewTodo:todo];
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
