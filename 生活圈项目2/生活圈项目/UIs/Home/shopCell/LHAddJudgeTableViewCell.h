//
//  LHAddJudgeTableViewCell.h
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHAddJudgeTableViewCell;
@protocol LHAddJudgeTableViewCellDelegate <NSObject>

- (void)addJudgeView:(LHAddJudgeTableViewCell *)addView didClickAddBtn:(UIButton *)btn cont:(NSString *)cont;

@end

@interface LHAddJudgeTableViewCell : UITableViewCell

@property (assign, nonatomic) int starScore;
@property (nonatomic,weak) id<LHAddJudgeTableViewCellDelegate> delegate;

@end
