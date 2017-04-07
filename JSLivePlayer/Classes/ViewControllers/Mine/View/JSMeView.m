//
//  JSMeView.m
//  JSWeChat
//
//  Created by 李建舜 on 27/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#define marginLeftRight 20

#import "JSMeView.h"
#import <Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation JSMeView

#pragma mark - 懒加载
- (UIImageView *)imgView {
    if (!_imgView) {
        NSString *imgStr = [[BmobUser currentUser] objectForKey:@"userIcon"];
        _imgView = [[UIImageView alloc] init];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:imgStr]];
        
        // 添加边框，圆角
        CALayer *layer = [_imgView layer];
        layer.borderColor = [[UIColor blackColor] CGColor];
        layer.borderWidth = 0.5f;
        layer.masksToBounds = YES;
        layer.cornerRadius = 25.0;
    }
    return _imgView;
}
#pragma mark - 懒加载
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
//        _nameLabel.text = [[[EaseMob sharedInstance].chatManager loginInfo] objectForKey:@"username"];
        _nameLabel.text = [BmobUser currentUser].username;
        _nameLabel.font = [UIFont systemFontOfSize:20];
        _nameLabel.textAlignment = NSTextAlignmentRight;
    }
    return _nameLabel;
}

- (UILabel *)emailLabel {
    if (!_emailLabel) {
        _emailLabel = [[UILabel alloc] init];
        //        _nameLabel.text = [[[EaseMob sharedInstance].chatManager loginInfo] objectForKey:@"username"];
        _emailLabel.text = [BmobUser currentUser].email;
        _emailLabel.font = [UIFont systemFontOfSize:15];
        _emailLabel.textAlignment = NSTextAlignmentRight;
    }
    return _emailLabel;
}

- (UIButton *)logoutBtn {
    if (!_logoutBtn) {
        _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _logoutBtn.backgroundColor = [UIColor redColor];
        [_logoutBtn.layer setMasksToBounds:YES];
        [_logoutBtn.layer setCornerRadius:3.0];
        [_logoutBtn addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutBtn;
}

#pragma mark - 监听事件
- (void)registerButtonClick:(UIButton *)button {
    
    if (self.logoutBlock) {
        self.logoutBlock(button);
        
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
    
    [self addSubview:self.imgView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.emailLabel];
    
    [self addSubview:self.logoutBtn];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(100);
        make.left.mas_equalTo(self).offset(marginLeftRight);
//        make.right.mas_equalTo(self.nameLabel.mas_left).offset(marginLeftRight);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_imgView.mas_top);
        make.left.mas_equalTo(self.imgView.mas_right).offset(marginLeftRight);
        make.right.mas_equalTo(self).offset(-marginLeftRight);
        make.height.mas_equalTo(30);
    }];
    
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLabel.mas_bottom);
        make.left.mas_equalTo(_nameLabel.mas_left);
        make.right.mas_equalTo(_nameLabel.mas_right);
        make.height.mas_equalTo(30);
    }];

    
    [_logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_emailLabel.mas_bottom).offset(marginLeftRight);
        make.left.mas_equalTo(self).offset(marginLeftRight);
        make.right.mas_equalTo(self).offset(-marginLeftRight);
        make.height.mas_equalTo(30);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
