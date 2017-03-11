//
//  JSAnchorView.h
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//  直播间顶部区域

#import <UIKit/UIKit.h>

@class LiveModel;

@interface JSAnchorView : UIView


/** 头像 */
@property (nonatomic, strong) UIImageView *iconImageView;
/** 直播 */
@property (nonatomic, strong) UILabel *liveLabel;
/** 在线人数 */
@property (nonatomic, strong) UILabel *totalNumLabel;
/** 关注按钮 */
@property (nonatomic, strong) UIButton *payAttensionButton;


/** <#desc#> */
@property (nonatomic, copy) void (^anchorClick)();




@end
