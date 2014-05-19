//
//  ARViewController.m
//  ARCountdownTimer
//
//  Created by Anton Rivera on 5/15/14.
//  Copyright (c) 2014 Anton Hilario Rivera. All rights reserved.
//

#import "ARViewController.h"
#import "ARCountdownTimer.h"

@interface ARViewController ()

@property (weak, nonatomic) IBOutlet UILabel *daysToGoLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursToGoLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesToGoLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsToGoLabel;

@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ARCountdownTimer *countDownTimer = [[ARCountdownTimer alloc] initWithDaysLabel:_daysToGoLabel
                                                                        hoursLabel:_hoursToGoLabel
                                                                      minutesLabel:_minutesToGoLabel
                                                                   andSecondsLabel:_secondsToGoLabel];
    [countDownTimer startWithCountDownDate:[NSDate dateWithTimeIntervalSinceNow:1000000]];
}

@end
