//
//  JSLiveViewController.h
//  JSLivePlayer
//
//  Created by leo on 05/01/2017.
//  Copyright © 2017 leo. All rights reserved.
//  拉流

#import "JSBaseViewController.h"

@class JSAnchorView, JSBottomView, JSMessageTableView, JSKeyBoardInputView, JSDanmuLaunchView, JSPresentView, JSSendGiftView;
@class LiveModel;
@interface JSLiveViewController : JSBaseViewController


/** 直播间顶部区域 */
@property (nonatomic, strong) JSAnchorView *anchorView;
/** 底部工具栏 */
@property (nonatomic, strong) JSBottomView *bottomView;
/** 聊天输入框 */
@property (nonatomic, strong) JSKeyBoardInputView *keyBoardInputView;
/** 聊天面板 */
@property (nonatomic, strong) JSMessageTableView *messageTableView;
/** 弹幕 */
@property (nonatomic, strong) JSDanmuLaunchView *danmuView;
/** 显示连击动画区域 */
@property (nonatomic, strong) JSPresentView *presentView;
/** 礼物栏 */
@property (nonatomic, copy) JSSendGiftView *giftView;


/** 直播模型 */
@property (nonatomic, strong) LiveModel *liveModel;

@end
