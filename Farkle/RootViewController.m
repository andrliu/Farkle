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
@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property (weak, nonatomic) IBOutlet UILabel *anotherUserScore;
@property (weak, nonatomic) IBOutlet UILabel *userDisplay;
@property (weak, nonatomic) IBOutlet UILabel *anotherUserDisplay;
@property int rollButtonTapCount;
@property int diceOneCount;
@property int diceTwoCount;
@property int diceThreeCount;
@property int diceFourCount;
@property int diceFiveCount;
@property int diceSixCount;
@property int diceOneScoreCount;
@property int diceTwoScoreCount;
@property int diceThreeScoreCount;
@property int diceFourScoreCount;
@property int diceFiveScoreCount;
@property int diceSixScoreCount;
@property int score;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (DieLabel *label in self.labelCollection)
    {
        label.delegate = self;
        label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockDice"]];
    }
    self.userDisplay.textColor = [UIColor blackColor];
    self.anotherUserDisplay.textColor = [UIColor clearColor];
    [self resetScoreCount];
    [self resetDiceCount];
    self.score = 0;
    self.rollButtonTapCount = 0;
}

- (void)resetDiceCount
{
    self.diceOneCount = 0;
    self.diceTwoCount = 0;
    self.diceThreeCount = 0;
    self.diceFourCount = 0;
    self.diceFiveCount = 0;
    self.diceSixCount = 0;
}

- (void)resetScoreCount
{
    self.diceOneScoreCount = 0;
    self.diceTwoScoreCount = 0;
    self.diceThreeScoreCount = 0;
    self.diceFourScoreCount = 0;
    self.diceFiveScoreCount = 0;
    self.diceSixScoreCount = 0;
}

- (BOOL)hotDice
{
    if (self.diceOneCount == 6)
    {
        return YES;
    }

    else if (self.diceTwoCount == 6)
    {
        return YES;
    }

    else if (self.diceThreeCount == 6)
    {
        return YES;
    }

    else if (self.diceFourCount == 6)
    {
        return YES;
    }

    else if (self.diceFiveCount == 6)
    {
        return YES;
    }

    else if (self.diceSixCount == 6)
    {
        return YES;
    }
    else
    {
    return NO;
    }
}

- (void)winningScore
{
    int bankScore = 0;
    if (self.diceOneScoreCount >= 1)
    {
        if (self.diceOneScoreCount == 6)
        {
            bankScore = bankScore+2000;
        }
        if (self.diceOneScoreCount == 5)
        {
            bankScore = bankScore+1200;
        }
        if (self.diceOneScoreCount == 4)
        {
            bankScore = bankScore+1100;
        }
        if (self.diceOneScoreCount == 3)
        {
            bankScore = bankScore+1000;
        }
        if (self.diceOneScoreCount == 2)
        {
            bankScore = bankScore+200;
        }
        if (self.diceOneScoreCount == 1)
        {
            bankScore = bankScore+100;
        }
    }
    if (self.diceTwoScoreCount >= 3)
    {
        if (self.diceTwoScoreCount == 6)
        {
            bankScore = bankScore+400;
        }
        else
        {
            bankScore = bankScore+200;
        }
    }
    if (self.diceThreeScoreCount >= 3)
    {
        if (self.diceThreeScoreCount == 6)
        {
            bankScore = bankScore+600;
        }
        else
        {
            bankScore = bankScore+300;
        }
    }
    if (self.diceFourScoreCount >= 3)
    {
        if (self.diceFourScoreCount == 6)
        {
            bankScore = bankScore+800;
        }
        else
        {
            bankScore = bankScore+400;
        }
    }
    if (self.diceFiveScoreCount >= 1)
    {
        if (self.diceFiveScoreCount == 6)
        {
            bankScore = bankScore+1000;
        }
        if (self.diceFiveScoreCount == 5)
        {
            bankScore = bankScore+600;
        }
        if (self.diceFiveScoreCount == 4)
        {
            bankScore = bankScore+550;
        }
        if (self.diceFiveScoreCount == 3)
        {
            bankScore = bankScore+500;
        }
        if (self.diceFiveScoreCount == 2)
        {
            bankScore = bankScore+100;
        }
        if (self.diceFiveScoreCount == 1)
        {
            bankScore = bankScore+50;
        }
    }
    if (self.diceSixScoreCount >= 3)
    {
        if (self.diceSixScoreCount == 6)
        {
            bankScore = bankScore+1200;
        }
        else
        {
            bankScore = bankScore+600;
        }
    }

    [self resetScoreCount];

    self.score = self.score + bankScore;

    if (self.userDisplay.textColor == [UIColor blackColor])
    {
        self.userScore.text = [NSString stringWithFormat:@"%d", self.score];
    }
    else if (self.anotherUserDisplay.textColor == [UIColor blackColor])
    {
        self.anotherUserScore.text = [NSString stringWithFormat:@"%d", self.score];
    }

    bankScore = 0;

    if (self.dice.count == 0)
    {
        
        [self farkleAlert];
    }
}

- (void)farkleAlert
{
    UIAlertController *farkleSign = [UIAlertController alertControllerWithTitle:@""
                                                                       message: @"MotherFarkle"
                                                                preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *bankScoreButton = [UIAlertAction actionWithTitle:@"Switch Player"
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action)
                                                            {
                                                                [self resetScoreCount];
                                                                [self resetDiceCount];
                                                                self.rollButtonTapCount = 0;
                                                                self.score = 0;
                                                                if (self.userDisplay.textColor == [UIColor blackColor])
                                                                {
                                                                    self.userDisplay.textColor = [UIColor clearColor];
                                                                    self.anotherUserDisplay.textColor = [UIColor blackColor];
                                                                }
                                                                else if (self.anotherUserDisplay.textColor == [UIColor blackColor])
                                                                {
                                                                    self.userDisplay.textColor = [UIColor blackColor];
                                                                    self.anotherUserDisplay.textColor = [UIColor clearColor];
                                                                }
                                                                self.dice = [NSMutableArray arrayWithArray:self.labelCollection];
                                                                for (DieLabel *label in self.dice)
                                                                {
                                                                    label.text = [NSString stringWithFormat:@"0"];
                                                                    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockDice"]];
                                                                };
                                                            }];
    [farkleSign addAction:bankScoreButton];
    [self presentViewController: farkleSign animated:YES completion:nil];
}

- (BOOL)keepPlaying
{
    for (DieLabel *label in self.dice)
    {
        if (self.diceOneCount >= 1)
        {
                return YES;
        }
        else if (self.diceFiveCount >= 1)
        {
                return YES;
        }
        else if (self.diceTwoCount >= 3)
        {
                return YES;
        }
        else if (self.diceThreeCount >= 3)
        {
                return YES;
        }
        else if (self.diceFourCount >= 3)
        {
                return YES;
        }
        else if (self.diceSixCount >= 3)
        {
                return YES;
        }
    }
    return NO;
}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
    if (self.rollButtonTapCount == 0)
    {
        self.dice = [NSMutableArray arrayWithArray:self.labelCollection];
        for (DieLabel *label in self.dice)
        {
            [label roll];
            if ([label.text isEqual: @"1"])
            {
                self.diceOneCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceOne"]];
            }
            if ([label.text isEqual: @"2"])
            {
                self.diceTwoCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceTwo"]];
            }
            if ([label.text isEqual: @"3"])
            {
                self.diceThreeCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceThree"]];
            }
            if ([label.text isEqual: @"4"])
            {
                self.diceFourCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceFour"]];
            }
            if ([label.text isEqual: @"5"])
            {
                self.diceFiveCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceFive"]];
            }
            if ([label.text isEqual: @"6"])
            {
                self.diceSixCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceSix"]];
            }

        }
        if ([self hotDice])
        {
            self.score = self.score + 1000;
            self.rollButtonTapCount = 0;
        }
    }
    else
    {
        for (DieLabel *label in self.dice)
        {
            [label roll];
            if ([label.text isEqual: @"1"])
            {
                self.diceOneCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceOne"]];
            }
            if ([label.text isEqual: @"2"])
            {
                self.diceTwoCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceTwo"]];
            }
            if ([label.text isEqual: @"3"])
            {
                self.diceThreeCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceThree"]];
            }
            if ([label.text isEqual: @"4"])
            {
                self.diceFourCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceFour"]];
            }
            if ([label.text isEqual: @"5"])
            {
                self.diceFiveCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceFive"]];
            }
            if ([label.text isEqual: @"6"])
            {
                self.diceSixCount++;
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diceSix"]];
            }

        }
    }

    if ([self keepPlaying])
    {
        [self resetDiceCount];
    }
    else
    {
        [self resetDiceCount];
        [self farkleAlert];
    }

    self.rollButtonTapCount++;
}

-(void)dieTapped:(UILabel *)label
{
    if (self.rollButtonTapCount == 0)
    {
        nil;
    }
    else
    {
            if ([label.text isEqual:@"1"])
            {
                label.text = [NSString stringWithFormat:@"0"];
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockDice"]];
                self.diceOneScoreCount++;
            }
            if ([label.text isEqual:@"2"])
            {
                label.text = [NSString stringWithFormat:@"0"];
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockDice"]];
                self.diceTwoScoreCount++;
            }
            if ([label.text isEqual:@"3"])
            {
                label.text = [NSString stringWithFormat:@"0"];
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockDice"]];
                self.diceThreeScoreCount++;
            }
            if ([label.text isEqual:@"4"])
            {
                label.text = [NSString stringWithFormat:@"0"];
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockDice"]];
                self.diceFourScoreCount++;
            }
            if ([label.text isEqual:@"5"])
            {
                label.text = [NSString stringWithFormat:@"0"];
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockDice"]];
                self.diceFiveScoreCount++;
            }
            if ([label.text isEqual:@"6"])
            {
                label.text = [NSString stringWithFormat:@"0"];
                label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockDice"]];
                self.diceSixScoreCount++;
            }

            [self.dice removeObject:label];


    }
}

- (IBAction)backScoreOnButtonPressed:(UIButton *)sender
{
    [self winningScore];
}


@end