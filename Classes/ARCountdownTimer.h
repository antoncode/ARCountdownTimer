//
//  ARCountdownTimer.h
//  ARCountdownTimer
//
//  Created by Anton Rivera on 5/19/14.
//  Copyright (c) 2014 Anton Hilario Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARCountdownTimer : NSObject

- (instancetype)initWithDaysLabel:(UILabel *)daysLabel hoursLabel:(UILabel *)hoursLabel minutesLabel:(UILabel *)minutesLabel andSecondsLabel:(UILabel *)secondsLabel;

- (void)startWithCountDownDate:(NSDate *)countdownDate;

@end
