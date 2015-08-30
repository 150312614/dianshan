//
//  LHTabBarView.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/11.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHTabBarView.h"
#import "LHClickItemProtocol.h"

@implementation LHTabBarView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initView];
    }
    return self;
}

- (void) initView
{
    for (int i = 0; i < 5; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * kUIScreenWidth / 5, 0, kUIScreenWidth / 5, kUITabBarViewHeight);
        
        NSString *normal = [NSString stringWithFormat:@"home_%d",i];
        [btn setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
        NSString *select = [NSString stringWithFormat:@"home_%d_pressed",i];
        [btn setBackgroundImage:[UIImage imageNamed:select] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        if (i==0) {
            
            btn.selected = YES;
        }
        [self addSubview:btn];
    }

}


- (void)changeVC:(UIButton *)btn
{
    
    [self.subviews enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
        btn.selected = NO;
    }];
    btn.selected = YES;
    
    if ([self.delegate respondsToSelector:@selector(didClickItemIndex:)]) {
        [self.delegate didClickItemIndex:btn.tag];
    }
}


@end
