//
//  JSBottomView.h
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSBottomView : UIView

/** <#desc#> */
@property (nonatomic, copy) void (^buttonClick)(NSInteger tag);

@end
