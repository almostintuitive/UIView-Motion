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

@property UIView *blackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}


- (void)viewDidAppear:(BOOL)animated {
    self.blackView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.blackView withAnimationType:MotionTypeSlideInFromBottomAndFadeIn];
    
}

- (void)tap {
    [self.blackView removeFromSuperviewWithAnimationType:MotionTypeSlideOutToBottom];
}

@end
