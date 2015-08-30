//
//  LHShopGoodsTableViewCell.m
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHShopGoodsTableViewCell.h"

@interface LHShopGoodsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkBtn;

@end

@implementation LHShopGoodsTableViewCell

- (void)awakeFromNib {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _checkBtn.layer.cornerRadius = 5;
    _checkBtn.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)checkGoodsClick:(id)sender {
}


@end
