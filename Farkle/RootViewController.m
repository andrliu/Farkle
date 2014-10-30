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


}

-(void)dieTapped:(UILabel *)label
{

    label.backgroundColor = [UIColor redColor];
    [self.dice removeObject:label];

}



@end
