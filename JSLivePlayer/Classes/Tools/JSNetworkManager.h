//
//  JSNetworkManager.h
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//  网络请求封装

#import <Foundation/Foundation.h>

typedef void (^HttpSuccess)(id responseObject);
typedef void (^HttpFailure)(NSError *error);

@interface JSNetworkManager : NSObject

+ (instancetype)shareNetworkManager;


- (void)GET:(NSString *)urlString
 parameters:(NSDictionary *)parameters
    success:(HttpSuccess)success
    failure:(HttpFailure)failure;


- (void)POST:(NSString *)urlString
  parameters:(NSDictionary *)parameters
     success:(HttpSuccess)success
     failure:(HttpFailure)failure;


@end
