//
//  LoginViewController.m
//  LearnFirst
//
//  Created by Andy on 07/08/24.
//

#import "LoginViewController.h"
#import "Masonry.h"
#import "CustomAlertViewController.h"
#import "CustomTransitionDelegate.h"

@interface LoginViewController ()

@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
// 全局属性，保存弹窗控制器的引用
@property (nonatomic, strong) CustomAlertViewController *alertVC;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self setupUI];
}

- (void)setupUI {
    
    // 创建并添加按钮
       UIButton *toggleAlertButton = [UIButton buttonWithType:UIButtonTypeSystem];
       [toggleAlertButton setTitle:@"Toggle Alert" forState:UIControlStateNormal];
       [toggleAlertButton addTarget:self action:@selector(toggleAlertButtonTapped) forControlEvents:UIControlEventTouchUpInside];
       [self.view addSubview:toggleAlertButton];

       // 设置按钮的约束
       [toggleAlertButton mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.view).offset(100);
           make.left.equalTo(self.view).offset(30);
           make.right.equalTo(self.view).offset(-30);
           make.height.mas_equalTo(45);
       }];
       
    
    self.usernameTextField = [[UITextField alloc] init];
    self.usernameTextField.placeholder = @"用户名";
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.usernameTextField];

    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.placeholder = @"密码";
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.secureTextEntry = YES;
    [self.view addSubview:self.passwordTextField];

    self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    // 设置输入框和按钮的约束
        [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(toggleAlertButton.mas_bottom).offset(20);
            make.left.equalTo(self.view).offset(30);
            make.right.equalTo(self.view).offset(-30);
            make.height.mas_equalTo(40);
        }];

        [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.usernameTextField.mas_bottom).offset(20);
            make.left.equalTo(self.usernameTextField);
            make.right.equalTo(self.usernameTextField);
            make.height.mas_equalTo(40);
        }];

        [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passwordTextField.mas_bottom).offset(30);
            make.left.equalTo(self.usernameTextField);
            make.right.equalTo(self.usernameTextField);
            make.height.mas_equalTo(45);
        }];
//
//    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(150);
//        make.left.equalTo(self.view).offset(30);
//        make.right.equalTo(self.view).offset(-30);
//        make.height.mas_equalTo(40);
//    }];
//
//    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.usernameTextField.mas_bottom).offset(20);
//        make.left.equalTo(self.usernameTextField);
//        make.right.equalTo(self.usernameTextField);
//        make.height.mas_equalTo(40);
//    }];
//
//    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.passwordTextField.mas_bottom).offset(30);
//        make.left.equalTo(self.usernameTextField);
//        make.right.equalTo(self.usernameTextField);
//        make.height.mas_equalTo(45);
//    }];
}

- (void)loginButtonTapped {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSLog(@"用户名: %@, 密码: %@", username, password);
    // 创建并显示自定义弹窗
    CustomAlertViewController *alertVC = [[CustomAlertViewController alloc] init];
    alertVC.modalPresentationStyle = UIModalPresentationCustom;
    alertVC.transitioningDelegate = [[CustomTransitionDelegate alloc] init];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}


- (void)toggleAlertButtonTapped {
    if (self.alertVC) {
        // 如果弹窗已经显示，则将其关闭
        [self.alertVC dismissViewControllerAnimated:YES completion:^{
            self.alertVC = nil; // 关闭后清空引用
        }];
    } else {
        // 如果弹窗未显示，则创建并显示弹窗
        self.alertVC = [[CustomAlertViewController alloc] init];
        self.alertVC.modalPresentationStyle = UIModalPresentationCustom;
        self.alertVC.transitioningDelegate = [[CustomTransitionDelegate alloc] init];
        [self presentViewController:self.alertVC animated:YES completion:nil];
    }
}
@end
