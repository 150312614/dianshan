//
//  LHFamousTableViewCell.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/15.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LHFamousTableViewCellDelegate <NSObject>

- (void)didLHFamousTableViewCellClickItem:(NSIndexPath *)indexPath;

@end

@interface LHFamousTableViewCell : UITableViewCell

@property (nonatomic,strong) LHFamousListModel *list;

@property (nonatomic,weak) id<LHFamousTableViewCellDelegate> delegate;

@end
