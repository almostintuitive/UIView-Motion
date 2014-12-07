//
//  ViewController.m
//  Example
//
//  Created by mark on 17/11/2014.
//  Copyright (c) 2014 itchingpixels. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Motion.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}


- (void)viewDidAppear:(BOOL)animated {
    
    for (int vertical = 1; vertical <= 18; vertical++) {
        
        
        
        for (int horizontal = 1; horizontal <= 18; horizontal++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width*0.05)*horizontal, (self.view.bounds.size.height*0.05)*vertical, (self.view.bounds.size.width*0.05), (self.view.bounds.size.height*0.05))];
            view.backgroundColor = [UIColor blackColor];
            MotionType motionType = MotionTypeSlideInFromBottom;
            if (vertical < 5) {
                motionType = MotionTypeSlideInFromTop;
            } else if (vertical >= 5 && vertical < 10) {
                motionType = MotionTypeZoomIn;
            } else if (vertical >= 10 && vertical < 15) {
                motionType = MotionTypeSlideInFromRight;
            } else if (vertical >= 15 && vertical < 20) {
                motionType = MotionTypeSlideInFromBottom;
            }
            [self.view addSubview:view withAnimationType:motionType delay:(0.05*horizontal)+(vertical*0.05)];
        }
        
        
    }

    

    
}

- (void)tap {
    float delay = 0;
    for (UIView *view in self.view.subviews) {
        [view removeFromSuperviewWithAnimationType:MotionTypeZoomOut delay:delay];
        delay += 0.005;
    }
//    [self.blackView removeFromSuperviewWithAnimationType:MotionTypeSlideOutToBottom];
}

@end
