//
//  DieLabel.m
//  Farkle
//
//  Created by Andrew Liu on 10/29/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "DieLabel.h"
#import  <UIKit/UIKit.h>
@implementation DieLabel

- (void)roll
{
    int randomNumber = arc4random_uniform(6) + 1;
    self.text = [NSString stringWithFormat:@"%d", randomNumber];
}


-(IBAction)onTapped:(UITapGestureRecognizer *)sender
{
    [self.delegate dieTapped:self];
}




@end
