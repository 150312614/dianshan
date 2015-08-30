//
//  LHGroupCollectionViewCell.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/14.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHGroupCollectionViewCell.h"

@interface LHGroupCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *naemLabel;

@end

@implementation LHGroupCollectionViewCell

- (void)awakeFromNib {
    
    
    
}

- (void)setModel:(LHGroupModel *)model
{
    _model = model;
    
    [self.iconImageView lh_setImageWithURLString:model.cover];
    self.naemLabel.text = model.title;
    

}

@end
