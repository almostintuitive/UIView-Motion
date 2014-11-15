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
    
    if (type == MotionTypeFadeIn) {
        [self addSubview:view withPreparationBlock:^(UIView *view) {
            view.alpha = 0;
        } customAnimation:^(UIView *view) {
            view.spring.alpha = 1;
        } delay:delay completionBlock:^{
            if (completionBlock) completionBlock();
        }];
    } else if (type == MotionTypeSlideUpAndFadeIn) {
        CGPoint originalCenterPoint = view.center;
        CGFloat originalAlpha = view.alpha;
        [self addSubview:view withPreparationBlock:^(UIView *view) {
            view.alpha = 0;
            view.center = CGPointMake(view.center.x, view.center.y+1000);
        } customAnimation:^(UIView *view) {
            view.spring.alpha = originalAlpha   ;
            view.spring.center = originalCenterPoint;
        } delay:delay completionBlock:^{
            if (completionBlock) completionBlock();
        }];
    } else if (type == MotionTypeSlideUp) {
        CGPoint originalCenterPoint = view.center;
        [self addSubview:view withPreparationBlock:^(UIView *view) {
            view.center = CGPointMake(view.center.x, view.center.y+1000);
        } customAnimation:^(UIView *view) {
            view.spring.center = originalCenterPoint;
        } delay:delay completionBlock:^{
            if (completionBlock) completionBlock();
        }];
    } else if (type == MotionTypeSlideInFromRightAndFadeIn) {
        CGPoint originalCenterPoint = view.center;
        CGFloat originalAlpha = view.alpha;
        [self addSubview:view withPreparationBlock:^(UIView *view) {
            view.alpha = 0;
            view.center = CGPointMake(view.center.x+1000, view.center.y);
        } customAnimation:^(UIView *view) {
            view.spring.alpha = originalAlpha;
            view.spring.center = originalCenterPoint;
        } delay:delay completionBlock:^{
            if (completionBlock) completionBlock();
        }];
    }
}


- (void)addSubview:(UIView *)view withPreparationBlock:(void (^)(UIView *view))preparationBlock customAnimation:(void (^)(UIView *view))animationBlock delay:(NSTimeInterval)delay completionBlock:(void (^)(void))completionBlock {
    if (preparationBlock) preparationBlock(view);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self addSubview:view];
        [NSObject animate:^{
            if (animationBlock) animationBlock(view);
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock();
        }];
    });
}


#pragma mark - animation methods

- (void)animateWithType:(MotionType)type {
    [self animateWithType:type delay:0];
}

- (void)animateWithType:(MotionType)type delay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (type == MotionTypeFallDown) {
            self.spring.springSpeed = 5;
            self.spring.center = CGPointMake(self.center.x, self.center.y+1000);
        } else if (type == MotionTypeFadeOut) {
            self.spring.alpha = 0;
        }
    });
}

@end