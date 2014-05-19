//
//  ARCountdownTimer.m
//  ARCountdownTimer
//
//  Created by Anton Rivera on 5/19/14.
//  Copyright (c) 2014 Anton Hilario Rivera. All rights reserved.
//

#import "ARCountdownTimer.h"

@interface ARCountdownTimer ()

@property (weak, nonatomic) IBOutlet UILabel *daysToGoLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursToGoLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesToGoLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsToGoLabel;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSDate *countDownToDate;

@end

@implementation ARCountdownTimer

- (instancetype)initWithDaysLabel:(UILabel *)daysLabel hoursLabel:(UILabel *)hoursLabel minutesLabel:(UILabel *)minutesLabel andSecondsLabel:(UILabel *)secondsLabel
{
    if (self = [super init]) {
        _daysToGoLabel = daysLabel;
        _hoursToGoLabel = hoursLabel;
        _minutesToGoLabel = minutesLabel;
        _secondsToGoLabel = secondsLabel;
        
    }
    
    return self;
}

- (void)startWithCountDownDate:(NSDate *)countdownDate
{
    _countDownToDate = countdownDate;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)updateTimer
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    
    // countdown to some random date
    NSDateComponents *countDownToThisDateComponents = [NSDateComponents new];
    [countDownToThisDateComponents setYear:2014];
    [countDownToThisDateComponents setMonth:8];
    [countDownToThisDateComponents setDay:20];
    [countDownToThisDateComponents setHour:12];
    [countDownToThisDateComponents setMinute:0];
    [countDownToThisDateComponents setSecond:0];
    NSDate *countDownToThisDate = [calendar dateFromComponents:countDownToThisDateComponents];

    if (_countDownToDate) {
        countDownToThisDate = _countDownToDate;
    }
    
    if ([now compare:countDownToThisDate] == NSOrderedAscending)
    {
        NSDateComponents *componentsDays = [calendar components:NSDayCalendarUnit
                                                       fromDate:now
                                                         toDate:countDownToThisDate
                                                        options:0];
        _daysToGoLabel.text = [NSString stringWithFormat:@"%02ld", (long)(componentsDays.day)];
        NSDateComponents *componentsHours = [calendar components:NSHourCalendarUnit
                                                        fromDate:now
                                                          toDate:countDownToThisDate
                                                         options:0];
        _hoursToGoLabel.text = [NSString stringWithFormat:@"%02ld", (componentsHours.hour%24)];
        NSDateComponents *componentsMinutes = [calendar components:NSMinuteCalendarUnit
                                                          fromDate:now
                                                            toDate:countDownToThisDate
                                                           options:0];
        _minutesToGoLabel.text = [NSString stringWithFormat:@"%02ld", (componentsMinutes.minute%60)];
        NSDateComponents *componentsSeconds = [calendar components:NSSecondCalendarUnit
                                                          fromDate:now
                                                            toDate:countDownToThisDate
                                                           options:0];
        _secondsToGoLabel.text = [NSString stringWithFormat:@"%02ld", (componentsSeconds.second%60)];
        
    } else {
        _daysToGoLabel.text = @"00";
        _hoursToGoLabel.text = @"00";
        _minutesToGoLabel.text = @"00";
        _secondsToGoLabel.text = @"00";
    }
}

@end
