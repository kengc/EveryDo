//
//  MasterViewController.h
//  EveryDo
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTodoViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, AddTodoDelegate>


@end

