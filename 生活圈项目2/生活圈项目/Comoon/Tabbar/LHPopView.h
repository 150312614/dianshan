//
//  LHPopView.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/11.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LHClickItemProtocol;
@interface LHPopView : UIView


@property (nonatomic,weak) id<LHClickItemProtocol> delegate;

@end
