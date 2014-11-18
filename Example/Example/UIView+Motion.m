//
//  UIView+AnimationHelper.m
//  Drops
//
//  Created by mark on 29/09/2014.
//
//

#import "UIView+Motion.h"

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
    [self addSubview:view];
    [view animateWithType:type delay:delay completionBlock:completionBlock];
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
        alphaAnimation.springSpeed = 1;
        alphaAnimation.beginTime = CACurrentMediaTime()+delay;
        [alphaAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:alphaAnimation forKey:@"fadeIn"];
        
    } else if (type == MotionTypeSlideUp) {
        
        POPSpringAnimation *slideUpAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        slideUpAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y+[UIScreen mainScreen].bounds.size.height)];
        slideUpAnimation.toValue = [NSValue valueWithCGPoint:self.center];
        slideUpAnimation.springSpeed = 1;
        [slideUpAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (completionBlock) {
                completionBlock();
            }
        }];
        [self pop_addAnimation:slideUpAnimation forKey:@"slideUp"];
        
    } else if (type == MotionTypeSlideUpAndFadeIn) {
        [self animateWithType:MotionTypeFadeIn delay:delay completionBlock:nil];
        [self animateWithType:MotionTypeSlideUp delay:delay completionBlock:completionBlock];
        
    }
    
    
}





@end