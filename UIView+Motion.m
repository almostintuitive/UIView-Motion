//
//  UIView+Motion.h
//
//  UIView categories to add animation on addSubview & removeFromSuperView.
//  Uses facebook pop.
//  https://github.com/itchingpixels/UIView-Motion
//
//  Created by Mark Szulyovszky on 29/09/2014.
//
//

#import "UIView+Motion.h"
#import <pop/POP.h>


float const springSpeed = 20;
float const springBounciness = 1;



@implementation UIView (Motion)

#pragma mark - addSubview methods

- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type {
    [self addSubview:view withAnimationType:type delay:0 completionBlock:nil];
}

- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type delay:(NSTimeInterval)delay {
    [self addSubview:view withAnimationType:type delay:delay completionBlock:nil];
}

- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type completionBlock:(void (^)(void))completionBlock {
    [self addSubview:view withAnimationType:type delay:0 completionBlock:completionBlock];
}

- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type delay:(NSTimeInterval)delay completionBlock:(void (^)(void))completionBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self addSubview:view];
        [view animateWithType:type delay:0 completionBlock:completionBlock];
    });
}



#pragma mark - removeFromSuperview methods

- (void)removeFromSuperviewWithAnimationType:(MotionType)type {
    [self removeFromSuperviewWithAnimationType:type delay:0];
}

- (void)removeFromSuperviewWithAnimationType:(MotionType)type delay:(NSTimeInterval)delay {
    [self animateWithType:type delay:delay completionBlock:^{
        [self removeFromSuperview];
    }];
}





#pragma mark - animation methods

- (void)animateWithType:(MotionType)type {
    [self animateWithType:type delay:0 completionBlock:nil];
}

- (void)animateWithType:(MotionType)type delay:(NSTimeInterval)delay {
    [self animateWithType:type delay:delay completionBlock:nil];
}


- (void)animateWithType:(MotionType)type delay:(NSTimeInterval)delay completionBlock:(void (^)(void))completionBlock {
    
    
    if (type == MotionTypeFadeIn) {
        POPSpringAnimation *alphaAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
        alphaAnimation.fromValue = @(0);
        alphaAnimation.toValue = @(self.alpha);
        alphaAnimation.springSpeed = springSpeed;
        alphaAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            alphaAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [alphaAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:alphaAnimation forKey:@"fadeIn"];
        
    } else if (type == MotionTypeFadeOut) {
        
        POPSpringAnimation *alphaAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
        alphaAnimation.toValue = @(0);
        alphaAnimation.springSpeed = springSpeed;
        alphaAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            alphaAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [alphaAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:alphaAnimation forKey:@"fadeOut"];

    } else if (type == MotionTypeSlideInFromLeft) {
        
        POPSpringAnimation *slideAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x-[UIScreen mainScreen].bounds.size.width, self.center.y)];
        slideAnimation.toValue = [NSValue valueWithCGPoint:self.center];
        slideAnimation.springSpeed = springSpeed;
        slideAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            slideAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [slideAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideAnimation forKey:@"slideInFromLeft"];

        
        
    } else if (type == MotionTypeSlideInFromRight) {
        
        POPSpringAnimation *slideAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x+[UIScreen mainScreen].bounds.size.width, self.center.y)];
        slideAnimation.toValue = [NSValue valueWithCGPoint:self.center];
        slideAnimation.springSpeed = springSpeed;
        slideAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            slideAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [slideAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideAnimation forKey:@"slideInFromRight"];
        
        
    } else if (type == MotionTypeSlideInFromTop) {
        
        POPSpringAnimation *slideAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y-[UIScreen mainScreen].bounds.size.height)];
        slideAnimation.toValue = [NSValue valueWithCGPoint:self.center];
        slideAnimation.springSpeed = springSpeed;
        slideAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            slideAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [slideAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideAnimation forKey:@"slideInFromTop"];

        
    
    } else if (type == MotionTypeSlideInFromBottom) {
        
        POPSpringAnimation *slideAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y+[UIScreen mainScreen].bounds.size.height)];
        slideAnimation.toValue = [NSValue valueWithCGPoint:self.center];
        slideAnimation.springSpeed = springSpeed;
        slideAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            slideAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [slideAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideAnimation forKey:@"slideInFromBottom"];
        
        
        
    } else if (type == MotionTypeSlideOutToLeft) {
        
        POPSpringAnimation *slideAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x-[UIScreen mainScreen].bounds.size.width, self.center.y)];
        slideAnimation.springSpeed = springSpeed;
        slideAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            slideAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [slideAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideAnimation forKey:@"slideOutToLeft"];
        
        
    } else if (type == MotionTypeSlideOutToRight) {
        
        POPSpringAnimation *slideAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x+[UIScreen mainScreen].bounds.size.width, self.center.y)];
        slideAnimation.springSpeed = springSpeed;
        slideAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            slideAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [slideAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideAnimation forKey:@"slideOutToRight"];
        
        
    } else if (type == MotionTypeSlideOutToTop) {
        
        POPSpringAnimation *slideAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y-[UIScreen mainScreen].bounds.size.height)];
        slideAnimation.springSpeed = springSpeed;
        slideAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            slideAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [slideAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideAnimation forKey:@"slideOutToTop"];
        
        
    } else if (type == MotionTypeSlideOutToBottom) {
        
        POPSpringAnimation *slideAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y+[UIScreen mainScreen].bounds.size.height)];
        slideAnimation.springSpeed = springSpeed;
        slideAnimation.springBounciness = springBounciness;
        if (delay != 0) {
            slideAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [slideAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideAnimation forKey:@"slideOutToBottom"];
        
        
    } else if (type == MotionTypeSlideInFromBottomAndFadeIn) {
        
        [self animateWithType:MotionTypeFadeIn delay:delay completionBlock:nil];
        [self animateWithType:MotionTypeSlideInFromBottom delay:delay completionBlock:completionBlock];
        
    } else if (type == MotionTypeZoomIn) {
        
        POPSpringAnimation *alphaAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        alphaAnimation.fromValue = [NSValue valueWithCGPoint: CGPointMake(0, 0)];
        alphaAnimation.toValue = [NSValue valueWithCGPoint: CGPointMake(1, 1)];
        alphaAnimation.springSpeed = springSpeed;
        alphaAnimation.springBounciness = 5;
        if (delay != 0) {
            alphaAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [alphaAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:alphaAnimation forKey:@"zoomIn"];
        
        
    } else if (type == MotionTypeZoomOut) {
        
        POPSpringAnimation *alphaAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        alphaAnimation.toValue = [NSValue valueWithCGPoint: CGPointMake(0, 0)];
        alphaAnimation.springSpeed = springSpeed;
        alphaAnimation.springBounciness = 5;
        if (delay != 0) {
            alphaAnimation.beginTime = CACurrentMediaTime()+delay;
        }
        [alphaAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:alphaAnimation forKey:@"zoomOut"];
    }
    
    
}





@end