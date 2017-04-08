//
//  AppDelegate.m
//  JSLivePlayer
//
//  Created by leo on 23/11/2016.
//  Copyright © 2016 leo. All rights reserved.
//



#import "AppDelegate.h"
#import "JSLoginVC.h"
#import "JSRootTabViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UMConfigInstance.appKey = @"58df3ae45312dd0f20000681";
    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK！
    
    [Bmob registerWithAppKey:@"e22f1be95ee7577e4618ada4ef4638ad"];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[JSLoginVC alloc] init];
    
//    BOOL isAutoLogin = [[EaseMob sharedInstance].chatManager isAutoLoginEnabled];
//    if (!isAutoLogin) {
//        self.window.rootViewController = [[JSLoginVC alloc] init];
//    } else {
//        self.window.rootViewController = [[JSRootTabViewController alloc] init];
//    }
    
    if ([BmobUser currentUser]) {
        self.window.rootViewController = [[JSRootTabViewController alloc] init];
    } else {
        self.window.rootViewController = [[JSLoginVC alloc] init];
    }
    
    [self.window makeKeyWindow];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
