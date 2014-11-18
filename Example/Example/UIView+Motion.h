//
//  UIView+AnimationHelper.h
//  Drops
//
//  Created by mark on 29/09/2014.
//
//

#import <UIKit/UIKit.h>
#import <pop/POP.h>

typedef enum MotionType : NSUInteger {
    MotionTypeFadeIn = 0,
    MotionTypeFadeOut = 1,
    MotionTypeSlideUpAndFadeIn = 2,
    MotionTypeFallDown = 3,
    MotionTypeSlideInFromRightAndFadeIn = 4,
    MotionTypeSlideUp = 5
} MotionType;


@interface UIView (Motion)

- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type;
- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type delay:(NSTimeInterval)delay;
- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type completionBlock:(void (^)(void))completionBlock;
- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type delay:(NSTimeInterval)delay completionBlock:(void (^)(void))completionBlock;


- (void)animateWithType:(MotionType)type;
- (void)animateWithType:(MotionType)type delay:(NSTimeInterval)delay;


@end
