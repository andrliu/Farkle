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
    self.tapCount++;

//    for (DieLabel *label in self.dice)
//    {
//        if ([label.text isEqual:@"1"])
//        {
//            self.oneCount++;
//        }
//        if
//            ([label.text isEqual:@"2"])
//        {
//            self.twoCount++;
//        }
//        if
//            ([label.text isEqual:@"3"])
//        {
//            self.threeCount++;
//        }
//        if
//            ([label.text isEqual:@"4"])
//        {
//            self.fourCount++;
//        }
//        if
//            ([label.text isEqual:@"5"])
//        {
//            self.fiveCount++;
//        }
//        if
//            ([label.text isEqual:@"6"])
//        {
//            self.sixCount++;
//        }
//        if (self.oneCount == 3)
//        {
//            self.userScore.text=@"100";
//        }
//        if (self.twoCount == 3)
//        {
//            self.userScore.text=@"200";
//        }
//        if (self.threeCount == 3)
//        {
//            self.userScore.text=@"300";
//        }
//        if (self.fourCount == 3)
//        {
//            self.userScore.text=@"400";
//        }
//        if (self.fiveCount == 3)
//        {
//            self.userScore.text=@"500";
//        }
//        if (self.sixCount == 3)
//        {
//            self.userScore.text=@"600";
//        }
//    }


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


        if ([label.text isEqual:@"1"])
        {
            self.oneCount++;
        }
        if
            ([label.text isEqual:@"2"])
        {
            self.twoCount++;
        }
        if
            ([label.text isEqual:@"3"])
        {
            self.threeCount++;
        }
        if
            ([label.text isEqual:@"4"])
        {
            self.fourCount++;
        }
        if
            ([label.text isEqual:@"5"])
        {
            self.fiveCount++;
        }
        if
            ([label.text isEqual:@"6"])
        {
            self.sixCount++;
        }

        if (self.oneCount == 3)
        {
            self.score=self.score+1000;
            self.oneCount = 0;
        }
        if (self.twoCount == 3)
        {
            self.score=self.score+200;
                        self.twoCount = 0;
        }
        if (self.threeCount == 3)
        {
            self.score=self.score+300;
                        self.threeCount = 0;
        }
        if (self.fourCount == 3)
        {
            self.score=self.score+400;
                        self.fourCount = 0;
        }
        if (self.fiveCount == 3)
        {
            self.score=self.score+500;
                        self.fiveCount = 0;
        }
        if (self.sixCount == 3)
        {
            self.score=self.score+600;
                        self.sixCount = 0;
        }

        self.userScore.text=[NSString stringWithFormat:@"%d", self.score];
    }
}


@end
