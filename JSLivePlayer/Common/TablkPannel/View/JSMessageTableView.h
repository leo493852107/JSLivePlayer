//
//  JSMessageTableView.h
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSMessageModel.h"
#import "JSMessageCell.h"

@interface JSMessageNodeView : UIView

@property (nonatomic, strong) UIView *messageView;
@property (nonatomic, strong) UILabel*nodeLabel;
@property (nonatomic, strong) UIImageView *nodeImageView;
/** <#desc#> */
@property (nonatomic, copy) void (^TapBlock)();
- (void)show:(BOOL)isShow;
- (void)showNum:(int)num;

@end

@interface JSMessageTableView : UITableView <UITableViewDelegate,UITableViewDataSource,TYAttributedLabelDelegate>

/** <#desc#> */
@property (nonatomic, strong) NSMutableArray *data;
/** <#desc#> */
@property (nonatomic, strong) NSMutableArray *dataCache;
/** <#desc#> */
@property (nonatomic, strong) NSArray *giftInfo;
/** <#desc#> */
@property (nonatomic, assign) BOOL isNeedScroll;
/** <#desc#> */
@property (nonatomic, assign) BOOL isRightTime;
/** <#desc#> */
@property (nonatomic, assign) BOOL isShowNode;
/** <#desc#> */
@property (nonatomic, assign) int notLookNum;



/** <#desc#> */
@property (nonatomic, copy) void (^ShowNodeView)(BOOL show);
/** <#desc#> */
@property (nonatomic, copy) void (^ShowNodeNumber)(int num);


- (void)sendMessage:(JSMessageModel *)model;
- (void)scrollToEnd;



@end
