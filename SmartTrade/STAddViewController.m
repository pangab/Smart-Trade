//
//  STAddViewController.m
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 15/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import "STAddViewController.h"
#import "AppDelegate.h"


@interface STAddViewController ()



@end

@implementation STAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDate *Date=[NSDate date];
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"ccc d MMM"];
    
    NSString *startDate = [outputFormatter stringFromDate:Date];
    
    self.currentDate = [startDate stringByAppendingString:@" -"];
    
    self.datePicker.minimumDate=Date;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    [super viewWillAppear:YES];
    
    self.scrollView.contentSize = self.view.frame.size;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.scrollView setContentOffset:CGPointMake(0,textField.center.y-140) animated:YES];//you can set your  y cordinate as your req also
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self.scrollView setContentOffset:CGPointMake(0,0) animated:YES];
    
    
    return YES;
}

- (IBAction)saveAction:(id)sender {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"ccc d MMM"];
    
    NSString *endDate = [outputFormatter stringFromDate:self.datePicker.date];
    
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newJob;
    newJob = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Job"
                  inManagedObjectContext:context];
    [newJob setValue: _firstNameField.text forKey:@"firstName"];
    [newJob setValue: _lastNameField.text forKey:@"lastName"];
    [newJob setValue: self.currentDate forKey:@"startDate"];
    [newJob setValue: endDate forKey:@"endDate"];
    [newJob setValue: _priceField.text forKey:@"quote"];
    [newJob setValue: _telephoneField.text forKey:@"phoneNumber"];
    [newJob setValue: _jobField.text forKey:@"jobName"];
    
    if (self.segmentedField.selectedSegmentIndex == 0) {
        [newJob setValue: @"ongoing" forKey:@"status"];
    } else {
        [newJob setValue: @"completed" forKey:@"status"];
    }

    NSError *error;
    [context save:&error];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
