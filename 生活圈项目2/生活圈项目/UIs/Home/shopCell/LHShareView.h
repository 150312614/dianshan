//
//  LHShareView.h
//  生活圈项目
//
//  Created by apple on 15/8/17.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LHShareViewDelegate <NSObject>

-(void)didWBShare;

@end

@interface LHShareView : UITableViewCell

@property (nonatomic,weak) id<LHShareViewDelegate> delegate;

@end
