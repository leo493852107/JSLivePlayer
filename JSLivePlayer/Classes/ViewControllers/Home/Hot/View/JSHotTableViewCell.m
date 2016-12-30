//
//  JSHotTableViewCell.m
//  JSLivePlayer
//
//  Created by leo on 10/12/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSHotTableViewCell.h"
#import "JSHotRoomModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface JSHotTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UIImageView *liveImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;


@end

@implementation JSHotTableViewCell


- (void)setModel:(JSHotRoomModel *)model {
    _model = model;
    
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", model.creator.portrait]];
    
    // 头像
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
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
