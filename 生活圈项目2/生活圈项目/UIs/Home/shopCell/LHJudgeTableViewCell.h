//
//  LHJudgeTableViewCell.h
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHShopDetailModel.h"

@interface LHJudgeTableViewCell : UITableViewCell

// 传递模型
@property (nonatomic,weak) LHShopCommentListModel *model;


-(CGFloat)getHeightForCell;
@end
