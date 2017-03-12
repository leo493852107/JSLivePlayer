//
//  JSBottomView.m
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import "JSBottomView.h"

@interface JSBottomView ()

/** imageArray */
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation JSBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = JSRGBAColor(0, 0, 0, 0.1);
        [self initUI];
    }
    return self;
}

- (void)initUI {
    for (NSInteger i = 0; i < self.imageArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:self.imageArray[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

        button.tag = 100 + i;
        if (i == 0) {
            button.frame = CGRectMake(10, 10, 40, 40);
        } else {
            button.frame = CGRectMake((JSScreenWidth-180)+(i-1)*60, 10, 40, 40);
        }
        [self addSubview:button];
    }
}


//- (void)addTapBlock:(ButtonBlock)block {
//    JSLog(@"%s-----4", __func__);
//    _block = block;
//    
//}
//
//
//// 重写button的点击事件的方法
//- (void)buttonAction:(UIButton *)button {
//    JSLog(@"%s---5", __func__);
//    _block(button);
//}


- (void)buttonClick:(id)sender {
    UIButton *tagButton = (UIButton *)sender;
    if (self.buttonClick) {
        self.buttonClick(tagButton.tag);
    }
}

#pragma mark - 懒加载
- (NSArray *)imageArray {
    if (!_imageArray) {
        _imageArray = @[@"mg_room_btn_liao_h", @"mg_room_btn_liwu_h", @"mg_room_btn_fenxiang_h"];
    }
    return _imageArray;
}

@end
