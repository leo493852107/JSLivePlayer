//
//  JSRootTabViewController.m
//  JSLivePlayer
//
//  Created by leo on 09/12/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSRootTabViewController.h"
#import "JSHomeViewController.h"
#import "JSMineViewController.h"
#import "JSBaseNavigationController.h"

@interface JSRootTabViewController ()

@end

@implementation JSRootTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllTabBarButton];
    
}


//设置tabBar上的按钮
- (void)setUpAllTabBarButton {
    JSHomeViewController *homeVC = [[JSHomeViewController alloc] init];
    homeVC.tabBarItem.image = [UIImage imageNamed:@"tab_live"];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_live_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    JSBaseNavigationController *homeNav = [[JSBaseNavigationController alloc] initWithRootViewController:homeVC];
    [self addChildViewController:homeNav];
    
    JSMineViewController *mineVC = [[JSMineViewController alloc] init];
    mineVC.tabBarItem.image = [UIImage imageNamed:@"tab_me"];
    mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_me_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    JSBaseNavigationController *mineNav = [[JSBaseNavigationController alloc] initWithRootViewController:mineVC];
    [self addChildViewController:mineNav];
    
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
