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
    
    MotionTypeSlideInFromLeft = 2,
    MotionTypeSlideInFromRight = 3,
    MotionTypeSlideInFromTop = 4,
    MotionTypeSlideInFromBottom = 5,
    
    MotionTypeSlideOutToLeft = 6,
    MotionTypeSlideOutToRight = 7,
    MotionTypeSlideOutToTop = 8,
    MotionTypeSlideOutToBottom = 9,
    
    MotionTypeSlideInFromBottomAndFadeIn = 10

} MotionType;


@interface UIView (Motion)


- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type;
- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type delay:(NSTimeInterval)delay;
- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type completionBlock:(void (^)(void))completionBlock;
- (void)addSubview:(UIView *)view withAnimationType:(MotionType)type delay:(NSTimeInterval)delay completionBlock:(void (^)(void))completionBlock;


- (void)removeFromSuperviewWithAnimationType:(MotionType)type;
- (void)removeFromSuperviewWithAnimationType:(MotionType)type delay:(NSTimeInterval)delay;


- (void)animateWithType:(MotionType)type;
- (void)animateWithType:(MotionType)type delay:(NSTimeInterval)delay;


@end
