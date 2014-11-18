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
    

    
}


- (void)viewDidAppear:(BOOL)animated {
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView withAnimationType:MotionTypeSlideUpAndFadeIn];
    
}

@end
