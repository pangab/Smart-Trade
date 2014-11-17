//
//  STDetailViewController.m
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 14/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import "STDetailViewController.h"
#import "STCollectionViewCell.h"

@interface STDetailViewController () <UICollectionViewDataSource>

@end

@implementation STDetailViewController {
    UIImageView *navBarHairlineImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
    UIButton *rightButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"preferences.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"preferencesSelected.png"] forState:UIControlStateHighlighted];
    [rightButton setImage:[UIImage imageNamed:@"preferencesSelected.png"] forState:UIControlStateSelected];
    [rightButton setFrame:CGRectMake(0, 0, 36, 36)];
    [rightButton addTarget:self.navigationItem.rightBarButtonItem.target action:self.navigationItem.rightBarButtonItem.action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem.customView = rightButton;
    
    self.jobLabel.text = self.jobTitle;
    
    self.firstNameLabel.text = self.firstName;
    self.lastNameLabel.text = self.lastName;
    self.phoneLabel.text = self.phoneNumber;
    self.startDateLabel.text = _startDate;
    self.endDateLabel.text = self.endDate;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    self.paymentButton.layer.cornerRadius = self.paymentButton.frame.size.height / 2;
    self.paymentButton.clipsToBounds = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    navBarHairlineImageView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    navBarHairlineImageView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    STCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.contentView.layer.cornerRadius = 7.0f;
    cell.contentView.layer.borderWidth = 1.0f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    cell.depositedLabel.textColor = [UIColor colorWithRed:112.0/255.0 green:227.0/255.0 blue:86.0/255.0 alpha:1];
    cell.topView.backgroundColor = [UIColor colorWithRed:112.0/255.0 green:227.0/255.0 blue:86.0/255.0 alpha:1];
    
    UIImage *image1 = [UIImage imageNamed: @"depositedIcon.png"];
    UIImage *image2 = [UIImage imageNamed: @"sentIcon.png"];
    
    [cell.iconImageView setImage:image1];
    
    if (indexPath.row == 1) {
        
        [cell.iconImageView setImage:image2];
        cell.depositedLabel.textColor = [UIColor colorWithRed:255.0/255.0 green:176.0/255.0 blue:0.0/255.0 alpha:1];
        cell.topView.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:74.0/255.0 blue:62.0/255.0 alpha:1];
        cell.lastLabel.textColor = [UIColor clearColor];
        cell.amountPaidLabel.text = @"Total outstanding:";
        cell.depositedLabel.text = @"SENT";
        cell.paymentLabel.text = @"Invoice";
        cell.amountNumberLabel.text = @"295.56";
        cell.threeLabel.text = @"001";
    }
    
    if (indexPath.row == 2) {
        [cell.iconImageView setImage:image2];
        cell.depositedLabel.textColor = [UIColor colorWithRed:255.0/255.0 green:176.0/255.0 blue:0.0/255.0 alpha:1];
        cell.topView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:176.0/255.0 blue:0.0/255.0 alpha:1];
        cell.lastLabel.textColor = [UIColor clearColor];
        cell.amountPaidLabel.text = @"Total:";
        cell.depositedLabel.text = @"SENT";
        cell.paymentLabel.text = @"Quote";
        cell.amountNumberLabel.text = @"800.00";
        cell.threeLabel.text = @"";
    }
    
    return cell;
}

@end
