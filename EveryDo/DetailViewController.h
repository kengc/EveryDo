//
//  DetailViewController.h
//  EveryDo
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailIsDone;
@property (weak, nonatomic) IBOutlet UILabel *DetailPriority;
@property (weak, nonatomic) IBOutlet UITextView *detailDescription;

@end

