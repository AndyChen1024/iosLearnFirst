//
//  CustomPresentAnimation.m
//  LearnFirst
//
//  Created by Andy on 13/08/24.
//
//#import <UIKit/UIKit.h>
#import "CustomPresentAnimation.h"
//@interface CustomPresentAnimation : NSObject <UIViewControllerAnimatedTransitioning>
//
//@end


@implementation CustomPresentAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3; // 动画持续时间
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    // 初始位置设置在屏幕底部
    toViewController.view.frame = CGRectOffset(finalFrame, 0, containerView.bounds.size.height);
    [containerView addSubview:toViewController.view];
    
    // 动画将视图滑动到目标位置
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
@end
