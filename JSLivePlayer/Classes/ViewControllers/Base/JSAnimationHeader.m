//
//  JSAnimationHeader.m
//  JSLivePlayer
//
//  Created by 李建舜 on 09/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import "JSAnimationHeader.h"

@implementation JSAnimationHeader

#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare {
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSInteger i = 1; i <= 20; i++) {
        UIImage *orignImage = [UIImage imageNamed:[NSString stringWithFormat:@"refresh_fly_00%zd", i]];
        
        UIImage *image = [self scaleToSize:orignImage size:CGSizeMake(60, 52)];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//    NSMutableArray *refreshingImages = [NSMutableArray array];
//    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    // 没有素材，直接用上面的idle资源
    [self setImages:idleImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
//    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    [self setImages:idleImages forState:MJRefreshStateRefreshing];
}

//压缩图片
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
