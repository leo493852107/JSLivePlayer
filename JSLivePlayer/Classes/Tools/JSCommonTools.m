//
//  JSCommonTools.m
//  JSWeChat
//
//  Created by 李建舜 on 27/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import "JSCommonTools.h"

@implementation JSCommonTools

+ (void)normalAlertWithTitle:(NSString *)title WithMessage:(NSString *)message WithPreferredStyle:(UIAlertControllerStyle)style WithController:(__kindof UIViewController *)controller {
    //UIAlertController风格：UIAlertControllerStyleAlert
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    //添加取消到UIAlertController中
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    
    //添加确定到UIAlertController中
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:OKAction];
    
    [controller presentViewController:alertController animated:YES completion:nil];
    
}

@end
