//
//  STDetailViewController.h
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 14/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *paymentButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;

@property(weak, nonatomic) NSString *firstName;
@property(weak, nonatomic) NSString *lastName;
@property(weak, nonatomic) NSString *phoneNumber;
@property(weak, nonatomic) NSString *jobTitle;
@property(weak, nonatomic) NSString *startDate;
@property(weak, nonatomic) NSString *endDate;

@end
