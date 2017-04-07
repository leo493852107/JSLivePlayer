//
//  JSMeView.h
//  JSWeChat
//
//  Created by 李建舜 on 27/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^logoutBtnClick)(UIButton *btn);

@interface JSMeView : UIView

/** <#desc#> */
@property (nonatomic, strong) UILabel *nameLabel;

/** <#desc#> */
@property (nonatomic, strong) UIImageView *imgView;

/** <#desc#> */
@property (nonatomic, strong) UIButton *logoutBtn;

/** <#desc#> */
@property (nonatomic, copy) logoutBtnClick logoutBlock;


@end
