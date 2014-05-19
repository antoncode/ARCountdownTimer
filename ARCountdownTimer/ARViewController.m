//
//  ARViewController.m
//  ARCountdownTimer
//
//  Created by Anton Rivera on 5/15/14.
//  Copyright (c) 2014 Anton Hilario Rivera. All rights reserved.
//

#import "ARViewController.h"

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
    
    NSTimer *timer = [NSTimer new];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)updateTimer
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    
    NSDateComponents *countDownToThisDateComponents = [NSDateComponents new];
    [countDownToThisDateComponents setYear:2014];
    [countDownToThisDateComponents setMonth:8];
    [countDownToThisDateComponents setDay:20];
    [countDownToThisDateComponents setHour:12];
    [countDownToThisDateComponents setMinute:0];
    [countDownToThisDateComponents setSecond:0];
    NSDate *countDownToThisDate = [calendar dateFromComponents:countDownToThisDateComponents];
    
    if ([now compare:countDownToThisDate] == NSOrderedAscending)
    {   // now is earlier than countDownToThisDate
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
