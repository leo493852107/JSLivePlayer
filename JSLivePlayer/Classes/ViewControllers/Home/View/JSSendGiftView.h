//
//  JSSendGiftView.h
//  JSLivePlayer
//
//  Created by 李建舜 on 11/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSSendGiftView : UIView

/** <#desc#> */
@property (nonatomic, copy) void (^giftClick) (NSInteger tag);

/** 点击底部工具栏 */
@property (nonatomic, copy) void (^grayClick) ();

@end
