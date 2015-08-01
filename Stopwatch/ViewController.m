//
//  ViewController.m
//  Stopwatch
//
//  Created by Giorgi Gogishvili on 8/1/15.
//  Copyright (c) 2015 Giorgi Gogishvili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    BOOL started;
    BOOL lap;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    started = false;
    lap = true;
    
}

- (void) timerUpdate: (NSTimer *) timer {
    
    mainCounter++;
    lapCounter++;
    
    int mSec = mainCounter % 60;
    int Min = mainCounter / 3600;
    int Sec = (mainCounter - Min * 3600)/60;
    
    self.mainTimerLabel.text = [NSString stringWithFormat:@"%.2i:%.2i.%.2i",Min,Sec,mSec];
    
    mSec = lapCounter % 60;
    Min = lapCounter / 3600;
    Sec = (lapCounter - Min * 3600)/60;

    self.lapTimerLabel.text = [NSString stringWithFormat:@"%.2i:%.2i.%.2i",Min,Sec,mSec];
    
    NSLog(@"%d",lapCounter);
}

- (IBAction)startButton:(id)sender {
    
    if (!started) {
        [self.sButton setTitle:@"Stop" forState:UIControlStateNormal];
        [self.sButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        if (mainCounter > 0) {
            [self.lButton setTitle:@"Lap" forState:UIControlStateNormal];
        }

//        [sender setTitle:@"Stop" forState:UIControlStateNormal];
//        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(timerUpdate:) userInfo:nil repeats:YES];
    }
    else
    {
        [self.sButton setTitle:@"Start" forState:UIControlStateNormal];
        [self.sButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self.lButton setTitle:@"Reset" forState:UIControlStateNormal];

//        [sender setTitle:@"Start" forState:UIControlStateNormal];
//        [sender setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        
        [self.timer invalidate];

    }
    
    started = !started;
}

- (IBAction)lapButton:(id)sender {
    
    lapCounter = 0;
    
    if (lap) {
        
    }
    else
    {
        [self.lButton setTitle:@"Lap" forState:UIControlStateNormal];
        self.mainTimerLabel.text = [NSString stringWithFormat:@"00:00.00"];
        self.lapTimerLabel.text = [NSString stringWithFormat:@"00:00.00"];
        mainCounter = 0;
        lap = true;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
