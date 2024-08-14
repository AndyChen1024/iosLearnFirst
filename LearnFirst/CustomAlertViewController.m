//
//  CustomAlertViewController.m
//  LearnFirst
//
//  Created by Andy on 13/08/24.
//
#import "CustomAlertViewController.h"
//#import <UIKit/UIKey.h>
//@interface CustomAlertViewController:UIViewController
//@end

//
//@interface CustomAlertViewController ()
//
//@end

@implementation CustomAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置弹窗的尺寸和背景颜色
        self.view.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200);
        self.view.backgroundColor = [UIColor whiteColor];
        
        // 添加你想要的子视图或内容
        UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
        label.text = @"This is a custom alert!";
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

//    // 设置自定义弹窗的frame大小，不占满全屏
//    CGFloat width = self.view.bounds.size.width - 40;
//    CGFloat height = 300;  // 自定义高度
//    self.view.frame = CGRectMake(20, 100, width, height);
//    self.view.layer.cornerRadius = 10;
//    self.view.layer.masksToBounds = YES;
    // 设置自定义弹窗的frame大小，不占满全屏
       CGFloat width = self.view.bounds.size.width;
       CGFloat height = [UIScreen mainScreen].bounds.size.height - 200;  // 自定义高度
       self.view.frame = CGRectMake(0, 200, width, height);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
