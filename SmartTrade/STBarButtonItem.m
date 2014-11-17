//
//  STBarButtonItem.m
//  SmartTrade
//
//  Created by Gabriel Panagiotidis on 16/11/2014.
//  Copyright (c) 2014 Gab. All rights reserved.
//

#import "STBarButtonItem.h"

@implementation STBarButtonItem

-(void)setBackgroundImage:(UIImage *)backgroundImage {
    [self setBackgroundImage:backgroundImage
                    forState:UIControlStateNormal
                  barMetrics:UIBarMetricsCompact];
}

-(UIImage *)backgroundImage {
    return [self backgroundImageForState:UIControlStateNormal
                              barMetrics:UIBarMetricsDefault];
}

@end
