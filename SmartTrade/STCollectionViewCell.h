//
//  STCollectionViewCell.h
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 17/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *threeLabel;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *amountPaidLabel;
@property (weak, nonatomic) IBOutlet UILabel *paymentLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastLabel;
@property (weak, nonatomic) IBOutlet UILabel *depositedLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
