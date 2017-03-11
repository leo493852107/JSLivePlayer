//
//  JSPresentView.h
//  JSLivePlayer
//
//  Created by 李建舜 on 11/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSPresentViewDelegate <NSObject>



@end

@interface JSPresentView : UIView

/** <#desc#> */
@property (nonatomic, copy) id<JSPresentViewDelegate> delegate;


@end
