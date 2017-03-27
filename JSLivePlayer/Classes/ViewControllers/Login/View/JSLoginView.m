//
//  JSLoginView.m
//  JSWeChat
//
//  Created by 李建舜 on 23/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#define marginLeftRight 20

#import "JSLoginView.h"
#import <Masonry.h>

@implementation JSLoginView

#pragma mark - 懒加载
- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.backgroundColor = [UIColor greenColor];
        [_loginBtn.layer setMasksToBounds:YES];
        [_loginBtn.layer setCornerRadius:6.0];
        [_loginBtn addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerBtn.backgroundColor = [UIColor blueColor];
        [_registerBtn.layer setMasksToBounds:YES];
        [_registerBtn.layer setCornerRadius:6.0];
        [_registerBtn addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

- (UITextField *)usernameTextField {
    if (!_usernameTextField) {
        _usernameTextField = [[UITextField alloc] init];
        _usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _usernameTextField.placeholder = @"请输入账号";
    }
    return _usernameTextField;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

- (UILabel *)usernameLabel {
    if (!_usernameLabel) {
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.text = @"用户名:";
        _usernameLabel.font = [UIFont systemFontOfSize:14];
        _usernameLabel.textAlignment = NSTextAlignmentRight;
    }
    return _usernameLabel;
}

- (UILabel *)passwordLabel {
    if (!_passwordLabel) {
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.text = @"密码:";
        _passwordLabel.font = [UIFont systemFontOfSize:14];
        _passwordLabel.textAlignment = NSTextAlignmentRight;
    }
    return _passwordLabel;
}

#pragma mark - 监听事件
- (void)registerButtonClick:(UIButton *)button {

    if (self.registerBlock) {
        self.registerBlock(button);
        
    }
    
}

- (void)loginButtonClick:(UIButton *)button {

    if (self.loginBlock) {
        self.loginBlock(button);
        
    }
    
}



#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self initUI];
}
    return self;
}

- (void)initUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.usernameLabel];
    [self addSubview:self.passwordLabel];
    [self addSubview:self.usernameTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.loginBtn];
    [self addSubview:self.registerBtn];
    
    
    
    [_usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(100);
        make.left.mas_equalTo(self).offset(marginLeftRight);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    
    [_usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_usernameLabel);
        make.left.mas_equalTo(_usernameLabel.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-marginLeftRight);
        make.height.mas_equalTo(_usernameLabel);
    }];
    
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.usernameLabel.mas_bottom).offset(marginLeftRight);
        make.left.mas_equalTo(self).offset(marginLeftRight);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passwordLabel);
        make.left.mas_equalTo(_passwordLabel.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-marginLeftRight);
        make.height.mas_equalTo(_passwordLabel);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passwordLabel.mas_bottom).offset(50);
        make.left.mas_equalTo(self).offset(marginLeftRight);
        make.right.mas_equalTo(self.mas_right).offset(-marginLeftRight);
        make.height.mas_equalTo(40);
    }];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_loginBtn.mas_bottom).offset(marginLeftRight);
        make.left.mas_equalTo(self.mas_left).offset(marginLeftRight);
        make.right.mas_equalTo(self.mas_right).offset(-marginLeftRight);
        make.height.mas_equalTo(_loginBtn);
    }];
    
    
}

@end
