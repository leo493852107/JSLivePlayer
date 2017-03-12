//
//  JSKeyBoardInputView.m
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#define JSSendButtonColor JSRGBColor(47, 207, 11)
#define UpDownSpace 6
#define BetweenSpace 3


#import "JSKeyBoardInputView.h"
#import "JSCustomSwitch.h"
#import <Masonry.h>


@implementation JSTextField

// 控制显示文本的位置 默认(0,0,width,height)
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 2, 0);
}

// 控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 2, 0);
}

@end


@interface JSKeyBoardInputView () <UITextFieldDelegate, JSCustomSwitchDelegate>
{
    KeyboardInputViewType showType;
}
/** customSwitch */
@property (nonatomic, strong) JSCustomSwitch *customSwitch;
/** textField */
@property (nonatomic, strong) JSTextField *textField;
/** sendButton */
@property (nonatomic, strong) UIButton *sendButton;
/** 是否是弹幕 */
@property (nonatomic, assign, getter=isDanmu) BOOL danmu;


@end

@implementation JSKeyBoardInputView

- (void)beginEditTextField {
    if (self.textField.isFirstResponder) {
        return;
    }
    self.isEdit = YES;
    [self.textField becomeFirstResponder];
}

- (void)endEditTextField {
    if (self.textField.isFirstResponder) {
        self.isEdit = NO;
        [self.textField resignFirstResponder];
    }
}

#pragma mark - 自定义弹幕开关代理 JSCustomSwitchDelegate
- (void)customSwitchOn {
    self.danmu = YES;
    if (_delegate && [_delegate respondsToSelector:@selector(keyBoardDanmuOpen)]) {
        [_delegate keyBoardDanmuOpen];
    }
}

- (void)customSwitchOff {
    self.danmu = NO;
    if (_delegate && [_delegate respondsToSelector:@selector(keyBoardDanmuClose)]) {
        [_delegate keyBoardDanmuClose];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_delegate && [_delegate respondsToSelector:@selector(keyBoardSendMessage:withDanmu:)]) {
        [_delegate keyBoardSendMessage:_textField.text withDanmu:_danmu];
    }
    _textField.text = @"";
    return YES;
}

#pragma mark - 点击发送按钮触发点击事件
- (void)sendButtonEvent {
    if (_delegate && [_delegate respondsToSelector:@selector(keyBoardSendMessage:withDanmu:)]) {
        [_delegate keyBoardSendMessage:_textField.text withDanmu:_danmu];
    }
    _textField.text = @"";
}


- (instancetype)initWithStyle:(KeyboardInputViewType)type {
    self = [super init];
    if (self) {
        showType = type;
        [self initLayout];
    }
    return self;
}


#pragma mark - 初始化UI
- (void)initLayout {
    if (showType == KeyBoardInputViewTypeNomal) {
        _customSwitch = [[JSCustomSwitch alloc] init];
        _customSwitch.delegate = self;
        [self addSubview:_customSwitch];
        
        _textField = [[JSTextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.cornerRadius = 4;
        _textField.delegate = self;
        _textField.returnKeyType = UIReturnKeySend;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.placeholder = @"说点什么吧";
        [self addSubview:_textField];
        
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.layer.cornerRadius = 4;
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _sendButton.backgroundColor = JSSendButtonColor;
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(sendButtonEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendButton];
        
        [_customSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(UpDownSpace);
            make.bottom.equalTo(self.mas_bottom).offset(-UpDownSpace);
            make.width.equalTo(_customSwitch.mas_height).multipliedBy(1.65);
        }];
        
        [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(0);
            make.top.equalTo(self.mas_top).offset(UpDownSpace);
            make.bottom.equalTo(self.mas_bottom).offset(-UpDownSpace);
            make.width.equalTo(_customSwitch.mas_width);
        }];
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_customSwitch.mas_right).offset(BetweenSpace);
            make.top.equalTo(self.mas_top).offset(UpDownSpace);
            make.bottom.equalTo(self.mas_bottom).offset(-UpDownSpace);
            make.right.equalTo(_sendButton.mas_left).offset(-BetweenSpace);
        }];
    } else {
        // 弹幕
//        _customSwitch = [[JSCustomSwitch alloc] init];
//        _customSwitch.delegate = self;
//        [self addSubview:_customSwitch];
        
        _textField = [[JSTextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.cornerRadius = 4;
        _textField.delegate = self;
        _textField.returnKeyType = UIReturnKeySend;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.placeholder = @"说点什么吧";
        [self addSubview:_textField];
        
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.layer.cornerRadius = 4;
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _sendButton.backgroundColor = JSSendButtonColor;
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(sendButtonEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendButton];
        
//        [_customSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).offset(0);
//            make.top.equalTo(self.mas_top).offset(UpDownSpace);
//            make.bottom.equalTo(self.mas_bottom).offset(-UpDownSpace);
//            make.width.equalTo(_customSwitch.mas_height).multipliedBy(1.65);
//        }];
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_right).offset(BetweenSpace);
            make.top.equalTo(self.mas_top).offset(UpDownSpace);
            make.bottom.equalTo(self.mas_bottom).offset(-UpDownSpace);
            make.right.equalTo(_sendButton.mas_left).offset(-BetweenSpace);
        }];
        
        [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(0);
            make.top.equalTo(self.mas_top).offset(UpDownSpace);
            make.bottom.equalTo(self.mas_bottom).offset(-UpDownSpace);
            make.width.equalTo(_customSwitch.mas_height).multipliedBy(1.65);
        }];
        
      
    }
}


@end
