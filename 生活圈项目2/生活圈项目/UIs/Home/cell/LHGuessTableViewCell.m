//
//  LHGuessTableViewCell.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/15.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHGuessTableViewCell.h"

@interface LHGuessTableViewCell ()


@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end


@implementation LHGuessTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)setModel:(LHGuessModel *)model
{
    _model = model;
    
    [self.iconView lh_setImageWithURLString:model.cover];
    self.nameLabel.text = _model.title;
    self.subLabel.text = _model.intro;
    self.priceLabel.text = [NSString stringWithFormat:@"%@元",_model.price];
    
}

@end
