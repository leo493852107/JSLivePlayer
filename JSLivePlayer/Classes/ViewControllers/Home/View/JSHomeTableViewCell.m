//
//  JSHomeTableViewCell.m
//  JSLivePlayer
//
//  Created by 李建舜 on 06/03/2017.
//  Copyright © 2017 leo. All rights reserved.
//

#import "JSHomeTableViewCell.h"
#import "LiveModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface JSHomeTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UIImageView *liveImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;

@end

@implementation JSHomeTableViewCell



- (void)setModel:(LiveModel *)model {
    _model = model;
    
    // 头像
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", model.creator.portrait]];
    [self.headImgView sd_setImageWithURL:imageUrl];
    
    // 城市
    if (model.city.length == 0) {
        _addressLabel.text = @"难道在火星?";
    } else {
        _addressLabel.text = model.city;
    }
    // 名称
    _nameLabel.text = model.creator.nick;
    // 封面
    [_liveImgView sd_setImageWithURL:imageUrl];
    // 观众
    NSString *people = [NSString stringWithFormat:@"%zd人", model.online_users];
    _peopleLabel.text = people;
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
