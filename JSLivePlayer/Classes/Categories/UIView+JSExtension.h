//
//  UIView+JSExtension.h
//  JSLivePlayer
//
//  Created by leo on 24/11/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JSExtension)

/** X */
@property (nonatomic, assign) CGFloat x;

/** Y */
@property (nonatomic, assign) CGFloat y;

/** Width */
@property (nonatomic, assign) CGFloat width;

/** Height */
@property (nonatomic, assign) CGFloat height;

/** size */
@property (nonatomic, assign) CGSize size;

/** centerX */
@property (nonatomic, assign) CGFloat centerX;

/** centerY */
@property (nonatomic, assign) CGFloat centerY;

/** tag */
@property (nonatomic, copy) NSString *tagStr;


// Shortcut for frame.origin.x
@property (nonatomic) CGFloat left;
// Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat right;
// Shortcut for frame.origin.y
@property (nonatomic) CGFloat top;
// Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat bottom;
// Shortcut for frame.origin
@property (nonatomic) CGPoint origin;

- (BOOL)isShowingOnKeyWindow;

+ (instancetype)viewFromXib;

@end
