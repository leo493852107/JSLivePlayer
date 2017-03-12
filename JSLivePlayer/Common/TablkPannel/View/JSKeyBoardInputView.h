//
//  JSKeyBoardInputView.h
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//  聊天输入框

#import <UIKit/UIKit.h>

@interface JSTextField : UITextField

@end


@protocol JSKeyBoardInputViewDelegate <NSObject>
@required
// 发送消息
- (void)keyBoardSendMessage:(NSString *)message withDanmu:(BOOL)danmu;

@optional
// 键盘打开弹幕
- (void)keyBoardDanmuOpen;
// 键盘关闭弹幕
- (void)keyBoardDanmuClose;

@end


typedef NS_ENUM(NSInteger, KeyboardInputViewType) {
    KeyBoardInputViewTypeNomal,
    KeyBoardInputViewTypeDanMu,
};

@interface JSKeyBoardInputView : UIView

/** 是否编辑 */
@property (nonatomic, assign) BOOL isEdit;


/** delegate */
@property (nonatomic, weak) id<JSKeyBoardInputViewDelegate> delegate;


- (instancetype)initWithStyle:(KeyboardInputViewType)type;

- (void)beginEditTextField;

- (void)endEditTextField;

@end
