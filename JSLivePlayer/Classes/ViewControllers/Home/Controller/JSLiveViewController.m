//
//  JSLiveViewController.m
//  JSLivePlayer
//
//  Created by leo on 05/01/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#define JSMessageTableViewY 180
#define JSMessageTableViewHeight 120
#define JSkeyBoardInputViewHeight 44

#define ItemHeight 35
#define ItemSpace 5


#import "JSLiveViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "LiveModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry.h>
#import "DMHeartFlyView.h"
#import "JSAnchorView.h"
#import "JSBottomView.h"
#import "JSMessageTableView.h"
#import "JSKeyBoardInputView.h"
#import "JSDanmuLaunchView.h"
#import "JSPresentView.h"
#import "JSSendGiftView.h"

@interface JSLiveViewController () <JSKeyBoardInputViewDelegate, JSPresentViewDelegate>

/** 顶层视图 */
@property (nonatomic, strong) UIView *topView;
/** 直播窗口 */
@property (nonatomic, strong) UIView *showView;

/** backgroundImage */
@property (nonatomic, strong) UIImageView *backgroundImageView;
/** exitBtn */
@property (nonatomic, strong) UIButton *exitBtn;
/** player */
@property (nonatomic, strong) IJKFFMoviePlayerController *player;

@property (nonatomic, assign)CGFloat heartSize;
@property (nonatomic)NSTimer *splashTimer;

@end

@implementation JSLiveViewController

#pragma mark - 懒加载
- (JSSendGiftView *)giftView {
    if (!_giftView) {
        _giftView = [[JSSendGiftView alloc] initWithFrame:self.view.bounds];
    }
    return _giftView;
}

- (JSPresentView *)presentView {
    if (!_presentView) {
        _presentView = [[JSPresentView alloc] initWithFrame:CGRectMake(0, 150, CGRectGetWidth(self.view.frame)/2, 120)];
        _presentView.delegate = self;
        _presentView.backgroundColor = [UIColor clearColor];
    }
    return _presentView;
}

- (JSDanmuLaunchView *)danmuView {
    if (!_danmuView) {
        _danmuView = [[JSDanmuLaunchView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(self.messageTableView.frame)-(ItemHeight*3+ItemSpace*2), self.view.frame.size.width, ItemHeight*3+ItemSpace*2)];
    }
    return _danmuView;
}

- (JSKeyBoardInputView *)keyBoardInputView {
    if (!_keyBoardInputView) {
        _keyBoardInputView = [[JSKeyBoardInputView alloc] initWithStyle:KeyBoardInputViewTypeNomal];
        _keyBoardInputView.backgroundColor = [UIColor clearColor];
        _keyBoardInputView.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame), JSScreenWidth, JSkeyBoardInputViewHeight);
        _keyBoardInputView.delegate = self;
    }
    return _keyBoardInputView;
}

- (JSMessageTableView *)messageTableView {
    if (!_messageTableView) {
        _messageTableView = [[JSMessageTableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame)-JSMessageTableViewY, JSScreenWidth/3*2, JSMessageTableViewHeight)];
    }
    return _messageTableView;
}

- (JSBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[JSBottomView alloc] initWithFrame:CGRectMake(0, JSScreenHeight - 64, JSScreenWidth, 64)];
        __weak typeof(self)weakSelf = self;
        
        JSLog(@"%s-----3", __func__);
        // 添加点击事件
        [_bottomView addTapBlock:^(UIButton *button) {
            // 在视图控制器中调用button的block方法
            JSLog(@"%s-----6", __func__);
            JSLog(@"按钮被点击了---6");
        }];
        
//        [_bottomView setButtonClick:^(NSInteger tag) {
//            switch (tag) {
//                case 100:
//                    // 发送消息/弹幕
//                {
//                    if (weakSelf.keyBoardInputView) {
//                        [weakSelf.keyBoardInputView beginEditTextField];
//                    }
//                }
//                    break;
//                case 101:
//                    // 礼物
//                {
//                    
//                }
//                    break;
//                    
//                default:
//                    break;
//            }
//        }];
        
    }
    return _bottomView;
}

- (JSAnchorView *)anchorView {
    if (!_anchorView) {
        _anchorView = [[JSAnchorView alloc] initWithFrame:CGRectMake(10, 30, 150, 36)];
        
        NSString *portrait = self.liveModel.creator.portrait;
        [_anchorView.iconImageView sd_setImageWithURL:[NSURL URLWithString:portrait]];
        
        _anchorView.liveLabel.text = [NSString stringWithFormat:@"%@", self.liveModel.creator.nick];
        _anchorView.totalNumLabel.text = [NSString stringWithFormat:@"%ld", self.liveModel.online_users];
        
        [self.anchorView setAnchorClick:^{
            JSLog(@"点击了直播头像");
        }];
        
    }
    return _anchorView;
}

// 最上层视图
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:self.view.bounds];
        _topView.backgroundColor = [UIColor clearColor];
    }
    return _topView;
}

- (UIView *)showView {
    if (!_showView) {
        _showView = [[UIView alloc] init];
        _showView.frame = self.view.bounds;
        _showView.backgroundColor = [UIColor whiteColor];
    }
    return _showView;
}

- (UIImageView *)backgroundImageView {
    if (_backgroundImageView == nil) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        
        NSURL *imgUrl = [NSURL URLWithString:self.liveModel.creator.portrait];
        [_backgroundImageView sd_setImageWithURL:imgUrl];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        // 毛玻璃效果
        UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        visualEffectView.frame = _backgroundImageView.bounds;
        [_backgroundImageView addSubview:visualEffectView];
    }
    return _backgroundImageView;
}

- (UIButton *)exitBtn {
    if (!_exitBtn) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitBtn setImage:[UIImage imageNamed:@"mg_room_btn_guan_h"] forState:UIControlStateNormal];
        [_exitBtn addTarget:self action:@selector(exitPlay:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitBtn;
}

// 退出播放
-(void)exitPlay:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 注册键盘通知
- (void)registerForKeyboardChangeNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

// 键盘弹起
- (void)keyboardWillShow:(NSNotification *)notifaction {
    NSDictionary *info = [notifaction userInfo];
    CGRect keyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (self.keyBoardInputView) {
        self.keyBoardInputView.frame = CGRectMake(self.keyBoardInputView.frame.origin.x, CGRectGetMaxY(self.view.frame)-CGRectGetHeight(self.keyBoardInputView.frame)-keyboardRect.size.height, CGRectGetWidth(self.keyBoardInputView.frame), CGRectGetHeight(self.keyBoardInputView.frame));
    }
    
    if (self.messageTableView) {
        self.messageTableView.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame)-CGRectGetHeight(self.keyBoardInputView.frame)-keyboardRect.size.height-CGRectGetHeight(self.messageTableView.frame)-10, CGRectGetWidth(self.messageTableView.frame), 120);
    }
    
    if (self.danmuView) {
        self.danmuView.frame = CGRectMake(self.danmuView.frame.origin.x, CGRectGetMinY(self.messageTableView.frame)-CGRectGetHeight(self.danmuView.frame), CGRectGetWidth(self.danmuView.frame), CGRectGetHeight(self.danmuView.frame));
    }
    
}

// 键盘隐藏
- (void)keyboardWillHide:(NSNotification *)notifaction {
    if (self.keyBoardInputView) {
        self.keyBoardInputView.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame), self.view.bounds.size.width, 44);
    }
    if (self.messageTableView) {
        self.messageTableView.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame)-180, CGRectGetWidth(self.view.frame)/3*2, 120);
    }
    if (self.danmuView) {
        self.danmuView.frame = CGRectMake(self.danmuView.frame.origin.x, CGRectGetMinY(self.messageTableView.frame)-CGRectGetHeight(self.danmuView.frame), CGRectGetWidth(self.danmuView.frame), CGRectGetHeight(self.danmuView.frame));
    }
}


#pragma mark - view加载到内存
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    
    
//    // 拉流地址
//    NSURL *streamUrl = [NSURL URLWithString:self.roomModel.stream_addr];
//    
//    // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
//    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:streamUrl withOptions:nil];
//    self.player.view.frame = [UIScreen mainScreen].bounds;
//    // 准备播放
//    [self.player prepareToPlay];
//    [self.view insertSubview:self.player.view atIndex:1];
//    [self.view bringSubviewToFront:self.exitBtn];
//    
//    self.splashTimer = [NSTimer scheduledTimerWithTimeInterval:0.1  target:self selector:@selector(rote) userInfo:nil repeats:YES];
    
}

#pragma mark - 初始化UI
- (void)createUI {
    [self.view addSubview:self.showView];
    [self.showView addSubview:self.backgroundImageView];
    [self.view insertSubview:self.topView aboveSubview:self.showView];
    [self.view addSubview:self.exitBtn];
    
    // 头像
    [self.view addSubview:self.anchorView];
    // 底部工具条
    [self.topView addSubview:self.bottomView];
//    
//    [self.topView addSubview:self.keyBoardInputView];
//    [self.topView addSubview:self.messageTableView];
//    [self.topView addSubview:self.presentView];
    
    
//    [self.view addSubview:self.danmuView];
    
    
    [self.exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-14);
        make.right.equalTo(self.view).offset(-10);
        make.width.height.mas_equalTo(40);
    }];
    
    
    [self registerForKeyboardChangeNotifications];
    
    __weak typeof(self)weakSelf = self;
    // 送礼物
//    [self.giftView setGiftClick:^(NSInteger tag) {
//        [weakSelf ]
//    }]
    // 底部工具栏
    [self.giftView setGrayClick:^{
        [weakSelf showBottomTools];
    }];
    
}

#pragma mark - 底部工具栏
//显示工具栏
- (void)showBottomTools {
    // position 图层中心点位置
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.5f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(JSScreenWidth/2, JSScreenHeight-32)];
    [self.bottomView.layer addAnimation:animation forKey:@"positionShow"];
}

// 隐藏工具栏
- (void)hideBottomTools {
    // position 图层中心点位置
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.3f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(JSScreenWidth/2, JSScreenHeight+32)];
    [self.bottomView.layer addAnimation:animation forKey:@"positionHide"];
    [self performSelector:@selector(popShowGiftView) withObject:nil afterDelay:0.5];
    
}

//显示送礼物界面
- (void)popShowGiftView {
    
}

-(void)rote{
    
    _heartSize = 35;
    
    DMHeartFlyView* heart = [[DMHeartFlyView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(JSScreenWidth-_heartSize, self.view.bounds.size.height - _heartSize/2.0 - 10);
    heart.center = fountainSource;
    [heart animateInView:self.view];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([self.splashTimer isValid]) {
        self.splashTimer = nil;
    }
    
    // 界面消失，一定要记得停止播放
    [_player pause];
    [_player stop];
    [_player shutdown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
