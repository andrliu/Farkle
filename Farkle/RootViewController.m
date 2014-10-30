//
//  ViewController.m
//  Farkle
//
//  Created by Andrew Liu on 10/29/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "RootViewController.h"
#import "DieLabel.h"

@interface RootViewController () <DieLabelDelegate>

@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *labelCollection;
@property (strong, nonatomic) NSMutableArray *dice;
@property (strong, nonatomic) IBOutlet UILabel *userScore;
@property int tapCount;
@property int oneCount;
@property int twoCount;
@property int threeCount;
@property int fourCount;
@property int fiveCount;
@property int sixCount;
@property int oneTapCount;
@property int twoTapCount;
@property int threeTapCount;
@property int fourTapCount;
@property int fiveTapCount;
@property int sixTapCount;
@property int score;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (DieLabel *label in self.labelCollection)
    {
        label.delegate = self;
    }
    self.dice = [@[] mutableCopy];
    self.tapCount = 0;
    self.oneCount = 0;
    self.twoCount = 0;
    self.threeCount = 0;
    self.fourCount = 0;
    self.fiveCount = 0;
    self.sixCount = 0;
    self.score = 0;
}

- (BOOL)keepPlaying
{
    for (DieLabel *label in self.dice)
    {
        if ([label.text isEqual:@"1"])
        {
            self.oneCount++;
            if (self.oneCount >= 1)
            {
                return YES;
            }
        }
        if ([label.text isEqual:@"2"])
        {
            self.twoCount++;
            if (self.twoCount == 3)
            {
                return YES;
            }
        }
        if ([label.text isEqual:@"3"])
        {
            self.threeCount++;
            if (self.threeCount == 3)
            {
                return YES;
            }

        }
        if ([label.text isEqual:@"4"])
        {
            self.fourCount++;
            if (self.fourCount == 3)
            {
                return YES;
            }
        }
        if ([label.text isEqual:@"5"])
        {
            self.fiveCount++;
            if (self.fiveCount == 1)
            {
                return YES;
            }
        }
        if ([label.text isEqual:@"6"])
        {
            self.sixCount++;
            if (self.sixCount == 3)
            {
                return YES;
            }
        }

    }
    return NO;
}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
    if (self.tapCount == 0)
    {
        self.dice = [NSMutableArray arrayWithArray:self.labelCollection];
        for (DieLabel *label in self.dice)
        {
            [label roll];

        }
    }
    else
    {
        for (DieLabel *label in self.dice)
        {
            [label roll];

        }
    }

    if([self keepPlaying])
    {
        NSLog(@"keepplay");
        ///create alert
    }
    else{
        NSLog(@"lose");
    }
    self.tapCount++;

}


-(void)dieTapped:(UILabel *)label
{
    if (self.tapCount == 0)
    {
        nil;
    }
    else
    {
    label.backgroundColor = [UIColor redColor];
    [self.dice removeObject:label];
        int i = self.tapCount;


        if ([label.text isEqual:@"1"])
        {
            self.oneTapCount++;
        }
        if ([label.text isEqual:@"2"])
        {
            self.twoTapCount++;
        }
        if ([label.text isEqual:@"3"])
        {
            self.threeTapCount++;
        }
        if ([label.text isEqual:@"4"])
        {
            self.fourTapCount++;
        }
        if ([label.text isEqual:@"5"])
        {
            self.fiveTapCount++;
        }
        if ([label.text isEqual:@"6"])
        {
            self.sixTapCount++;
        }

        if (self.oneTapCount == 1)
        {
            self.score = self.score+100;
            self.oneTapCount = 0;
        }

        if (self.oneTapCount == 3)
        {
            self.score = self.score+1000;
            self.oneTapCount = 0;
        }
        if (self.twoTapCount == 3)
        {
            self.score = self.score+200;
            self.twoTapCount = 0;
        }
        if (self.threeTapCount == 3)
        {
            self.score = self.score+300;
            self.threeTapCount = 0;
        }
        if (self.fourTapCount == 3)
        {
            self.score = self.score+400;
            self.fourTapCount = 0;
        }
        if (self.fiveTapCount == 3)
        {
            self.score = self.score+500;
            self.fiveTapCount = 0;
        }
        if (self.sixTapCount == 3)
        {
            self.score = self.score+600;
            self.sixTapCount = 0;
        }

        self.userScore.text=[NSString stringWithFormat:@"%d", self.score];

    }
}


@end
