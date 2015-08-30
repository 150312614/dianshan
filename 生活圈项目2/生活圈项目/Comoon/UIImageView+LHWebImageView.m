//
//  UIImageView+LHWebImageView.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/14.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "UIImageView+LHWebImageView.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (LHWebImageView)

- (void)lh_setImageWithURLString:(NSString *)urlStr
{
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    
}


@end
