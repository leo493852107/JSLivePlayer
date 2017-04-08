//
//  JSLoginVC.m
//  JSWeChat
//
//  Created by 李建舜 on 22/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import "JSLoginVC.h"
#import "JSLoginView.h"
#import "JSRootTabViewController.h"
#import "JSCommonTools.h"

@interface JSLoginVC ()



@end



@implementation JSLoginVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"JSLoginVC"];//("PageOne"为页面名称，可自定义)
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"JSLoginVC"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}

- (void)initUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    _loginView = [[JSLoginView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_loginView];
    
    __weak typeof(_loginView) weakLoginView = _loginView;
    __weak typeof(self) weakSelf = self;
    _loginView.registerBlock = ^(UIButton *sender) {

        BmobUser *bUser = [[BmobUser alloc] init];
        [bUser setUsername:weakLoginView.usernameTextField.text];
        [bUser setPassword:weakLoginView.passwordTextField.text];
        [bUser setEmail:weakLoginView.emailTextField.text];
//        [bUser setObject:@18 forKey:@"age"];
        [bUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
            if (isSuccessful){
                [JSCommonTools normalAlertWithTitle:@"注册成功" WithMessage:@"恭喜注册成功" WithPreferredStyle:UIAlertControllerStyleAlert WithController:weakSelf];
            } else {
                [JSCommonTools normalAlertWithTitle:@"注册失败" WithMessage:error.userInfo[@"NSLocalizedDescription"] WithPreferredStyle:UIAlertControllerStyleAlert WithController:weakSelf];
            }
        }];
        
        
    };
    
    _loginView.loginBlock = ^(UIButton *sender) {
        
        [BmobUser loginWithUsernameInBackground:weakLoginView.usernameTextField.text
                                       password:weakLoginView.passwordTextField.text block:^(BmobUser *user, NSError *error) {
                                           if (error) {
                                               [JSCommonTools normalAlertWithTitle:@"登录失败" WithMessage:error.userInfo[@"NSLocalizedDescription"] WithPreferredStyle:UIAlertControllerStyleAlert WithController:weakSelf];
                                           } else {
                                               [weakSelf presentViewController:[[JSRootTabViewController alloc] init] animated:YES completion:nil];
                                           }
                                       }];
        
        
    };
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
