//
//  JSCustomSwitch.m
//  JSLivePlayer
//
//  Created by 李建舜 on 10/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#define beishu 0.45

#import "JSCustomSwitch.h"


@interface JSCustomSwitch ()
{
    CGPoint beginPoint;
    NSLayoutConstraint *leftConstranint;
}
/** backgroundImageView */
@property (nonatomic, strong) UIImageView *backgroundImageView;
/** onOffImageView */
@property (nonatomic, strong) UIImageView *onOffImageView;
/** switchControl */
@property (nonatomic, strong) UISwitch *switchControl;
/** titleLabel */
@property (nonatomic, strong) UILabel *titleLabel;
/** <#desc#> */
@property (nonatomic, assign) BOOL isShowListViewRight;


@end

@implementation JSCustomSwitch


- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self setFrame:frame];
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.backgroundImageView.layer.cornerRadius = 6;
    [_backgroundImageView setBackgroundColor:[UIColor grayColor]];
    [self addSubview:_backgroundImageView];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *one = [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *two = [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *three = [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *four = [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self addConstraints:@[one, two, three, four]];
    
    _isShowListViewRight = NO;
    
    
    self.onOffImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.onOffImageView.backgroundColor = [UIColor whiteColor];
    self.onOffImageView.layer.cornerRadius = 3;
    [self addSubview:self.onOffImageView];
    
    NSLayoutConstraint *one1 = [NSLayoutConstraint constraintWithItem:self.onOffImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:2.0];
    leftConstranint = one1;
    NSLayoutConstraint *two1 = [NSLayoutConstraint constraintWithItem:self.onOffImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:2.0];
    NSLayoutConstraint *three1 = [NSLayoutConstraint constraintWithItem:self.onOffImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-2];
    NSLayoutConstraint *four1 = [NSLayoutConstraint constraintWithItem:self.onOffImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1-beishu constant:0];
    [self addConstraints:@[one1, two1, three1, four1]];
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.text = @"弹幕";
    self.titleLabel.textColor = [UIColor grayColor];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.onOffImageView addSubview:self.titleLabel];
    
    NSLayoutConstraint *one2 = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.onOffImageView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *two2 = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.onOffImageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *three2 = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.onOffImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *four2 = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.onOffImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    [self.onOffImageView addConstraints:@[one2, two2, three2, four2]];
    
    
}

- (void)setOn:(BOOL)on animated:(BOOL)animated {
    _isShowListViewRight = on;
    if (_isShowListViewRight) {
        [self swipeRightView:animated];
    } else {
        [self swipeLeftView:animated];
    }
}

- (void)swipeLeftView:(BOOL)animation {
    self.backgroundImageView.backgroundColor = [UIColor grayColor];
    self.titleLabel.textColor = [UIColor grayColor];
    
    leftConstranint.constant = 2;
    
    if (animation) {
        [UIView animateWithDuration:0.1 animations:^{
            [self layoutIfNeeded];
        }];
    } else {
        [self layoutIfNeeded];
    }

}

- (void)swipeRightView:(BOOL)animation {
    self.backgroundImageView.backgroundColor = JSRGBColor(47, 207, 111);
    self.titleLabel.textColor = JSRGBColor(47, 207, 111);
    
    leftConstranint.constant = 2;
    
    if (animation) {
        [UIView animateWithDuration:0.1 animations:^{
            [self layoutIfNeeded];
        }];
    } else {
        [self layoutIfNeeded];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    beginPoint = [touch locationInView:self];
    if (_isShowListViewRight == NO) {
        [self swipeRightView:YES];
        _isShowListViewRight = YES;
        if ([_delegate respondsToSelector:@selector(customSwitchOn)]) {
            [_delegate customSwitchOn];
        }
    } else {
        [self swipeLeftView:YES];
        _isShowListViewRight = NO;
        if ([_delegate respondsToSelector:@selector(customSwitchOff)]) {
            [_delegate customSwitchOff];
        }
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint newPoint = [touch locationInView:self];
    
    CGRect frame = self.frame;
    // TODO
    frame.origin.x += newPoint.x - beginPoint.x;
    if (frame.origin.x < self.frame.origin.x) {
        [self swipeLeftView:YES];
        _isShowListViewRight = NO;
        if ([_delegate respondsToSelector:@selector(customSwitchOff)]) {
            [_delegate customSwitchOff];
        }
    } else if (frame.origin.x > frame.size.width) {
        [self swipeRightView:YES];
        _isShowListViewRight = YES;
        if ([_delegate respondsToSelector:@selector(customSwitchOn)]) {
            [_delegate customSwitchOn];
        }
    }
    
}

@end
