//
//  JSHotRoomModel.h
//  JSLivePlayer
//
//  Created by leo on 10/12/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Creator : NSObject

/** 主播名 */
@property (nonatomic, copy) NSString *nick;
/** 主播头像 */
@property (nonatomic, copy) NSString *portrait;

@end

@interface JSHotRoomModel : NSObject


/** 直播流地址 */
@property (nonatomic, copy) NSString *stream_addr;
/** 关注人 */
@property (nonatomic, assign) NSUInteger online_users;
/** 城市 */
@property (nonatomic, copy) NSString *city;
/** 主播 */
@property (nonatomic, strong) Creator *creator;

@end
