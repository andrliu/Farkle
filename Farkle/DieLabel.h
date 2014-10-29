//
//  DieLabel.h
//  Farkle
//
//  Created by Andrew Liu on 10/29/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate  <NSObject>

@end


@interface DieLabel : UILabel

@property (nonatomic, weak) id <DieLabelDelegate> delegate;

- (void)roll;

@end
