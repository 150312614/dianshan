//
//  LHLoginCollectionViewCell.m
//  生活圈项目
//
//  Created by apple on 15/8/17.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHLoginCollectionViewCell.h"

@interface LHLoginCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end


@implementation LHLoginCollectionViewCell

-(void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    
    _iconView.image = [UIImage imageNamed:dict[@"icon"]];
    _nameLabel.text = dict[@"name"];
    
    
}



@end
