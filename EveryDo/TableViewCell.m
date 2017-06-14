//
//  TableViewCell.m
//  ToDoList
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "TableViewCell.h"


@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UISwipeGestureRecognizer *swipe1Gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwipe:)];
    swipe1Gesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self addGestureRecognizer:swipe1Gesture];
}

-(void)viewSwipe:(UISwipeGestureRecognizer *)sender{
    //When the gesture fires, update your data model objects and rearrange your list
    
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionRight:{
            NSLog(@"I GOT SWIPED!!");
            [self.delegate tableViewCellDidSwipe:self];
            break;
        default: ;
            break;
        }
            break;
    }
}



-(void) displayDetails:(NSMutableArray *)todoArray{
    
    //Create a custom UITableViewCell subclass that displays
    //a) the title,
    //b) a one-line preview of the task description,
    //c) the priority level,
    //d) and strikethrough text of all other text if the task is completed.
    
    //i guess iterate thru the array and display each item
    
    //This will require you to implement the delegate and data source methods to display a cell for each todo item.
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
