//
//  MasterViewController.m
//  EveryDo
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "TableViewCell.h"
#import "AddTodoViewController.h"


@interface MasterViewController ()

@property NSMutableArray *objects;

@property (nonatomic) NSMutableArray *todoArray;

@property (nonatomic) TableViewCell *tableCell;

@property (nonatomic, strong) NSIndexPath *currentlySelectedIndexPath;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    
    //////////my stuff/////////

    
    self.tableCell = [[TableViewCell alloc] init];
    self.todoArray = [[NSMutableArray alloc] init];
    ToDo *task1 = [[ToDo alloc] initWithTitle:@"Task1" andDescription:@"gotta get this task done" andPriority:0];
    ToDo *task2 = [[ToDo alloc] initWithTitle:@"Task2" andDescription:@"gotta get another task done" andPriority:1];
    ToDo *task3 = [[ToDo alloc] initWithTitle:@"Task3" andDescription:@"yet another task" andPriority:2];
    task3.isCompleted = YES;
    
    [self.todoArray addObject:task1];
    [self.todoArray addObject:task2];
    [self.todoArray addObject:task3];
    
    [self.tableCell displayDetails:self.todoArray];
    
    
    //////////my stuff/////////
    
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    [self performSegueWithIdentifier:@"ShowAddNewTodo" sender:self];

}

#pragma mark - Table View Delegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   NSLog(@"Table view cell tapped at row: %li", (long)indexPath.row);
    
    self.currentlySelectedIndexPath = indexPath;
    
    //[self performSegueWithIdentifier:@"showDetail" sender:self];
    
    // Needs refactoring for drinks
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *todo = self.todoArray[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:todo];
    }
    
    if ([[segue identifier] isEqualToString:@"ShowAddNewTodo"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *todo = self.todoArray[indexPath.row];
        AddTodoViewController *controller = (AddTodoViewController *)[segue destinationViewController];
        controller.delegate = self;
        [controller setDetailItem:todo];
    }
    
//    if ([[segue identifier] isEqualToString:@"EditDetails"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        ToDo *todo = self.todoArray[indexPath.row];
//        AddTodoViewController *controller = (AddTodoViewController *)[segue destinationViewController];
//        [controller setDetailItem:todo];
//    }
    
    
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
//        [controller setDetailItem:object];
//    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    
    // Setup our cell and hand it to the table view
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell"];
    
//    NSString *title;
//    if (indexPath.section == 0) {
//        title = self.foods[indexPath.row];
//    } else if (indexPath.section == 1) {
//        title = self.drinks[indexPath.row];
//    }
    
    ToDo *todo = self.todoArray[indexPath.row];
    
    cell.titleVarOutlet.text = todo.title;
    
    if(todo.isCompleted){
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:todo.todoDescription attributes:@{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleNone)}];
        
        NSRange range = NSMakeRange(0, todo.todoDescription.length);
        
        [string addAttributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)} range:range];
        
         cell.descOutletVar.attributedText = string;
    } else{
         cell.descOutletVar.text = todo.todoDescription;
    }
    
    //BOOL isKind= [todo.isCompleted isKindOfClass:[NSString class]];

    cell.isDoneOutletVar.text = [NSString stringWithFormat:@"Complete: %s", todo.isCompleted ? "YES" : "NO"];
    cell.priorityOutletVar.text = [NSString  stringWithFormat:@"Priority: %d", todo.priorityNumber];
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)AddNewTodo:(ToDo *)todo{
    if(todo){
        //add to the array
        [self.todoArray addObject:todo];
        [self.tableView reloadData];
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
