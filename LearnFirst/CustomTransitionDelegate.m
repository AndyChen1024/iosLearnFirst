//
//  CustomTransitionDelegate.m
//  LearnFirst
//
//  Created by Andy on 13/08/24.
//
#import "CustomTransitionDelegate.h"
#import "CustomPresentAnimation.h"
#import "CustomDismissAnimation.h"
#import <UIKit/UIKit.h>
//@interface CustomTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>
//
//@end
// CustomPresentAnimation.m


@implementation CustomTransitionDelegate
// Presenting view controller animation
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[CustomPresentAnimation alloc] init];
}

// Dismissing view controller animation
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[CustomDismissAnimation alloc] init];
}

@end



//@implementation CustomPresentAnimation
//
//- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
//    return 0.3;
//}
//
//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
//    UIView *containerView = [transitionContext containerView];
//    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
//    
//    // 初始位置设置在屏幕底部
//    toViewController.view.frame = CGRectOffset(finalFrame, 0, containerView.bounds.size.height);
//    [containerView addSubview:toViewController.view];
//    
//    // 动画将视图滑动到目标位置
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        toViewController.view.frame = finalFrame;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//    }];
//}
//
//@end

// CustomDismissAnimation.m

//
//@implementation CustomDismissAnimation
//
//- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
//    return 0.3;
//}
//
//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
//    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    
//    // 动画将视图滑动到屏幕底部
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        fromViewController.view.frame = CGRectOffset(fromViewController.view.frame, 0, [transitionContext containerView].bounds.size.height);
//    } completion:^(BOOL finished) {
//        [fromViewController.view removeFromSuperview];
//        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//    }];
//}

//@end
