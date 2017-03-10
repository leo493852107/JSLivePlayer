//
//  JSLiveViewController.h
//  JSLivePlayer
//
//  Created by leo on 05/01/2017.
//  Copyright © 2017 leo. All rights reserved.
//  拉流

#import "JSBaseViewController.h"

@class LiveModel;
@interface JSLiveViewController : JSBaseViewController

/** model */
@property (nonatomic, strong) LiveModel *roomModel;

@end
