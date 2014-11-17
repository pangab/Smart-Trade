//
//  STJobTableCell.h
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 13/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STJobTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *jobStatusView;
@property (weak, nonatomic) IBOutlet UIView *separatorView;
@property (weak, nonatomic) IBOutlet UILabel *customerLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end