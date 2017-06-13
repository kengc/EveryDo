//
//  DetailViewController.m
//  EveryDo
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo.h"

@interface DetailViewController ()


@end

@implementation DetailViewController

#pragma mark - Managing the detail item

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
    
        self.detailTitle.text = [self.detailItem title];
        
        NSString *isDone = [NSString stringWithFormat:@"Complete: %s", [self.detailItem isCompleted]? "YES" : "NO"];
        self.detailIsDone.text = isDone;
        
        self.DetailPriority.text = [NSString  stringWithFormat:@"Priority: %d", [self.detailItem priorityNumber]];
        self.detailDescription.text = [self.detailItem todoDescription];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
