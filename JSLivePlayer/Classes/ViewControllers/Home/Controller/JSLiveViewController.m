//
//  JSLiveViewController.m
//  JSLivePlayer
//
//  Created by leo on 05/01/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import "JSLiveViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "JSHotRoomModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "JSHeartFlyView.h"

@interface JSLiveViewController ()

/** imgView */
@property (nonatomic, strong) UIImageView *imgView;
/** exitBtn */
@property (nonatomic, strong) UIButton *exitBtn;
/** player */
@property (nonatomic, strong) IJKFFMoviePlayerController *player;

@property (nonatomic, assign)CGFloat heartSize;
@property (nonatomic)NSTimer *splashTimer;

@end

@implementation JSLiveViewController

- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:_imgView];
    }
    return _imgView;
}

- (UIButton *)exitBtn {
    if (_exitBtn == nil) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitBtn setImage:[UIImage imageNamed:@"mg_room_btn_guan_h"] forState:UIControlStateNormal];
        _exitBtn.frame = CGRectMake(JSScreenWidth-50, JSScreenHeight-50, 50, 50);
        [_exitBtn addTarget:self action:@selector(exitPlay:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_exitBtn];
    }
    return _exitBtn;
}

// 退出播放
-(void)exitPlay:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *imgUrl = [NSURL URLWithString:self.roomModel.creator.portrait];
    [self.imgView sd_setImageWithURL:imgUrl];
    
    // 拉流地址
    NSURL *streamUrl = [NSURL URLWithString:self.roomModel.stream_addr];
    
    // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:streamUrl withOptions:nil];
    self.player.view.frame = [UIScreen mainScreen].bounds;
    // 准备播放
    [self.player prepareToPlay];
    [self.view insertSubview:self.player.view atIndex:1];
    [self.view bringSubviewToFront:self.exitBtn];
    
    self.splashTimer = [NSTimer scheduledTimerWithTimeInterval:0.1  target:self selector:@selector(rote) userInfo:nil repeats:YES];
    
}

-(void)rote{
    
    _heartSize = 35;
    
    JSHeartFlyView* heart = [[JSHeartFlyView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
