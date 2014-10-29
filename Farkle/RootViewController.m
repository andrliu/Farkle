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
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelCollection;
@property DieLabel *myDie;
@property NSMutableArray *dice;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myDie.delegate = self;
}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
    self.labelCollection.text = [self.myDie roll];
}

@end
