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
@property NSMutableArray *dice;


@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (DieLabel *label in self.labelCollection)
    {
        label.delegate = self;
    }

}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
    for (DieLabel *label in self.labelCollection)
    {
        [label roll];
    }
}

-(void)onTapped:(UITapGestureRecognizer *)sender
{
    for (DieLabel *label in self.labelCollection)
    {
        if (label) {
            label.userInteractionEnabled = NO;
        }
    }
}

@end
