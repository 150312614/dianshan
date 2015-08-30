//
//  LHPopView.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/11.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHPopView.h"
#import "LHClickItemProtocol.h"

@implementation LHPopView

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
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.bounds];
    bg.image = [UIImage imageNamed:@"home_topbar"];
    self.hidden = YES;
    [self addSubview:bg];
    
    //添加按钮
    UIButton *shake = [LHFactory lhbuttonWithType:LHButtonTypeNormal title:@"摇一摇" rect:CGRectMake(0, 0, 156.0/640*kUIScreenWidth, kUIPopViewHeight) tag:5 target:self SEL:@selector(changeVC:)];
    [self addSubview:shake];
    
    UIButton *xmpp = [LHFactory lhbuttonWithType:LHButtonTypeNormal title:@"联系商家" rect:CGRectMake(168.0/640*kUIScreenWidth, 0, 150/640.0 * kUIScreenWidth, kUIPopViewHeight) tag:6 target:self SEL:@selector(changeVC:)];
    [self addSubview:xmpp];
    
    UIButton *online = [LHFactory lhbuttonWithType:LHButtonTypeNormal title:@"周边" rect:CGRectMake(355/640.0 * kUIScreenWidth, 0, 93 / 640.0 *kUIScreenWidth, kUIPopViewHeight) tag:7 target:self SEL:@selector(changeVC:)];
    [self addSubview:online];
    
}


- (void)changeVC:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(didClickItemIndex:)]) {
        [self.delegate didClickItemIndex:btn.tag];
    }
}

@end
