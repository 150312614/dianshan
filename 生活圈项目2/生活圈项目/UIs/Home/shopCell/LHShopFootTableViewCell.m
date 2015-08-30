//
//  LHShopFootTableViewCell.m
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHShopFootTableViewCell.h"

@interface LHShopFootTableViewCell ()



-(IBAction)moreBtnClick:(UIButton *)sender;

@end

@implementation LHShopFootTableViewCell

- (void)awakeFromNib {
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)moreBtnClick:(UIButton *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(shopFootView:didMoreBtnClick:)]) {
        [self.delegate shopFootView:self didMoreBtnClick:sender];
    }
}

@end
