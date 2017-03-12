//
//  JSMessageCell.h
//  JSLivePlayer
//
//  Created by 李建舜 on 12/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYAttributedLabel.h"

@class JSMessageModel;

@interface JSMessageCell : UITableViewCell

/** <#desc#> */
@property (nonatomic, weak, readonly) TYAttributedLabel *label;
/** <#desc#> */
@property (nonatomic, strong) JSMessageModel *model;

@end
