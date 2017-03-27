//
//  JSCommonTools.h
//  JSWeChat
//
//  Created by 李建舜 on 27/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSCommonTools : NSObject


+ (void)normalAlertWithTitle:(NSString *)title WithMessage:(NSString *)message WithPreferredStyle:(UIAlertControllerStyle)style WithController:(__kindof UIViewController *)controller;

@end
