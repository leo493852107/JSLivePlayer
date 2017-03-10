//
//  JSLiveModel.h
//  JSLivePlayer
//
//  Created by 李建舜 on 06/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Creator : NSObject

/** 主播名 */
@property (nonatomic, copy) NSString *nick;
/** 主播头像 */
@property (nonatomic, copy) NSString *portrait;

@end

@interface LiveModel : NSObject


/** 直播流地址 */
@property (nonatomic, copy) NSString *stream_addr;
/** 收看人数 */
@property (nonatomic, assign) NSUInteger online_users;
/** 所在城市 */
@property (nonatomic, copy) NSString *city;
/** 主播 */
@property (nonatomic, strong) Creator *creator;

@end
