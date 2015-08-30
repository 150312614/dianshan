//
//  LHShopFootTableViewCell.h
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHShopFootTableViewCell;

@protocol LHShopFootTableViewCellDelegate <NSObject>

- (void)shopFootView:(LHShopFootTableViewCell *)footView didMoreBtnClick:(UIButton *)btn;

@end

@interface LHShopFootTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@property (weak, nonatomic) id<LHShopFootTableViewCellDelegate> delegate;

@end
