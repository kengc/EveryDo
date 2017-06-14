//
//  TableViewCell.h
//  ToDoList
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class TableViewCell;

@protocol TableViewCellDelegate <NSObject>

-(void)tableViewCellDidSwipe:(TableViewCell *)cell;

@end

@interface TableViewCell : UITableViewCell

//can set properties of the cell that the VC sets just to get (VC) them back later


@property (weak, nonatomic) id<TableViewCellDelegate> delegate;

//@property (weak, nonatomic) IBOutlet UILabel *titleOutletVar;
@property (weak, nonatomic) IBOutlet UILabel *titleVarOutlet;

@property (weak, nonatomic) IBOutlet UILabel *priorityOutletVar;

@property (weak, nonatomic) IBOutlet UILabel *descOutletVar;
@property (weak, nonatomic) IBOutlet UILabel *isDoneOutletVar;


-(void) displayDetails:(NSMutableArray *)todoArray;




@end
