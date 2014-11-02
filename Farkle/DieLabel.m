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
    if ([self.text isEqual: @"1"])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceOne"]];
    }
    else if ([self.text isEqual: @"2"])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceTwo"]];
    }
    else if ([self.text isEqual: @"3"])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceThree"]];
    }
    else if ([self.text isEqual: @"4"])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceFour"]];
    }
    else if ([self.text isEqual: @"5"])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceFive"]];
    }
    else if ([self.text isEqual: @"6"])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceSix"]];
    }
}


-(IBAction)onTapped:(UITapGestureRecognizer *)sender
{
    [self.delegate dieTapped:self];
}




@end
