//
//  STAddViewController.h
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 15/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAddViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *jobField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *telephoneField;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedField;

@property (strong, nonatomic) NSString *currentDate;

- (IBAction)saveAction:(id)sender;
- (IBAction)cancelAction:(id)sender;


@end
