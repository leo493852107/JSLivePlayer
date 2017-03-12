//
//  JSMessageModel.h
//  JSLivePlayer
//
//  Created by 李建舜 on 12/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, CellType) {
    CellBanType,                // 禁号
    CellNewChatMessageType,     // 新消息
    CellNewGiftType,            // 礼品
    CellNewUserEnterType,       // 人物进入
    CellDeserveType,            //
};

@class TYTextContainer;

@interface JSMessageModel : NSObject


@property (nonatomic,strong)TYTextContainer *textContainer;
@property (nonatomic,copy)NSString *unColoredMsg;
@property (nonatomic,assign)CellType cellType;
@property (nonatomic,strong)NSArray *gift;
@property (nonatomic,copy)NSString *dataString;

- (void)setModelFromStirng:(NSString *)string;

- (void)setModel:(NSString*)userID withName:(NSString*)name withIcon:(NSString*)icon withType:(CellType)type withMessage:(NSString*)message;

@end
