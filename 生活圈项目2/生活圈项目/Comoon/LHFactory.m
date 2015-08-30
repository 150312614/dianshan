//
//  LHFactory.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/10.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHFactory.h"

@implementation LHFactory


//快速创建button
+ (UIButton *)lhbuttonWithType:(LHButtonType)type
                         title:(NSString *)title
                          rect:(CGRect)rect
                           tag:(NSInteger)tag
                        target:(id)target
                           SEL:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.tag = tag;
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    if (type == LHButtonTypeNormal)
    {
        
    }
    else if (type == LHButtonTypeCorner)
    {
        btn.layer.cornerRadius = 5;
    }
    return btn;
}

@end
