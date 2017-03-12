//
//  JSBottomView.h
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void(^ButtonBlock)(UIButton *);


@interface JSBottomView : UIView

/** 消息按钮 */
@property (nonatomic, strong) UIButton *messageButton;
/** 礼物按钮 */
@property (nonatomic, strong) UIButton *giftButton;
/** 分享按钮 */
@property (nonatomic, strong) UIButton *shareButton;



@property (nonatomic, copy) void (^buttonClick)(NSInteger tag);

/** <#desc#> */
//@property (nonatomic, copy) ButtonBlock block;
//
//- (void)addTapBlock:(ButtonBlock)block;

@end
