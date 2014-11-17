//
//  ViewController.h
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 13/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STBarButtonItem.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *payButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet STBarButtonItem *leftBarButton;
@property (weak, nonatomic) IBOutlet STBarButtonItem *rightBarButton;

- (IBAction)popAdd:(id)sender;

- (void) openAdd;


@end