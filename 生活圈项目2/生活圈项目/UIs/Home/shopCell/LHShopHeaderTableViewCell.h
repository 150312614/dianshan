//
//  LHShopHeaderTableViewCell.h
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHShopDetailModel.h"

@protocol LHShopHeaderTableViewCellDelegate <NSObject>

-(void)didShareBtnClick;
- (void)headerViewDidClickLocationBtn;
-(void)headerViewDidClickPhoneBtn:(NSString *)phoneNumber;

@end

@interface LHShopHeaderTableViewCell : UITableViewCell

-(CGFloat)getHeight;

@property (nonatomic,strong) LHShopDetailModel *detail;

@property (nonatomic,weak) id<LHShopHeaderTableViewCellDelegate> delegate;

@end
