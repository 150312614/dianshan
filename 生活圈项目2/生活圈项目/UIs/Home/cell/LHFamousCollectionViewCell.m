//
//  LHFamousCollectionViewCell.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/15.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHFamousCollectionViewCell.h"

@interface LHFamousCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *starImage;


@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIButton *distanceButton;

@end

@implementation LHFamousCollectionViewCell

- (void)awakeFromNib {
    
}

- (void)setModel:(LHFamousModel *)model
{
    _model = model;
    
    _nameLabel.text = _model.name;
    _starImage.image = [UIImage imageNamed:@"star_0"];
    [_iconImageView lh_setImageWithURLString:_model.cover];
    _introLabel.text = _model.intro;
    _distanceButton.titleLabel.text = [NSString stringWithFormat:@"距离%@",_model.distance];
}

@end
