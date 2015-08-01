//
//  ViewController.h
//  Stopwatch
//
//  Created by Giorgi Gogishvili on 8/1/15.
//  Copyright (c) 2015 Giorgi Gogishvili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int mainCounter;
    int lapCounter;
}

@property (nonatomic, weak) IBOutlet UILabel *mainTimerLabel;
@property (nonatomic, weak) IBOutlet UILabel *lapTimerLabel;

@property (nonatomic, weak) IBOutlet UIButton *sButton;
@property (nonatomic, weak) IBOutlet UIButton *lButton;


@property (nonatomic, strong) NSTimer *timer;

- (IBAction) startButton: (id) sender;
- (IBAction) lapButton: (id) sender;

- (void) updateLapLabel;
- (void) updateMainLabel;

@end

