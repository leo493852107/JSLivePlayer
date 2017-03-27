//
//  JSBaseNavigationController.m
//  JSLivePlayer
//
//  Created by leo on 10/12/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSBaseNavigationController.h"

@interface JSBaseNavigationController ()

@end

@implementation JSBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor redColor];
    self.navigationBar.barStyle = UIBarStyleBlack;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.navigationController.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
