//
//  JSCustomSwitch.h
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSCustomSwitchDelegate <NSObject>

@required
- (void)customSwitchOn;
- (void)customSwitchOff;

@end

@interface JSCustomSwitch : UIView

/** 是否开弹幕 */
@property (nonatomic, assign, getter=isOn) BOOL on;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

/** delegate */
@property (nonatomic, copy) id<JSCustomSwitchDelegate> delegate;

@end
