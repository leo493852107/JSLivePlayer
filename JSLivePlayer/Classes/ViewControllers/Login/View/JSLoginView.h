//
//  JSLoginView.h
//  JSWeChat
//
//  Created by 李建舜 on 23/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^registerBtnClick)(UIButton *btn);
typedef void(^loginBtnClick)(UIButton *btn);

@interface JSLoginView : UIView

/** <#desc#> */
@property (nonatomic, strong) UIImageView *backgroundView;

/** <#desc#> */
@property (nonatomic, strong) UILabel *usernameLabel;
/** <#desc#> */
@property (nonatomic, strong) UILabel *passwordLabel;
/** <#desc#> */
@property (nonatomic, strong) UILabel *emailLabel;
/** <#desc#> */
@property (nonatomic, strong) UITextField *usernameTextField;
/** <#desc#> */
@property (nonatomic, strong) UITextField *passwordTextField;
/** <#desc#> */
@property (nonatomic, strong) UITextField *emailTextField;
/** <#desc#> */
@property (nonatomic, strong) UIButton *registerBtn;
/** <#desc#> */
@property (nonatomic, strong) UIButton *loginBtn;


/** <#desc#> */
@property (nonatomic, copy) registerBtnClick registerBlock;
/** <#desc#> */
@property (nonatomic, copy) loginBtnClick loginBlock;



@end
