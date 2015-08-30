//
//  LHNavBaseViewController.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/9.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHNavBaseViewController.h"

@interface LHNavBaseViewController ()

@end

#define kNavViewHeight 64
#define kNavStatusHeight 20
#define kNavButtonWidth 44
#define kNavButtonHeight 44

@implementation LHNavBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kNavViewHeight)];
    [self.navView setBackgroundColor:[UIColor colorWithRed:37/255.0 green:150/255.0 blue:234/255.0 alpha:1]];
    [self.view addSubview:self.navView];
    
    //左边的按钮
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(0, kNavStatusHeight, kNavButtonWidth, kNavButtonHeight);
    
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(backMethod) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navView addSubview:self.leftBtn];
    
    //中间的标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"电商";
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.navView addSubview:self.titleLabel];
    
    //右边的按钮
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.rightBtn addTarget:self action:@selector(loginMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.rightBtn];
    
}

//返回方法
- (void)backMethod
{
    
}

//登录方法
- (void)loginMethod
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    //隐藏tabbar
    self.navigationController.navigationBarHidden = YES;
    
    
    //计算字体rect
    CGRect rect = [self.titleLabel.text boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil];
    
    self.titleLabel.frame = CGRectMake((kUIScreenWidth - rect.size.width) * 0.5, kNavStatusHeight + (44 - rect.size.height) * 0.5, rect.size.width, rect.size.height);
    //登录成功
    if (false) {
        [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"nav_user"] forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"" forState:UIControlStateNormal];
        self.rightBtn.frame = CGRectMake(kUIScreenWidth - kNavButtonWidth, kNavStatusHeight, kNavButtonWidth, kNavButtonHeight);
    }
    else
    {
        [self.rightBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
        [self.rightBtn setBackgroundImage:nil forState:UIControlStateNormal];
        self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.rightBtn.frame = CGRectMake(kUIScreenWidth - 2 *kNavButtonWidth, kNavStatusHeight, 2 *kNavButtonWidth, kNavButtonHeight);
    }
    
    
    
    
    
    
    
    
}


@end
