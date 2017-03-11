//
//  JSAnchorView.m
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import "JSAnchorView.h"
#import "LiveModel.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@implementation JSAnchorView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = JSRGBAColor(0, 0, 0, 0.1);
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.liveLabel];
    [self addSubview:self.totalNumLabel];
    [self addSubview:self.payAttensionButton];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(2);
        make.width.height.mas_equalTo(32);
    }];
    
    [self.payAttensionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(2);
        make.right.bottom.equalTo(self).offset(-2);
        make.width.mas_equalTo(32);
    }];
    
    [self.liveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.top.equalTo(self.iconImageView.mas_top);
        make.right.equalTo(self.payAttensionButton.mas_left).offset(-10);
        make.height.mas_equalTo(16);
    }];
    
    [self.totalNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.top.equalTo(self.liveLabel.mas_bottom);
        make.right.equalTo(self.payAttensionButton.mas_left).offset(-10);
        make.height.mas_equalTo(16);
    }];
    
}

#pragma mark - 懒加载
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = 16;
        _iconImageView.layer.masksToBounds = YES;
        
        
    }
    return _iconImageView;
}

- (UILabel *)liveLabel {
    if (!_liveLabel) {
        _liveLabel = [[UILabel alloc] init];
        _liveLabel.textColor = [UIColor whiteColor];
        _liveLabel.text = @"主播名";
        _liveLabel.textAlignment = NSTextAlignmentLeft;
        _liveLabel.font = [UIFont systemFontOfSize:8];
    }
    return _liveLabel;
}

- (UILabel *)totalNumLabel {
    if (!_totalNumLabel) {
        _totalNumLabel = [[UILabel alloc] init];
        _totalNumLabel.textColor = [UIColor whiteColor];
        _totalNumLabel.text = @"0";
        _totalNumLabel.text = @"0人在线";
        _totalNumLabel.textAlignment = NSTextAlignmentLeft;
        _totalNumLabel.font = [UIFont systemFontOfSize:8];
    }
    return _totalNumLabel;
}

- (UIButton *)payAttensionButton {
    if (!_payAttensionButton) {
        _payAttensionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _payAttensionButton.layer.borderWidth = 1;
        _payAttensionButton.layer.borderColor = JSRGBColor(36, 216, 200).CGColor;
        _payAttensionButton.layer.cornerRadius = 16;
        _payAttensionButton.layer.masksToBounds = YES;
        [_payAttensionButton setImage:[UIImage imageNamed:@"guanzhuwo_icon"] forState:UIControlStateNormal];
        [_payAttensionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_payAttensionButton addTarget:self action:@selector(payAttensionButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payAttensionButton;
}


// 按钮点击
- (void)payAttensionButtonClick {
    if (self.anchorClick) {
        self.anchorClick();
    }
}



@end
