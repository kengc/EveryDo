//
//  TableViewCell.h
//  ToDoList
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

//@property (weak, nonatomic) IBOutlet UILabel *titleOutletVar;
@property (weak, nonatomic) IBOutlet UILabel *titleVarOutlet;

@property (weak, nonatomic) IBOutlet UILabel *priorityOutletVar;

@property (weak, nonatomic) IBOutlet UILabel *descOutletVar;
@property (weak, nonatomic) IBOutlet UILabel *isDoneOutletVar;


-(void) displayDetails:(NSMutableArray *)todoArray;




@end
