//
//  ViewController.m
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 13/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#include <UIKit/UIKit.h>
#import "ViewController.h"
#import "STJobTableCell.h"
#import "AppDelegate.h"
#import "STDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *jobsArray;
@property (nonatomic) NSInteger myIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIButton *leftButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"preferences.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"preferencesSelected.png"] forState:UIControlStateHighlighted];
    [leftButton setImage:[UIImage imageNamed:@"preferencesSelected.png"] forState:UIControlStateSelected];
    [leftButton setFrame:CGRectMake(0, 0, self.segmentedControl.frame.size.height, self.segmentedControl.frame.size.height)];
    [leftButton addTarget:self.navigationItem.leftBarButtonItem.target action:self.navigationItem.leftBarButtonItem.action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem.customView = leftButton;
    
    UIButton *rightButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"addButtonUnselected.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateHighlighted];
    [rightButton setImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateSelected];
    [rightButton setFrame:CGRectMake(0, 0, self.segmentedControl.frame.size.height, self.segmentedControl.frame.size.height)];
    [rightButton addTarget:self.navigationItem.rightBarButtonItem.target action:self.navigationItem.rightBarButtonItem.action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem.customView = rightButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Job"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    self.jobsArray = objects;
    
    [self.tableView reloadData];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    self.payButton.layer.cornerRadius = self.payButton.frame.size.height / 2;
    self.payButton.clipsToBounds = YES;
     
    self.segmentedControl.layer.cornerRadius = self.segmentedControl.frame.size.height / 2;
    self.segmentedControl.clipsToBounds = YES;
    
    self.segmentedControl.layer.borderColor = [[UIColor colorWithRed:62/255.0 green:164/255.0 blue:236/255.0 alpha:1] CGColor];
    self.segmentedControl.layer.borderWidth = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    STJobTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[STJobTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *pounds = @"£";
    pounds = [pounds stringByAppendingString:[self.jobsArray[indexPath.row] valueForKey:@"quote"]];
    
    NSString *name = [self.jobsArray[indexPath.row] valueForKey:@"firstName"];
    name = [name stringByAppendingString:@" "];
    name = [name stringByAppendingString:[self.jobsArray[indexPath.row] valueForKey:@"lastName"]];
    
    cell.jobLabel.text = [self.jobsArray[indexPath.row] valueForKey:@"jobName"];
    cell.dateLabel.text = [self.jobsArray[indexPath.row] valueForKey:@"endDate"];
    cell.customerLabel.text = name;
    cell.priceLabel.text = pounds;
    
    if ([[self.jobsArray[indexPath.row] valueForKey:@"status"] isEqualToString:@"completed"]) {
        cell.jobStatusView.backgroundColor = [UIColor greenColor];
    } else {
        cell.jobStatusView.backgroundColor = [UIColor colorWithRed:62/255.0 green:164/255.0 blue:236/255.0 alpha:1];
    }
    
    return cell;
};

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.jobsArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.myIndex = indexPath.row;
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        AppDelegate *appDelegate =
        [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context =
        [appDelegate managedObjectContext];
        
        NSEntityDescription *entityDesc =
        [NSEntityDescription entityForName:@"Job"
                    inManagedObjectContext:context];
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDesc];
        
        
        NSError *error;
        NSArray *objects = [context executeFetchRequest:request
                                                  error:&error];
        
        [context deleteObject:objects[indexPath.row]];

        
        [context save:&error];
        
        self.jobsArray = [context executeFetchRequest:request
                                                  error:&error];
        
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        [tableView reloadData];
    }
}

- (IBAction)popAdd:(id)sender {
    [self performSegueWithIdentifier:@"showAdd" sender:self];
}

- (void)openAdd {
    [self performSegueWithIdentifier:@"showAdd" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        // Get destination view
        STDetailViewController *vc = [segue destinationViewController];
 
        vc.firstName = [self.jobsArray[self.myIndex] valueForKey:@"firstName"];
        vc.lastName = [self.jobsArray[self.myIndex] valueForKey:@"lastName"];
        vc.phoneNumber = [self.jobsArray[self.myIndex] valueForKey:@"phoneNumber"];
        vc.jobTitle = [self.jobsArray[self.myIndex] valueForKey:@"jobName"];
        vc.startDate = [self.jobsArray[self.myIndex] valueForKey:@"startDate"];
        vc.endDate = [self.jobsArray[self.myIndex] valueForKey:@"endDate"];
        
    }
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    [self.searchBar resignFirstResponder];
}


@end
