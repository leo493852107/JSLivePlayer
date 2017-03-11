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


@end

@interface JSCustomSwitch : UIView


/** delegate */
@property (nonatomic, copy) id<JSCustomSwitchDelegate> delegate;

@end
