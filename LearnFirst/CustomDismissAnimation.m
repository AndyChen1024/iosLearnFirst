//
//  CustomDismissAnimation.m
//  LearnFirst
//
//  Created by Andy on 13/08/24.
//
#import <UIKit/UIKit.h>

//@interface CustomDismissAnimation : NSObject <UIViewControllerAnimatedTransitioning>
//
//@end
#import "CustomDismissAnimation.h"

@implementation CustomDismissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3; // 动画持续时间
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 动画将视图滑动到屏幕底部
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.frame = CGRectOffset(fromViewController.view.frame, 0, [transitionContext containerView].bounds.size.height);
    } completion:^(BOOL finished) {
        [fromViewController.view removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
